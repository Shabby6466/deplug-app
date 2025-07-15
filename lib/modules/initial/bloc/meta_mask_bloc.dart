import 'package:deplug/core/network_calls/dio_wrapper/index.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:deplug/modules/initial/usecase/auth/set_token_use_case.dart';
import 'package:deplug/modules/initial/usecase/auth/validate_address_use_case.dart';
import 'package:deplug/modules/initial/usecase/wallet/connect_meta_mask_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reown_appkit/reown_appkit.dart';

class MetamaskBloc extends Bloc<MetamaskEvent, MetamaskState> {
  final ConnectMetamaskUsecase connectMetamaskUsecase;
  final ValidateAddressUseCase validateAddressUseCase;
  final SaveTokenUseCase saveTokenUseCase;

  MetamaskBloc({
    required this.connectMetamaskUsecase,
    required this.validateAddressUseCase,
    required this.saveTokenUseCase,
  }) : super(MetamaskChangeState.initial()) {
    on<ConnectMetamaskEvent>(_connectMetamaskEvent);
    on<WalletSelectedEvent>(_onWalletSelected);
    on<ValidateAddressEvent>(_validateAddressEvent);
    on<ClearAppKitEvent>(_clearAppKitEvent);
    on<ClearMetamaskStateEvent>(_clearMetamaskState);
  }

  void _clearMetamaskState(ClearMetamaskStateEvent event, Emitter<MetamaskState> emit) {
    emit(ClearMetamaskStateSuccess(
      loading: false,
      errMsg: '',
      connectionStatus: WalletConnectionStatus.disconnected,
      appkit: null,
      walletId: '',
      validateAddressOutput: ValidateAddressOutput.initial(),
      token: '',
    ));
  }

  Future<void> _connectMetamaskEvent(ConnectMetamaskEvent event, Emitter<MetamaskState> emit) async {
    emit(getBlocState(loading: true));
    try {
      await connectMetamaskUsecase(NoParams());

      emit(getBlocState(
        loading: false,
        connectionStatus: WalletConnectionStatus.connected,
      ));
    } catch (e) {
      emit(getBlocState(
        loading: false,
        errMsg: e.toString(),
        connectionStatus: WalletConnectionStatus.failed,
      ));
    }
  }

  void _clearAppKitEvent(ClearAppKitEvent event, Emitter<MetamaskState> emit) {
    emit(getBlocState(appKit: null));
  }

  Future<void> _onWalletSelected(
    WalletSelectedEvent event,
    Emitter<MetamaskState> emit,
  ) async {
    try {
      emit(getBlocState(
        loading: false,
        connectionStatus: WalletConnectionStatus.connected,
        walletId: event.walletId,
      ));
    } catch (e) {
      emit(getBlocState(
        loading: false,
        errMsg: e.toString(),
        connectionStatus: WalletConnectionStatus.failed,
      ));
    }
  }

  Future<void> _validateAddressEvent(ValidateAddressEvent event, Emitter<MetamaskState> emit) async {
    try {
      emit(getBlocState(loading: true));
      var res = await validateAddressUseCase.call(ValidateAddressInput(address: event.address));
      var token = res.token;
      await saveTokenUseCase.call(token);
      emit(ValidateSuccessState(
          loading: false,
          errMsg: state.errMsg,
          connectionStatus: state.connectionStatus,
          appkit: state.appkit,
          walletId: state.walletId,
          validateAddressOutput: res,
          token: token));
    } on DefaultFailure catch (e) {
      emit(ValidateErrorState(
          loading: false,
          errMsg: e.message,
          connectionStatus: state.connectionStatus,
          appkit: state.appkit,
          walletId: state.walletId,
          validateAddressOutput: state.validateAddressOutput,
          token: state.token));
    }
  }

  MetamaskState getBlocState({
    bool? loading,
    String? errMsg,
    WalletConnectionStatus? connectionStatus,
    IReownAppKit? appKit,
    String? walletId,
    ValidateAddressOutput? validateAddressOutput,
    String? token,
  }) {
    return MetamaskChangeState(
      loading: loading ?? state.loading,
      errMsg: errMsg ?? state.errMsg,
      connectionStatus: connectionStatus ?? state.connectionStatus,
      appkit: appKit ?? state.appkit,
      walletId: walletId ?? state.walletId,
      validateAddressOutput: validateAddressOutput ?? state.validateAddressOutput,
      token: token ?? state.token,
    );
  }
}

/// bloc states
@immutable
class MetamaskState {
  const MetamaskState(
      {required this.loading,
      required this.errMsg,
      required this.connectionStatus,
      required this.appkit,
      required this.walletId,
      required this.validateAddressOutput,
      required this.token});

  final bool loading;
  final String errMsg;
  final WalletConnectionStatus connectionStatus;
  final IReownAppKit? appkit;
  final String walletId;

  final ValidateAddressOutput validateAddressOutput;
  final String token;
}

class ClearMetamaskStateSuccess extends MetamaskState {
  const ClearMetamaskStateSuccess({
    required super.loading,
    required super.errMsg,
    required super.connectionStatus,
    required super.appkit,
    required super.walletId,
    required super.validateAddressOutput,
    required super.token,
  });
}

class MetamaskChangeState extends MetamaskState {
  const MetamaskChangeState({
    required super.loading,
    required super.errMsg,
    required super.connectionStatus,
    required super.appkit,
    required super.walletId,
    required super.validateAddressOutput,
    required super.token,
  });

  factory MetamaskChangeState.initial() => MetamaskChangeState(
        loading: false,
        errMsg: '',
        connectionStatus: WalletConnectionStatus.disconnected,
        appkit: null,
        walletId: '',
        validateAddressOutput: ValidateAddressOutput.initial(),
        token: '',
      );
}

class ValidateSuccessState extends MetamaskState {
  const ValidateSuccessState(
      {required super.loading,
      required super.errMsg,
      required super.connectionStatus,
      required super.appkit,
      required super.walletId,
      required super.validateAddressOutput,
      required super.token});
}

class ValidateErrorState extends MetamaskState {
  const ValidateErrorState(
      {required super.loading,
      required super.errMsg,
      required super.connectionStatus,
      required super.appkit,
      required super.walletId,
      required super.validateAddressOutput,
      required super.token});
}

/// bloc events
@immutable
class MetamaskEvent {}

class ConnectMetamaskEvent extends MetamaskEvent {
  final BuildContext context;

  ConnectMetamaskEvent(this.context);
}

class DisconnectMetamaskEvent extends MetamaskEvent {}

class CheckMetamaskConnectionEvent extends MetamaskEvent {}

class GetMetamaskAddressEvent extends MetamaskEvent {}

class ClearAppKitEvent extends MetamaskEvent {}

class WalletSelectedEvent extends MetamaskEvent {
  final String walletId;

  WalletSelectedEvent(this.walletId);
}

class ValidateAddressEvent extends MetamaskEvent {
  final String address;

  ValidateAddressEvent({required this.address});
}

class ClearMetamaskStateEvent extends MetamaskEvent {}

/// enums
enum WalletConnectionStatus {
  disconnected,
  connecting,
  connected,
  failed,
}
