import 'package:appetec/core/error/failures.dart';
import 'package:appetec/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> logInWIthEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> registerWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  });

  Future<Either<Failure, String>> logoutUser();
}
