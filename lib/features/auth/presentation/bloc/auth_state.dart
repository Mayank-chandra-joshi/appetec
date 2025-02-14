part of 'auth_bloc.dart';

sealed class AuthState {
  final bool isAccountCompleted;
  const AuthState({required this.isAccountCompleted});
}

final class AuthInitial extends AuthState {
  AuthInitial() : super(isAccountCompleted: false);
}

final class AuthLoading extends AuthState {
  AuthLoading() : super(isAccountCompleted: false);
}

final class AuthSuccess extends AuthState {
  @override
  final bool isAccountCompleted;
  final User user;

  const AuthSuccess(this.user, this.isAccountCompleted)
      : super(isAccountCompleted: isAccountCompleted);
}

final class AuthSuccessMessage extends AuthState {
  final String message;
  const AuthSuccessMessage(this.message) : super(isAccountCompleted: true);
}

final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message) : super(isAccountCompleted: true);
}
