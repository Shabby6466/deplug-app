import 'package:deplug/core/network_calls/dio_wrapper/index.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/modules/home/usecase/check_in_use_case.dart';
import 'package:deplug/modules/home/usecase/device_total_sold_use_case.dart';
import 'package:deplug/modules/home/usecase/get_attendance_use_case.dart';
import 'package:deplug/modules/initial/usecase/auth/validate_address_use_case.dart';
import 'package:deplug/modules/initial/usecase/device/device_power_use_case.dart';
import 'package:deplug/modules/initial/usecase/device/get_all_devices_use_case.dart';
import 'package:deplug/modules/missions/usecases/apply_referral_code_usecase.dart';
import 'package:deplug/modules/missions/usecases/get_daily_pledge_stats_usecase.dart';
import 'package:deplug/modules/missions/usecases/get_green_team_stats_usecase.dart';
import 'package:deplug/modules/missions/usecases/get_referral_code_usecase.dart';
import 'package:deplug/modules/missions/usecases/get_total_phantom_watts_usecase.dart';
import 'package:deplug/modules/missions/usecases/submit_phantom_hunt_usecase.dart';
import 'package:deplug/modules/mydevices/usecase/get_device_detail_use_case.dart';
import 'package:deplug/modules/mydevices/usecase/update_device_time_use_case.dart';
import 'package:deplug/modules/mydevices/usecases/add_new_device_usecase.dart';
import 'package:deplug/modules/mydevices/usecases/electric_data_usage_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'remote_data_source_imp.dart';

abstract class RemoteDataSource {
  Future<ValidateAddressOutput> validateAddress(ValidateAddressInput params);

  Future<DeviceListOutput> getAllDevices(String token);

  Future<bool> devicePower(DevicePowerInput params);

  Future<DeviceSoldOutput> deviceTotalSold(String token);

  Future<DeviceDetailOutput> getDeviceDetail(DeviceDetailInput params);

  Future<bool> updateDeviceTime(UpdateTimingInput params);

  Future<ElectricDataUsageOutput> electricDataUsage(ElectricDataUsageInput params);

  Future<bool> addNewDevice(AddNewDeviceInput params);

  Future<bool> submitPhantomHunt(SubmitPhantomHuntInput params);

  Future<GetTotalPhantomWattsOutput> getPhantomTotalWatts(String token);

  Future<GetGreenTeamStatsOutput> greenTeamStats(String token);

  Future<GetDailyPledgeStatsOutput> dailyPledgeStats(String token);

  Future<GetReferralCodeOutput> getReferralCode(String token);

  Future<bool> applyReferralCode(ApplyReferralCodeInput params);

  Future<AttendanceOutput> getAttendance(AttendanceInput params);

  Future<bool> checkIn(CheckInInput params);
}

abstract class ApiParams {
  Map<String, dynamic> toJson();
}
