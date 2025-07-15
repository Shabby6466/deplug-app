// coverage: false
// coverage:ignore-file

import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseEnv {
  BaseEnv._internal();

  static final BaseEnv _instance = BaseEnv._internal();

  static BaseEnv get instance => _instance;

  late String _url;

  void setEnv() {
    _url = dotenv.env['BASE_URL'] ?? '';
  }

  String get url => _url;
}
