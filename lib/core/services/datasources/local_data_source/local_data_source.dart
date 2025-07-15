
import 'package:deplug/core/utils/resource/r.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

part 'local_data_source_impl.dart';

abstract class LocalDataSource {
  Future<bool> getOnboardingState();

  Future<bool> updateOnboarding();

  Future<String> getToken();

  Future<bool> deleteToken();

  Future<bool> setToken(String token);
}
