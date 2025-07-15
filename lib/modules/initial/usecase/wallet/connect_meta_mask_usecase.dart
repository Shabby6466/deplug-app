import 'package:deplug/core/di/di.dart';
import 'package:deplug/core/services/wallet_adapter_service/phantom_wallet_service.dart';
import 'package:deplug/core/utils/go_router/routes_constant.dart';
import 'package:deplug/core/utils/go_router/routes_navigation.dart';
import 'package:injectable/injectable.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:deplug/core/services/repository/repository.dart';

@lazySingleton
class ConnectMetamaskUsecase extends UseCase<NoParams, ConnectMetamaskOutput> {
  final Repository repository;

  ConnectMetamaskUsecase({required this.repository});

  @override
  Future<ConnectMetamaskOutput> call(NoParams params) async {
    try {
      await repository.connectMetaMask();

      final walletAddress = await repository.getWalletAddress();


      if (walletAddress!.isNotEmpty) {
        Future.delayed(const Duration(seconds: 3), () {
          sl<Navigation>().goNamedWithExtra(
            path: Routes.connectDePlugDevice,
            navigationData: WalletNavigationData(address: walletAddress),
          );
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          sl<Navigation>().go(Routes.connectWalletIndex);
        });
      }

      return ConnectMetamaskOutput(
        success: true,
      );
    } catch (e) {
      return ConnectMetamaskOutput(
        success: false,
        error: e.toString(),
      );
    }
  }
}

class ConnectMetamaskOutput {
  final bool success;
  final String? error;

  ConnectMetamaskOutput({required this.success, this.error});

  factory ConnectMetamaskOutput.initial() => ConnectMetamaskOutput(
        success: false,
        error: null,
      );
}
