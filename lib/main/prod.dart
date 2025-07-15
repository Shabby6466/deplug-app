// coverage: false
// coverage:ignore-file

import 'package:deplug/main/main_core.dart';

// ENTRY POINT OF PROD APP
void main() async {
  initMainCore(enviormentPath: 'env/.env_prod');
}
