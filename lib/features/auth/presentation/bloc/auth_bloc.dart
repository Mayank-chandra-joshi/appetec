import "package:appetec/features/auth/domain/entities/user.dart";
import "package:appetec/features/auth/domain/usecases/user_login.dart";
import "package:appetec/features/auth/domain/usecases/user_profile_setup.dart";
import "package:appetec/features/auth/domain/usecases/user_register.dart";
import "package:appetec/features/onboarding/domain/entities/onboarding_data.dart";
import "package:flutter/material.dart";
import "package:hydrated_bloc/hydrated_bloc.dart";

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final UserLogin userLogin;
  final UserRegister userRegister;
  final UserLogout userLogout;
  final UserProfileSetup userProfileSetup;

  AuthBloc({
    required this.userLogin,
    required this.userRegister,
    required this.userProfileSetup,
    required this.userLogout,
  }) : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      final res = await userLogin(
        UserLoginParams(email: event.email, password: event.password),
      );

      res.fold(
          (l) => emit(AuthFailure(l.message)), (r) => emit(AuthSuccess(r)));
    });

    on<AuthRegister>((event, emit) async {
      final res = await userRegister(
        UserRegisterParams(
          name: event.name,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
          acceptTerms: event.acceptTerms,
        ),
      );

      res.fold((l) => emit(AuthFailure(l.message)),
          (r) => emit(AuthSuccessMessage(r)));
    });

    on<AuthProfileSetUp>((event, emit) async {
      final res = await userProfileSetup(
        OnboardingDataParams(
          age: event.age,
          gender: event.gender,
          height: event.height,
          weight: event.weight,
          dietPreference: event.dietPreference,
          mindGoal: event.mindGoal,
          activityGoal: event.activityGoal,
          physicalGoal: event.physicalGoal,
          sleepGoal: event.sleepGoal,
          deviceData: event.deviceData,
          deviceUsageLimit: event.deviceUsageLimit,
          appPermissions: event.appPermissions,
        ),
      );

      debugPrint(state.userDetails!.toString());
      res.fold(
          (l) => emit(AuthProfileUpdateFailure(state.userDetails!, l.message)),
          (r) => emit(AuthSuccess(r)));
    });

    on<AuthLogout>((event, emit) async {
      final res = await userLogout();
      res.fold((l) => emit(AuthFailure(l.message)), (r) => emit(AuthInitial()));
    });
  }

  /// Called when the bloc is rehydrated from storage.
  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    final stateType = json['state'] as String?;
    if (stateType == "AuthSuccessMessage") {
      final message = json['message'] as String;
      return AuthSuccessMessage(message);
    } else if (stateType == 'AuthInitial') {
      return AuthInitial();
    } else if (stateType == 'AuthSuccess') {
      final userJson = json['userDetails'] as Map<String, dynamic>?;
      if (userJson == null) return AuthInitial();
      final user = User.fromJson(userJson);
      return AuthSuccess(user);
    } else if (stateType == 'AuthProfileUpdateFailure') {
      final userJson = json['userDetails'] as Map<String, dynamic>?;
      final message = json['message'] as String?;
      if (userJson == null) return AuthInitial();
      final user = User.fromJson(userJson);
      return AuthProfileUpdateFailure(user, message ?? "");
    } else if (stateType == 'AuthFailure') {
      final message = json['message'] as String?;
      return AuthFailure(message ?? '');
    }
    return AuthInitial();
  }

  /// Called when the bloc state is to be persisted.
  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthInitial) {
      return {'state': 'AuthInitial'};
    } else if (state is AuthSuccess) {
      return {
        'state': 'AuthSuccess',
        'userDetails': state.userDetails.toJson(),
        'isAuthenticated': state.isAuthenticated,
      };
    } else if (state is AuthFailure) {
      return {
        'state': 'AuthFailure',
        'message': state.message,
        'isAuthenticated': state.isAuthenticated,
      };
    } else if (state is AuthProfileUpdateFailure) {
      return {
        'state': 'AuthProfileUpdateFailure',
        'userDetails': state.userDetails.toJson(),
        'message': state.message,
        'isAuthenticated': state.isAuthenticated,
      };
    }
    return null;
  }
}
