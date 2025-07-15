import 'package:deplug/core/services/repository/repository.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@singleton
class SaveTokenUseCase extends UseCase<String, bool> {
  final Repository repository;

  SaveTokenUseCase({required this.repository});

  @override
  Future<bool> call(String params) {
    return repository.saveToken(params);
  }
}
