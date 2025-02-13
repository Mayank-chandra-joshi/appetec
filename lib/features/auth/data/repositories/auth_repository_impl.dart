import 'package:appetec/core/error/failures.dart';
import 'package:appetec/features/auth/data/models/user_model.dart';
import 'package:appetec/features/auth/data/sources/auth_remote_source.dart';
import 'package:appetec/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource authRemoteSource;
  final secureStorage = FlutterSecureStorage();

  AuthRepositoryImpl(this.authRemoteSource);

  @override
  Future<Either<Failure, UserModel>> logInWIthEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteSource.logInWithEmailPassword(
        email: email,
        password: password,
      );

      await secureStorage.write(key: 'accessToken', value: user.accessToken);
      await secureStorage.write(key: 'expiry', value: user.expiry);

      return right(user);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
