import 'package:injectable/injectable.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:deplug/core/services/repository/repository.dart';

@lazySingleton
class ConnectPhantomWalletUsecase extends UseCase<NoParams, ConnectPhantomOutput> {
  final Repository repository;

  ConnectPhantomWalletUsecase({required this.repository});

  @override
  Future<ConnectPhantomOutput> call(NoParams params) async {
    try {
      final isConnected = await repository.isPhantomConnected();
      if (isConnected) {
        final address = await repository.phantomWalletGetAddress();
        return ConnectPhantomOutput(
          success: true,
          isExistingConnection: true,
          address: address,
        );
      }

      final adapter = await repository.connectPhantom();
      if (adapter != null) {
        return ConnectPhantomOutput(
          adapter: adapter,
          success: true,
          isExistingConnection: false,
        );
      } else {
        return ConnectPhantomOutput(
          success: false,
          error: 'Failed to connect wallet',
        );
      }
    } catch (e) {
      return ConnectPhantomOutput(
        success: false,
        error: e.toString(),
      );
    }
  }
}

class ConnectPhantomOutput {
  final bool success;
  final String? error;
  final dynamic adapter;
  final bool isExistingConnection;
  final String? address;

  ConnectPhantomOutput({
    required this.success,
    this.error,
    this.adapter,
    this.address,
    this.isExistingConnection = false,
  });
}
