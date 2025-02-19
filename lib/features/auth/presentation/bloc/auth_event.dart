part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({
    required this.email,
    required this.password,
  });
}

final class AuthRegister extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool acceptTerms;

  AuthRegister({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.acceptTerms,
  });
}

final class AuthLogout extends AuthEvent {
  AuthLogout();
}

final class AuthProfileSetUp extends AuthEvent {
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

  AuthProfileSetUp({
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
