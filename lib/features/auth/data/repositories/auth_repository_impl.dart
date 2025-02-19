import 'package:appetec/core/error/failures.dart';
import 'package:appetec/features/auth/data/models/onboarding_model.dart';
import 'package:appetec/features/auth/data/models/user_model.dart';
import 'package:appetec/features/auth/data/sources/auth_remote_source.dart';
import 'package:appetec/features/auth/domain/repositories/auth_repository.dart';
import 'package:appetec/features/onboarding/domain/entities/onboarding_data.dart';
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

  @override
  Future<Either<Failure, String>> registerWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  }) async {
    try {
      final res = await authRemoteSource.registerWithEmailPassword(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        acceptTerms: acceptTerms,
      );
      return right(res);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> logoutUser() async {
    try {
      final message = await authRemoteSource.logoutUser();
      return right(message);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, UserUpdateModel>> userProfileSetup({
    required int age,
    required String gender,
    required double height,
    required int weight,
    required String dietPreference,
    required String mindGoal,
    required String activityGoal,
    required String physicalGoal,
    required String sleepGoal,
    required DeviceData? deviceData,
    required double deviceUsageLimit,
    required List<String> appPermissions,
  }) async {
    try {
      final user = await authRemoteSource.userProfileSetup(
        age: age,
        gender: gender,
        height: height,
        weight: weight,
        dietPreference: dietPreference,
        mindGoal: mindGoal,
        activityGoal: activityGoal,
        physicalGoal: physicalGoal,
        sleepGoal: sleepGoal,
        deviceData:
            deviceData == null ? null : DeviceDataModel.fromEntity(deviceData),
        deviceUsageLimit: deviceUsageLimit,
        appPermissions: appPermissions,
      );

      return right(user);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
