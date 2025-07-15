import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:deplug/modules/initial/usecase/wallet/connect_phantom_wallet_usecase.dart';
import 'package:deplug/modules/initial/usecase/wallet/get_phantom_wallet_address_usecase.dart';
import 'package:deplug/modules/initial/usecase/wallet/is_phantom_wallet_connected_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PhantomWalletBloc extends Bloc<PhantomWalletEvent, PhantomWalletState> {
  final FlutterSecureStorage secureStorage;
  final ConnectPhantomWalletUsecase connectPhantomWalletUsecase;
  final IsPhantomWalletConnectedUsecase isPhantomWalletConnectedUsecase;
  final GetPhantomWalletAddressUsecase getPhantomWalletAddressUsecase;

  PhantomWalletBloc({
    required this.secureStorage,
    required this.connectPhantomWalletUsecase,
    required this.getPhantomWalletAddressUsecase,
    required this.isPhantomWalletConnectedUsecase,
  }) : super(PhantomWalletChangeState.initial()) {
    on<ConnectPhantomWalletEvent>(_connectPhantomWalletEvent);
    on<RestoreSessionEvent>(_onRestoreSessionEvent);
    on<ClearPhantomWalletStateEvent>(_clearPhantomState);
  }

  void _clearPhantomState(ClearPhantomWalletStateEvent event, Emitter<PhantomWalletState> emit) {
    emit(const ClearPhantomState(
      loading: false,
      errMsg: '',
      connectionStatus: WalletConnectionStatus.disconnected,
      adapter: null,
    ));
  }

  Future<void> _connectPhantomWalletEvent(
    ConnectPhantomWalletEvent event,
    Emitter<PhantomWalletState> emit,
  ) async {
    emit(getBlocState(loading: true));
    try {
      final result = await connectPhantomWalletUsecase(NoParams());

      if (result.success && result.adapter != null) {
        final publicKey = result.adapter['phantom_public_key'];
        await secureStorage.write(key: 'phantom_public_key', value: publicKey);

        emit(getBlocState(
          loading: false,
          errMsg: '',
          connectionStatus: WalletConnectionStatus.connected,
          adapter: result.adapter,
        ));
      } else {
        emit(getBlocState(
          loading: false,
          errMsg: result.error ?? 'Connection failed',
          connectionStatus: WalletConnectionStatus.failed,
        ));
      }
    } catch (e) {
      emit(getBlocState(
        loading: false,
        errMsg: e.toString(),
        connectionStatus: WalletConnectionStatus.failed,
      ));
    }
  }

  Future<void> _onRestoreSessionEvent(
    RestoreSessionEvent event,
    Emitter<PhantomWalletState> emit,
  ) async {
    try {
      final publicKey = await secureStorage.read(key: 'phantom_public_key');

      if (publicKey != null) {
        emit(getBlocState(
          connectionStatus: WalletConnectionStatus.connected,
          adapter: {'public_key': publicKey},
        ));
      } else {
        emit(getBlocState(
          connectionStatus: WalletConnectionStatus.disconnected,
        ));
      }
    } catch (e) {
      emit(getBlocState(
        errMsg: e.toString(),
        connectionStatus: WalletConnectionStatus.failed,
      ));
    }
  }

  PhantomWalletState getBlocState({
    bool? loading,
    String? errMsg,
    WalletConnectionStatus? connectionStatus,
    dynamic adapter,
  }) {
    return PhantomWalletChangeState(
      loading: loading ?? state.loading,
      errMsg: errMsg ?? state.errMsg,
      connectionStatus: connectionStatus ?? state.connectionStatus,
      adapter: adapter ?? state.adapter,
    );
  }
}

/// bloc states
@immutable
class PhantomWalletState {
  const PhantomWalletState({
    required this.loading,
    required this.errMsg,
    required this.connectionStatus,
    required this.adapter,
  });

  final bool loading;
  final String errMsg;
  final WalletConnectionStatus connectionStatus;
  final dynamic adapter;
}

class ClearPhantomState extends PhantomWalletState {
  const ClearPhantomState({
    required super.loading,
    required super.errMsg,
    required super.connectionStatus,
    required super.adapter,
  });
}

class PhantomWalletChangeState extends PhantomWalletState {
  const PhantomWalletChangeState({
    required super.loading,
    required super.errMsg,
    required super.connectionStatus,
    required super.adapter,
  });

  factory PhantomWalletChangeState.initial() => const PhantomWalletChangeState(
        loading: false,
        errMsg: '',
        connectionStatus: WalletConnectionStatus.disconnected,
        adapter: null,
      );
}

/// bloc events
@immutable
class PhantomWalletEvent {}

class ConnectPhantomWalletEvent extends PhantomWalletEvent {}

class DisconnectPhantomWalletEvent extends PhantomWalletEvent {}

class RestoreSessionEvent extends PhantomWalletEvent {}

class ClearPhantomWalletStateEvent extends PhantomWalletEvent {}

/// enums
enum WalletConnectionStatus {
  disconnected,
  connecting,
  connected,
  failed,
}
