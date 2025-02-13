import "package:appetec/features/auth/domain/entities/user.dart";
import "package:appetec/features/auth/domain/usecases/user_login.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:appetec/features/auth/domain/usecases/user_login.dart";

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin userLogin;

  AuthBloc({
    required this.userLogin,
  }) : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      final res = await userLogin(
        UserLoginParams(email: event.email, password: event.password),
      );

      res.fold(
          (l) => emit(AuthFailure(l.message)), (r) => emit(AuthSuccess(r)));
    });
  }
}
