import 'package:deplug/core/services/repository/repository.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PhantomRestoreUsecase extends UseCase<NoParams, PhantomRestoreOutput> {
  final Repository repository;

  PhantomRestoreUsecase({required this.repository});

  @override
  Future<PhantomRestoreOutput> call(NoParams params) async {
    try {
      await repository.restoreSession();
      final isConnected = await repository.isPhantomConnected();
      final address = await repository.phantomWalletGetAddress();
      return PhantomRestoreOutput(
        success: isConnected,
        address: address,
      );
    } catch (e) {
      return PhantomRestoreOutput(
        success: false,
        error: e.toString(),
      );
    }
  }
}

class PhantomRestoreOutput {
  final bool success;
  final String? address;
  final String? error;

  PhantomRestoreOutput({
    required this.success,
    this.address,
    this.error,
  });
}
