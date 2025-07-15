import 'package:deplug/core/services/datasources/remote_data_source/remote_data_source.dart';
import 'package:deplug/core/services/repository/repository.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@singleton
class DevicePowerUseCase extends UseCase<DevicePowerInput, bool> {
  final Repository repository;

  DevicePowerUseCase({required this.repository});

  @override
  Future<bool> call(DevicePowerInput params) {
    return repository.devicePower(params);
  }
}

class DevicePowerInput extends ApiParams{
  final String deviceId, token;
  final bool status;

  DevicePowerInput({required this.deviceId, required this.token, required this.status});

  @override
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['status'] = status;
    return data;
  }

  factory DevicePowerInput.withToken({required DevicePowerInput params, required String token}) => DevicePowerInput(deviceId: params.deviceId, token: token, status: params.status);
}