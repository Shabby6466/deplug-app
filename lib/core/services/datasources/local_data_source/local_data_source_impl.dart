part of 'local_data_source.dart';

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  LocalDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<bool> getOnboardingState() async {
    try {
      var data = await flutterSecureStorage.read(key: R.storageKey.onboarding) ?? '';
      return data.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateOnboarding() async {
    await flutterSecureStorage.write(key: R.storageKey.onboarding, value: 'true');
    return true;
  }

  @override
  Future<String> getToken() async {
    return await flutterSecureStorage.read(key: R.storageKey.token) ?? '';
  }

  @override
  Future<bool> setToken(String token) async {
    await flutterSecureStorage.write(key: R.storageKey.token, value: token);
    return true;
  }

  @override
  Future<bool> deleteToken() async {
    await flutterSecureStorage.delete(key: R.storageKey.token);
    return true;
  }
}
