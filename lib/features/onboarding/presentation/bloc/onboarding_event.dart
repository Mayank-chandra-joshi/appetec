part of 'onboarding_bloc.dart';

sealed class OnboardingEvent {
  const OnboardingEvent();
}

final class UpdateOnboardingEvent implements OnboardingEvent {
  final int? age;
  final String? gender;
  final double? height;
  final double? weight;
  final String? dietPreference;
  final String? mindGoal;
  final String? activityGoal;
  final String? physicalGoal;
  final String? sleepGoal;
  final DeviceData? deviceData;
  final int? deviceUsageLimit;
  final List<String>? appPermissions;

  UpdateOnboardingEvent({
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.dietPreference,
    this.mindGoal,
    this.activityGoal,
    this.physicalGoal,
    this.sleepGoal,
    this.deviceData,
    this.deviceUsageLimit,
    this.appPermissions,
  });
}
