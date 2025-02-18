part of 'onboarding_bloc.dart';

sealed class OnboardingEvent {
  const OnboardingEvent();
}

final class UpdateOnboardingProfileDetailsEvent implements OnboardingEvent {
  final int? age;
  final double? height;
  final double? weight;
  final String? gender;
  final String? dietPreference;
  UpdateOnboardingProfileDetailsEvent({
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.dietPreference,
  });
}

final class UpdateOnboardingGoalsEvent
    extends UpdateOnboardingProfileDetailsEvent {
  final String? mindGoal;
  final String? activityGoal;
  final String? physicalGoal;
  final String? sleepGoal;
  final int? deviceUsageLimit;

  UpdateOnboardingGoalsEvent({
    super.age,
    super.gender,
    super.height,
    super.weight,
    super.dietPreference,
    this.mindGoal,
    this.activityGoal,
    this.physicalGoal,
    this.sleepGoal,
    this.deviceUsageLimit,
  });
}

final class UpdateOnboardingSelectedDeviceEvent
    extends UpdateOnboardingGoalsEvent {
  final DeviceMetaData? deviceMetaData;

  UpdateOnboardingSelectedDeviceEvent({
    super.age,
    super.gender,
    super.height,
    super.weight,
    super.dietPreference,
    super.mindGoal,
    super.activityGoal,
    super.physicalGoal,
    super.sleepGoal,
    super.deviceUsageLimit,
    this.deviceMetaData,
  });
}

final class UpdateOnboardingPairDeviceEvent
    extends UpdateOnboardingSelectedDeviceEvent {
  final DeviceData? deviceData;

  UpdateOnboardingPairDeviceEvent({
    super.age,
    super.gender,
    super.height,
    super.weight,
    super.dietPreference,
    super.mindGoal,
    super.activityGoal,
    super.physicalGoal,
    super.sleepGoal,
    super.deviceUsageLimit,
    super.deviceMetaData,
    this.deviceData,
  });
}

final class UpdateOnboardingAppPermissionsEvent
    extends UpdateOnboardingPairDeviceEvent {
  final List<String>? appPermissions;

  UpdateOnboardingAppPermissionsEvent({
    super.age,
    super.gender,
    super.height,
    super.weight,
    super.dietPreference,
    super.mindGoal,
    super.activityGoal,
    super.physicalGoal,
    super.sleepGoal,
    super.deviceUsageLimit,
    super.deviceMetaData,
    super.deviceData,
    this.appPermissions,
  });
}
