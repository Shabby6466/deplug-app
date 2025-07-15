import 'package:deplug/core/services/datasources/local_data_source/local_data_source.dart';
import 'package:deplug/core/services/datasources/remote_data_source/remote_data_source.dart';
import 'package:deplug/core/services/wallet_adapter_service/meta_mask_service.dart';

part 'repository_imp.dart';

abstract class Repository {
  Future<void> connectMetaMask();

}
