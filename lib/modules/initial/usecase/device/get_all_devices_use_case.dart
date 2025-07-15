import 'package:deplug/core/services/repository/repository.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetAllDevicesUseCase extends UseCase<NoParams, DeviceListOutput> {
  final Repository repository;

  GetAllDevicesUseCase({required this.repository});

  @override
  Future<DeviceListOutput> call(NoParams params) {
    return repository.getAllDevices(params);
  }
}

class DeviceListOutput {
  final List<Devices> data;

  DeviceListOutput({
    required this.data,
  });

  factory DeviceListOutput.fromJson(Map<String, dynamic> json) {
    var data = <Devices>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Devices.fromJson(v));
      });
    }
    return DeviceListOutput(data: data);
  }

  factory DeviceListOutput.initial() => DeviceListOutput(data: []);
}

class Devices {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String uniqueId;
  final bool powerStatus;
  final String startTime;
  final String endTime;
  final String startDate;
  final String deviceType;
  final String location;

  Devices({
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.name,
    required this.uniqueId,
    required this.powerStatus,
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.deviceType,
    required this.location,
  });

  factory Devices.fromJson(Map<String, dynamic> json) {
    var id = json['id'] ?? '';
    var createdAt = json['createdAt'] ?? '';
    var updatedAt = json['updatedAt'] ?? '';
    var name = json['name'] ?? '';
    var uniqueId = json['uniqueId'] ?? '';
    var powerStatus = json['powerStatus'] ?? false;
    var startTime = json['startTime'] ?? '';
    var endTime = json['endTime'] ?? '';
    var startDate = json['startDate'] ?? '';
    var deviceType = json['deviceType'] ?? '';
    var location = json['location'] ?? '';

    return Devices(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      name: name,
      uniqueId: uniqueId,
      powerStatus: powerStatus,
      startTime: startTime,
      endTime: endTime,
      startDate: startDate,
      deviceType: deviceType,
      location: location,
    );
  }
}
