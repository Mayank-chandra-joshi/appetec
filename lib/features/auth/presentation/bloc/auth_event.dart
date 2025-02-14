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
