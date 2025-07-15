import 'package:deplug/core/services/datasources/remote_data_source/remote_data_source.dart';
import 'package:deplug/core/services/repository/repository.dart';
import 'package:deplug/core/services/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@singleton
class ValidateAddressUseCase extends UseCase<ValidateAddressInput, ValidateAddressOutput> {
  final Repository repository;

  ValidateAddressUseCase({required this.repository});

  @override
  Future<ValidateAddressOutput> call(ValidateAddressInput params) {
    return repository.validateAddress(params);
  }
}

class ValidateAddressInput extends ApiParams {
  final String address;

  ValidateAddressInput({required this.address});

  @override
  Map<String, dynamic> toJson() {
    var data = <String, String>{};
    data['address'] = address;
    return data;
  }
}

class ValidateAddressOutput {
  final String token;
  final User user;

  ValidateAddressOutput({
    required this.token,
    required this.user,
  });

  factory ValidateAddressOutput.fromJson(Map<String, dynamic> json) {
    var token = json['token'] ?? '';
    var user = User.fromJson(json['user']);
    return ValidateAddressOutput(token: token, user: user);
  }

  factory ValidateAddressOutput.initial() => ValidateAddressOutput(token: '', user: User.initial());
}

class User {
  final String email;
  final String id;

  User({
    required this.email,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var email = json['email'] ?? '';
    var id = json['id'] ?? '';

    return User(email: email, id: id);
  }

  factory User.initial() => User(email: '', id: '');
}
