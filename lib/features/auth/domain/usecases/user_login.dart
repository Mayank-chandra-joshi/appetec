// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appetec/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

import 'package:appetec/core/error/failures.dart';
import 'package:appetec/core/usecases/usecases.dart';
import 'package:appetec/features/auth/domain/repositories/auth_repository.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;

  UserLogin(
    this.authRepository,
  );

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepository.logInWIthEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLogout implements UseCaseNoParams<String> {
  final AuthRepository authRepository;
  UserLogout(this.authRepository);

  @override
  Future<Either<Failure, String>> call() async {
    return await authRepository.logoutUser();
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
