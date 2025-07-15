import 'package:deplug/core/services/repository/repository.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IsPhantomWalletConnectedUsecase extends UseCase<NoParams, bool?> {
  final Repository repository;

  IsPhantomWalletConnectedUsecase({required this.repository});

  @override
  Future<bool?> call(NoParams params) async {
    return await repository.isPhantomConnected();
  }
}
