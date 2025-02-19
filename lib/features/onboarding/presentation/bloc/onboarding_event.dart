part of 'onboarding_bloc.dart';

sealed class OnboardingEvent {
  const OnboardingEvent();
}

final class UpdateOnboardingProfileDetailsEvent implements OnboardingEvent {
  final int? age;
  final double? height;
  final int? weight;
  final String? gender;
  final String? dietPreference;
  final String? mindGoal;
  final String? activityGoal;
  final String? physicalGoal;
  final String? sleepGoal;
  final double? deviceUsageLimit;
  final DeviceMetaData? deviceMetaData;
  final DeviceData? deviceData;
  final List<String>? appPermissions;

  UpdateOnboardingProfileDetailsEvent({
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.dietPreference,
    this.mindGoal,
    this.activityGoal,
    this.physicalGoal,
    this.sleepGoal,
    this.deviceUsageLimit,
    this.deviceMetaData,
    this.appPermissions,
    this.deviceData,
  });
}

final class UpdateOnboardingGoalsEvent implements OnboardingEvent {
  final int? age;
  final double? height;
  final int? weight;
  final String? gender;
  final String? dietPreference;
  final String? mindGoal;
  final String? activityGoal;
  final String? physicalGoal;
  final String? sleepGoal;
  final double? deviceUsageLimit;
  final DeviceMetaData? deviceMetaData;
  final DeviceData? deviceData;
  final List<String>? appPermissions;

  UpdateOnboardingGoalsEvent({
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.dietPreference,
    this.mindGoal,
    this.activityGoal,
    this.physicalGoal,
    this.sleepGoal,
    this.deviceUsageLimit,
    this.deviceMetaData,
    this.appPermissions,
    this.deviceData,
  });
}

final class UpdateOnboardingSelectedDeviceEvent implements OnboardingEvent {
  final int? age;
  final double? height;
  final int? weight;
  final String? gender;
  final String? dietPreference;
  final String? mindGoal;
  final String? activityGoal;
  final String? physicalGoal;
  final String? sleepGoal;
  final double? deviceUsageLimit;
  final DeviceMetaData? deviceMetaData;
  final DeviceData? deviceData;
  final List<String>? appPermissions;

  UpdateOnboardingSelectedDeviceEvent({
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.dietPreference,
    this.mindGoal,
    this.activityGoal,
    this.physicalGoal,
    this.sleepGoal,
    this.deviceUsageLimit,
    this.deviceMetaData,
    this.deviceData,
    this.appPermissions,
  });
}

final class UpdateOnboardingPairDeviceEvent implements OnboardingEvent {
  final int? age;
  final double? height;
  final int? weight;
  final String? gender;
  final String? dietPreference;
  final String? mindGoal;
  final String? activityGoal;
  final String? physicalGoal;
  final String? sleepGoal;
  final double? deviceUsageLimit;
  final DeviceMetaData? deviceMetaData;
  final DeviceData? deviceData;
  final List<String>? appPermissions;

  UpdateOnboardingPairDeviceEvent({
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.dietPreference,
    this.mindGoal,
    this.activityGoal,
    this.physicalGoal,
    this.sleepGoal,
    this.deviceUsageLimit,
    this.deviceMetaData,
    this.deviceData,
    this.appPermissions,
  });
}

final class UpdateOnboardingAppPermissionsEvent implements OnboardingEvent {
  final int? age;
  final double? height;
  final int? weight;
  final String? gender;
  final String? dietPreference;
  final String? mindGoal;
  final String? activityGoal;
  final String? physicalGoal;
  final String? sleepGoal;
  final double? deviceUsageLimit;
  final DeviceMetaData? deviceMetaData;
  final DeviceData? deviceData;
  final List<String>? appPermissions;

  UpdateOnboardingAppPermissionsEvent({
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.dietPreference,
    this.mindGoal,
    this.activityGoal,
    this.physicalGoal,
    this.sleepGoal,
    this.deviceUsageLimit,
    this.deviceMetaData,
    this.deviceData,
    this.appPermissions,
  });
}

final class ClearOnboardingDataEvent implements OnboardingEvent {
  final int? age;
  final double? height;
  final int? weight;
  final String? gender;
  final String? dietPreference;
  final String? mindGoal;
  final String? activityGoal;
  final String? physicalGoal;
  final String? sleepGoal;
  final double? deviceUsageLimit;
  final DeviceMetaData? deviceMetaData;
  final DeviceData? deviceData;
  final List<String>? appPermissions;

  ClearOnboardingDataEvent({
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.dietPreference,
    this.mindGoal,
    this.activityGoal,
    this.physicalGoal,
    this.sleepGoal,
    this.deviceUsageLimit,
    this.deviceMetaData,
    this.deviceData,
    this.appPermissions,
  });
}
