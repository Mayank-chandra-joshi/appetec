class DeviceData {
  String deviceId;
  String serialId;

  DeviceData({required this.deviceId, required this.serialId});
}

class DeviceMetaData {
  final String serialId;
  final String deviceImg;
  DeviceMetaData({
    required this.deviceImg,
    required this.serialId,
  });
}

class OnboardingData {
  int? age;
  String? gender;
  double? height;
  int? weight;
  String? dietPreference;
  String? mindGoal;
  String? activityGoal;
  String? physicalGoal;
  String? sleepGoal;
  DeviceData? deviceData;
  DeviceMetaData? deviceMetaData;
  double? deviceUsageLimit;
  List<String>? appPermissions;

  OnboardingData({
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
    this.deviceMetaData,
    this.deviceUsageLimit,
    this.appPermissions,
  });
}
