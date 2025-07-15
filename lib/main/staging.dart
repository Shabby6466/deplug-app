// coverage: false
// coverage:ignore-file

import 'main_core.dart';

// ENTRY POINT OF DEVELOPMENT APP
void main() async {

  var dotEnvFileName = 'env/.env_staging';
  initMainCore(enviormentPath: dotEnvFileName);
}
