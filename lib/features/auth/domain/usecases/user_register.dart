import 'package:appetec/core/error/failures.dart';
import 'package:appetec/core/usecases/usecases.dart';
import 'package:appetec/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserRegister implements UseCase<String, UserRegisterParams> {
  final AuthRepository authRepository;

  UserRegister(
    this.authRepository,
  );

  @override
  Future<Either<Failure, String>> call(UserRegisterParams params) async {
    return await authRepository.registerWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
      confirmPassword: params.confirmPassword,
      acceptTerms: params.acceptTerms,
    );
  }
}

class UserRegisterParams {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool acceptTerms;

  UserRegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.acceptTerms,
  });
}
