part of 'auth_bloc.dart';

sealed class AuthState {
  final bool isAuthenticated;
  final User? userDetails;

  const AuthState({required this.isAuthenticated, this.userDetails});
}

final class AuthInitial extends AuthState {
  AuthInitial() : super(isAuthenticated: false);
}

final class AuthLoading extends AuthState {
  AuthLoading() : super(isAuthenticated: false);
}

final class AuthSuccess extends AuthState {
  final User userDetails;

  const AuthSuccess(this.userDetails)
      : super(isAuthenticated: true, userDetails: userDetails);
}

final class AuthSuccessMessage extends AuthState {
  final String message;

  const AuthSuccessMessage(this.message) : super(isAuthenticated: false);
}

final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message) : super(isAuthenticated: false);
}

final class AuthProfileUpdateFailure extends AuthState {
  final User userDetails;
  final String message;

  const AuthProfileUpdateFailure(this.userDetails, this.message)
      : super(isAuthenticated: true, userDetails: userDetails);
}
