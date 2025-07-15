import 'package:deplug/core/network_calls/dio_wrapper/index.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/connect_device_index.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/add_device_widget.dart';
import 'package:deplug/modules/mydevices/usecases/add_new_device_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceBloc extends Bloc<ConnectDeviceEvent, ConnectDeviceState> {
  ConnectDeviceBloc({
    required this.addNewDeviceUsecase,
  }) : super(ConnectDeviceChangeState.initial()) {
    on<ChangeWidgetStepEvent>(_changeWidgetStepEvent);
    on<ChangeAddDeviceScreenEvent>(_changeAddDeviceScreenEvent);
    on<AddDeviceEvent>(_addDeviceEvent);
    on<UpdateDeviceNameEvent>(_updateDeviceNameEvent);
    on<UpdateUniqueIdEvent>(_updateUniqueIdEvent);
    on<ClearDeviceStateEvent>(_clearDeviceBloc);
    on<ResetDeviceStateEvent>(_resetDeviceStateEvent);
  }

  final AddNewDeviceUsecase addNewDeviceUsecase;

  void _clearDeviceBloc(ClearDeviceStateEvent event, Emitter<ConnectDeviceState> emit) {
    emit(const ClearStateSuccess(
      loading: false,
      errMsg: '',
      currentWidgetStep: DeviceConnectionEnum.addDevice,
      addDeviceScreens: AddDeviceScreens.searchDevice,
      deviceName: '',
      uniqueId: '',
      statusCode: 0,
      message: '',
    ));
  }

  void _changeWidgetStepEvent(ChangeWidgetStepEvent event, Emitter<ConnectDeviceState> emit) {
    emit(getBlocState(currentWidgetStep: event.deviceConnectionEnum));
  }
  void _resetDeviceStateEvent(ResetDeviceStateEvent event, Emitter<ConnectDeviceState> emit) {
    emit(ConnectDeviceChangeState.initial());
  }

  void _changeAddDeviceScreenEvent(ChangeAddDeviceScreenEvent event, Emitter<ConnectDeviceState> emit) {
    emit(getBlocState(addDeviceScreens: event.addDeviceScreens));
  }

  void _updateDeviceNameEvent(UpdateDeviceNameEvent event, Emitter<ConnectDeviceState> emit) {
    emit(getBlocState(deviceName: event.deviceName));
  }

  void _updateUniqueIdEvent(UpdateUniqueIdEvent event, Emitter<ConnectDeviceState> emit) {
    emit(getBlocState(uniqueId: event.uniqueId));
  }

  void _addDeviceEvent(AddDeviceEvent event, Emitter<ConnectDeviceState> emit) async {
    try {
      emit(getBlocState(loading: true));

      /// change unique id after device connection
      var _ = await addNewDeviceUsecase.call(AddNewDeviceInput(deviceName: state.deviceName, deviceUniqueId: event.deviceName, token: ''));

      emit(AddDeviceSuccessState(
          loading: false,
          errMsg: '',
          currentWidgetStep: state.currentWidgetStep,
          addDeviceScreens: state.addDeviceScreens,
          deviceName: state.deviceName,
          uniqueId: state.uniqueId,
          statusCode: state.statusCode,
          message: state.message));
    } on DefaultFailure catch (e) {
      emit(getBlocState(loading: false, errMsg: e.toString()));
    }
  }

  /// this method used as state change
  ConnectDeviceState getBlocState({
    bool? loading,
    String? errMsg,
    DeviceConnectionEnum? currentWidgetStep,
    AddDeviceScreens? addDeviceScreens,
    String? deviceName,
    String? uniqueId,
    int? statusCode,
    String? message,
  }) {
    return ConnectDeviceChangeState(
      loading: loading ?? state.loading,
      errMsg: errMsg ?? state.errMsg,
      addDeviceScreens: addDeviceScreens ?? state.addDeviceScreens,
      currentWidgetStep: currentWidgetStep ?? state.currentWidgetStep,
      deviceName: deviceName ?? state.deviceName,
      uniqueId: uniqueId ?? state.uniqueId,
      statusCode: statusCode ?? state.statusCode,
      message: message ?? state.message,
    );
  }
}

/// bloc states
@immutable
class ConnectDeviceState {
  const ConnectDeviceState({
    required this.loading,
    required this.errMsg,
    required this.currentWidgetStep,
    required this.addDeviceScreens,
    required this.deviceName,
    required this.uniqueId,
    required this.statusCode,
    required this.message,
  });

  final bool loading;
  final String errMsg;
  final DeviceConnectionEnum currentWidgetStep;
  final AddDeviceScreens addDeviceScreens;
  final String deviceName;
  final String? uniqueId;
  final int? statusCode;
  final String? message;
}

class ClearStateSuccess extends ConnectDeviceState {
  const ClearStateSuccess({
    required super.loading,
    required super.errMsg,
    required super.currentWidgetStep,
    required super.addDeviceScreens,
    required super.deviceName,
    required super.uniqueId,
    required super.statusCode,
    required super.message,
  });
}

class ConnectDeviceChangeState extends ConnectDeviceState {
  const ConnectDeviceChangeState({
    required super.loading,
    required super.errMsg,
    required super.currentWidgetStep,
    required super.addDeviceScreens,
    required super.deviceName,
    required super.uniqueId,
    required super.statusCode,
    required super.message,
  });

  factory ConnectDeviceChangeState.initial() => const ConnectDeviceChangeState(
        loading: false,
        errMsg: '',
        currentWidgetStep: DeviceConnectionEnum.addDevice,
        addDeviceScreens: AddDeviceScreens.searchDevice,
        deviceName: '',
        uniqueId: '',
        statusCode: 0,
        message: '',
      );
}

class AddDeviceSuccessState extends ConnectDeviceState {
  const AddDeviceSuccessState(
      {required super.loading,
      required super.errMsg,
      required super.currentWidgetStep,
      required super.addDeviceScreens,
      required super.deviceName,
      required super.uniqueId,
      required super.statusCode,
      required super.message});
}

/// bloc events
@immutable
class ConnectDeviceEvent {}

class ChangeWidgetStepEvent extends ConnectDeviceEvent {
  final DeviceConnectionEnum deviceConnectionEnum;

  ChangeWidgetStepEvent({required this.deviceConnectionEnum});
}

class ChangeAddDeviceScreenEvent extends ConnectDeviceEvent {
  final AddDeviceScreens addDeviceScreens;

  ChangeAddDeviceScreenEvent({required this.addDeviceScreens});
}

class AddDeviceEvent extends ConnectDeviceEvent {
  final String deviceName;
  final String deviceUniqueId;

  AddDeviceEvent({required this.deviceName, required this.deviceUniqueId});
}

class UpdateDeviceNameEvent extends ConnectDeviceEvent {
  final String deviceName;

  UpdateDeviceNameEvent({required this.deviceName});
}

class UpdateUniqueIdEvent extends ConnectDeviceEvent {
  final String uniqueId;

  UpdateUniqueIdEvent({required this.uniqueId});
}

class ClearDeviceStateEvent extends ConnectDeviceEvent {}

class ResetDeviceStateEvent extends ConnectDeviceEvent{}