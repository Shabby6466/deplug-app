import 'package:deplug/core/services/repository/repository.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetOnBoardingStateUseCase extends UseCase<NoParams, bool> {
  final Repository repository;

  GetOnBoardingStateUseCase({required this.repository});

  @override
  Future<bool> call(NoParams params) {
    return repository.getOnboardingState(params);
  }
}
