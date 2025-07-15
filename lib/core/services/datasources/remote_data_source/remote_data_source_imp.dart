part of 'remote_data_source.dart';

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImp extends RemoteDataSource {
  final HttpApiCalls _httpApiCalls;
  final Logger _logger;

  RemoteDataSourceImp({
    required HttpApiCalls networkCallsWrapper,
    required Logger logger,
  })  : _logger = logger,
        _httpApiCalls = networkCallsWrapper;

  @override
  Future<ValidateAddressOutput> validateAddress(ValidateAddressInput params) async {
    _logger.f(params.toJson());
    final res = await _httpApiCalls.onPost(api: ApiString.validate, data: params.toJson());
    _logger.i('[DePlug Remote DataSource | validateAddress] $res');
    return ValidateAddressOutput.fromJson(res.data['data']);
  }

  @override
  Future<DeviceListOutput> getAllDevices(String token) async {
    final res = await _httpApiCalls.onGet(api: ApiString.deviceList, jwt: token);
    _logger.i('[DePlug Remote DataSource | getAllDevices] $res');
    return DeviceListOutput.fromJson(res.data);
  }

  @override
  Future<bool> devicePower(DevicePowerInput params) async {
    final res = await _httpApiCalls.onPatch(api: '${ApiString.devicePower}${params.deviceId}', jwt: params.token, data: params.toJson());
    _logger.i('[DePlug Remote DataSource | devicePower] $res');
    return true;
  }

  @override
  Future<DeviceSoldOutput> deviceTotalSold(String token) async {
    final res = await _httpApiCalls.onGet(api: ApiString.deviceTotal, jwt: token);
    _logger.i('[DePlug Remote DataSource | deviceTotalSold] $res');
    return DeviceSoldOutput.fromJson(res.data['data']);
  }

  @override
  Future<DeviceDetailOutput> getDeviceDetail(DeviceDetailInput params) async {
    final res = await _httpApiCalls.onGet(api: '${ApiString.deviceDetail}${params.deviceId}', jwt: params.token);
    _logger.i('[DePlug Remote DataSource | getDeviceDetail] $res');
    return DeviceDetailOutput.fromJson(res.data['data']);
  }

  @override
  Future<bool> updateDeviceTime(UpdateTimingInput params) async {
    final res = await _httpApiCalls.onPatch(api: '${ApiString.deviceTime}${params.deviceId}', jwt: params.token, data: params.toJson());
    _logger.i('[DePlug Remote DataSource | updateDeviceTime] $res');
    return true;
  }

  @override
  Future<ElectricDataUsageOutput> electricDataUsage(ElectricDataUsageInput params) async {
    final res = await _httpApiCalls.onGet(api: '${ApiString.electricDataUsage}${params.deviceId}', jwt: params.token);
    _logger.i('[DePlug Remote DataSource | electricDataUsage] $res');
    return ElectricDataUsageOutput.fromJson(res.data);
  }

  @override
  Future<bool> addNewDevice(AddNewDeviceInput params) async {
    final res = await _httpApiCalls.onPost(api: ApiString.addNewDevice, data: params.toJson(), jwt: params.token);
    _logger.i('[DePlug Remote DataSource | addNewDevice] Response: $res');
    return true;
  }

  @override
  Future<GetTotalPhantomWattsOutput> getPhantomTotalWatts(String token) async {
    final res = await _httpApiCalls.onGet(api: ApiString.phantomLoadHuntWatts, jwt: token);
    _logger.i('[DePlug Remote DataSource | Get Phantom Hunt Stats] Response: $res');
    return GetTotalPhantomWattsOutput.fromJson(res.data);
  }

  @override
  Future<bool> submitPhantomHunt(SubmitPhantomHuntInput params) async {
    final res = await _httpApiCalls.onPost(api: ApiString.phantomLoadHunt, data: params.toJson());
    _logger.i('[DePlug Remote DataSource | Submit Phantom Hunt] Response: $res');
    return true;
  }

  @override
  Future<bool> applyReferralCode(params) async {
    final res = await _httpApiCalls.onPost(api: ApiString.applyGreenReferralCode, data: params.toJson());
    _logger.i('[DePlug Remote DataSource | Apply Referral Code ] Response: $res');
    return true;
  }

  @override
  Future<GetReferralCodeOutput> getReferralCode(String token) async {
    final res = await _httpApiCalls.onGet(api: ApiString.greenReferralCode, jwt: token);
    _logger.i('[DePlug Remote DataSource | Get Referral Code ] Response: $res');
    return GetReferralCodeOutput.fromJson(res.data);
  }

  @override
  Future<GetGreenTeamStatsOutput> greenTeamStats(String token) async {
    final res = await _httpApiCalls.onGet(api: ApiString.greenReferralCodeStats, jwt: token);
    _logger.i('[DePlug Remote DataSource | Referral Code Stats ] Response: $res');
    return GetGreenTeamStatsOutput.fromJson(res.data);
  }

  @override
  Future<AttendanceOutput> getAttendance(AttendanceInput params) async {
    final res = await _httpApiCalls.onGet(api: ApiString.getAttendance, jwt: params.token, queryParameters: params.toJson());
    _logger.i('[DePlug Remote DataSource | getAttendance] $res');
    return AttendanceOutput.fromJson(res.data);
  }

  @override
  Future<bool> checkIn(CheckInInput params) async {
    final res = await _httpApiCalls.onPost(api: ApiString.getAttendance, jwt: params.token, data: params.toJson());
    _logger.i('[DePlug Remote DataSource | checkIn] $res');
    return true;
  }

  @override
  Future<GetDailyPledgeStatsOutput> dailyPledgeStats(String token) async {
    final res = await _httpApiCalls.onGet(api: ApiString.attendanceStats, jwt: token);
    _logger.i('[DePlug Remote DataSource | Daily Pledge Code Stats ] Response: $res');
    return GetDailyPledgeStatsOutput.fromJson(res.data);
  }
}
