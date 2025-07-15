import 'package:deplug/core/services/repository/repository.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPhantomWalletAddressUsecase extends UseCase<NoParams, String?> {
  final Repository repository;

  GetPhantomWalletAddressUsecase({required this.repository});

  @override
  Future<String?> call(NoParams params) async {
    return await repository.phantomWalletGetAddress();
  }
}
