class User {
  final String id;
  final String name;
  final String email;
  final int age;
  final String gender;
  final int height;
  final int weight;
  final int deviceUsageLimit;
  final String dietPreference;
  final bool isEmailVerified;
  final bool isAccountCompleted;
  final bool isDeleted;
  final List<String> appPermissions;
  final List<Map<String, String>> goals;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.deviceUsageLimit,
    required this.dietPreference,
    required this.isEmailVerified,
    required this.isAccountCompleted,
    required this.isDeleted,
    required this.appPermissions,
    required this.goals,
  });
}
