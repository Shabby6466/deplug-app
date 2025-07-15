import 'package:deplug/core/network_calls/dio_wrapper/index.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:deplug/modules/initial/usecase/auth/delete_token_usecase.dart';
import 'package:deplug/modules/initial/usecase/auth/get_token_use_case.dart';
import 'package:deplug/modules/initial/utils/usecase/get_onboarding_state_use_case.dart';
import 'package:deplug/modules/initial/utils/usecase/update_onboarding_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required this.updateOnboardingUseCase,
    required this.getOnBoardingStateUseCase,
    required this.getTokenUseCase,
    required this.deleteTokenUseCase,
  }) : super(SplashChangeState.initial()) {
    on<UpdateOnboardingEvent>(_updateOnboardingEvent);
    on<GetOnboardingEvent>(_getOnboardingEvent);
    on<GetTokenEvent>(_getTokenEvent);
    on<DeleteTokenEvent>(_deleteTokenEvent);
  }

  final GetOnBoardingStateUseCase getOnBoardingStateUseCase;
  final UpdateOnboardingUseCase updateOnboardingUseCase;
  final GetTokenUseCase getTokenUseCase;
  final DeleteTokenUseCase deleteTokenUseCase;

  void _updateOnboardingEvent(UpdateOnboardingEvent event, Emitter<SplashState> emit) async {
    var _ = await updateOnboardingUseCase.call(NoParams());
    emit(OnboardingUpdatedState(loading: false, errMsg: '', token: state.token));
  }

  void _deleteTokenEvent(DeleteTokenEvent event, Emitter<SplashState> emit) async {
    try {
      emit(getBlocState(loading: true));
      var res = await deleteTokenUseCase.call(NoParams());
      if (res) {
        emit(DeleteTokenSuccessState(loading: false, errMsg: state.errMsg, token: ''));
      }
    } on DefaultFailure catch (e) {
      emit(getBlocState(loading: false, errMsg: e.message, token: state.token));
    }
  }

  void _getTokenEvent(GetTokenEvent event, Emitter<SplashState> emit) async {
    try {
      emit(getBlocState(loading: true));
      var res = await getTokenUseCase.call(NoParams());
      if (res.isEmpty) {
        emit(TokenNotFoundState(loading: false, errMsg: state.errMsg, token: res));
      } else {
        emit(TokenFoundState(loading: false, errMsg: '', token: res));
      }
    } on DefaultFailure catch (e) {
      emit(TokenNotFoundState(loading: false, errMsg: e.message, token: state.token));
    }
  }

  void _getOnboardingEvent(GetOnboardingEvent event, Emitter<SplashState> emit) async {
    var res = await getOnBoardingStateUseCase.call(NoParams());
    if (res) {
      emit(SkipOnboardingState(loading: false, errMsg: '', token: state.token));
    } else {
      emit(ShowOnboardingState(loading: false, errMsg: '', token: state.token));
    }
  }

  /// this method used as state change
  SplashState getBlocState({
    bool? loading,
    String? errMsg,
    String? token,
  }) {
    return SplashChangeState(
      loading: loading ?? state.loading,
      errMsg: errMsg ?? state.errMsg,
      token: token ?? state.token,
    );
  }
}

/// bloc states
@immutable
class SplashState {
  const SplashState({required this.loading, required this.errMsg, required this.token});

  final bool loading;
  final String errMsg, token;
}

class SplashChangeState extends SplashState {
  const SplashChangeState({required super.loading, required super.errMsg, required super.token});

  factory SplashChangeState.initial() => const SplashChangeState(
        loading: false,
        errMsg: '',
        token: '',
      );
}

class OnboardingUpdatedState extends SplashState {
  const OnboardingUpdatedState({required super.loading, required super.errMsg, required super.token});
}

class DeleteTokenSuccessState extends SplashState {
  const DeleteTokenSuccessState({required super.loading, required super.errMsg, required super.token});
}

class ShowOnboardingState extends SplashState {
  const ShowOnboardingState({required super.loading, required super.errMsg, required super.token});
}

class SkipOnboardingState extends SplashState {
  const SkipOnboardingState({required super.loading, required super.errMsg, required super.token});
}

class TokenFoundState extends SplashState {
  const TokenFoundState({required super.loading, required super.errMsg, required super.token});
}

class TokenNotFoundState extends SplashState {
  const TokenNotFoundState({required super.loading, required super.errMsg, required super.token});
}

/// bloc events
@immutable
class SplashEvent {}

class UpdateOnboardingEvent extends SplashEvent {}

class GetOnboardingEvent extends SplashEvent {}

class GetTokenEvent extends SplashEvent {}

class DeleteTokenEvent extends SplashEvent {}
