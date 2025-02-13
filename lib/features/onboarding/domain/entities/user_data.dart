class DeviceData {
  String deviceId;
  String serialId;

  DeviceData({required this.deviceId, required this.serialId});
}

class UserData {
  int? age;
  String? gender;
  double? height;
  double? weight;
  String? dietPreference;
  String? mindGoal;
  String? activityGoal;
  String? physicalGoal;
  String? sleepGoal;
  DeviceData? deviceData;
  int? deviceUsageLimit;
  List<String>? appPermissions;

  UserData({
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
