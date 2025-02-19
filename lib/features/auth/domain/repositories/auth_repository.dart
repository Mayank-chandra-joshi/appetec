import 'package:appetec/core/error/failures.dart';
import 'package:appetec/features/auth/domain/entities/user.dart';
import 'package:appetec/features/onboarding/domain/entities/onboarding_data.dart';
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

  Future<Either<Failure, User>> userProfileSetup({
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
  });
}
