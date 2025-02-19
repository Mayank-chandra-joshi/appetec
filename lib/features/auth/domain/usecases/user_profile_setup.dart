import 'package:appetec/core/error/failures.dart';
import 'package:appetec/core/usecases/usecases.dart';
import 'package:appetec/features/auth/domain/entities/user.dart';
import 'package:appetec/features/auth/domain/repositories/auth_repository.dart';
import 'package:appetec/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:fpdart/fpdart.dart';

class UserProfileSetup implements UseCase<User, OnboardingDataParams> {
  final AuthRepository authRepository;

  UserProfileSetup(this.authRepository);

  @override
  Future<Either<Failure, User>> call(OnboardingDataParams params) async {
    return await authRepository.userProfileSetup(
      age: params.age,
      gender: params.gender,
      height: params.height,
      weight: params.weight,
      dietPreference: params.dietPreference,
      mindGoal: params.mindGoal,
      activityGoal: params.activityGoal,
      physicalGoal: params.physicalGoal,
      sleepGoal: params.sleepGoal,
      deviceData: params.deviceData,
      deviceUsageLimit: params.deviceUsageLimit,
      appPermissions: params.appPermissions,
    );
  }
}

class OnboardingDataParams {
  final int age;
  final String gender;
  final double height;
  final int weight;
  final String dietPreference;
  final String mindGoal;
  final String activityGoal;
  final String physicalGoal;
  final String sleepGoal;
  final DeviceData? deviceData;
  final double deviceUsageLimit;
  final List<String> appPermissions;

  OnboardingDataParams({
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.dietPreference,
    required this.mindGoal,
    required this.activityGoal,
    required this.physicalGoal,
    required this.sleepGoal,
    required this.deviceData,
    required this.deviceUsageLimit,
    required this.appPermissions,
  });
}
