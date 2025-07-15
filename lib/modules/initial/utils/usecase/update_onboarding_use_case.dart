import 'package:deplug/core/services/repository/repository.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@singleton
class UpdateOnboardingUseCase extends UseCase<NoParams, bool> {
  final Repository repository;

  UpdateOnboardingUseCase({required this.repository});

  @override
  Future<bool> call(NoParams params) {
    return repository.updateOnboarding(params);
  }
}
