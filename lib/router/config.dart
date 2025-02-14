import 'package:appetec/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:appetec/features/home/presentation/view/home_page.dart';
import 'package:appetec/features/splash/splash_page.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:appetec/router/transitions/scale_page_transition.dart';
import 'package:appetec/router/transitions/slide_from_right_page_transition.dart';
import 'package:appetec/features/onboarding/presentation/views/pair_device_page.dart';
import 'package:appetec/features/error_page.dart';
import 'package:appetec/features/onboarding/presentation/views/get_app_permission_page.dart';
import 'package:appetec/features/auth/presentation/views/login_page.dart';
import 'package:appetec/features/auth/presentation/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:appetec/features/onboarding/presentation/views/profile_setup_page.dart';
import 'package:appetec/features/onboarding/presentation/views/goals_page.dart';
import 'package:appetec/features/onboarding/presentation/views/select_device_page.dart';

class AppRouter {
  static const List<String> unprotectedRoutes = [
    AppRouteConstants.SPLASH,
    AppRouteConstants.LOGIN_USER,
    AppRouteConstants.REGISTER_USER,
  ];

  // Only those who have not completed thier profile
  static const List<String> partiallyProtectedRotues = [
    AppRouteConstants.PROFILE_SETUP,
    AppRouteConstants.SET_GOALS,
    AppRouteConstants.ADD_DEVICE,
    AppRouteConstants.SELECT_DEVICE,
    AppRouteConstants.GET_APP_PERMISSIONS
  ];

  GoRouter get router => GoRouter(
        initialLocation: '/splash',
        routes: [
          GoRoute(
            name: AppRouteConstants.SPLASH,
            path: '/splash',
            pageBuilder: (context, state) {
              return ScaleTransitionPage(
                key: state.pageKey,
                child: const SplashPage(),
              );
            },
          ),
          GoRoute(
            name: AppRouteConstants.LOGIN_USER,
            path: '/auth/login',
            pageBuilder: (context, state) {
              return ScaleTransitionPage(
                key: state.pageKey,
                child: const LoginPage(),
              );
            },
          ),
          GoRoute(
            name: AppRouteConstants.REGISTER_USER,
            path: '/auth/register',
            pageBuilder: (context, state) {
              return RightSlideIn(
                key: state.pageKey,
                child: RegisterPage(),
              );
            },
          ),
          GoRoute(
            name: AppRouteConstants.PROFILE_SETUP,
            path: '/onboarding/profile',
            pageBuilder: (context, state) => RightSlideIn(
              key: state.pageKey,
              child: ProfileSetupPage(),
            ),
          ),
          GoRoute(
            name: AppRouteConstants.SET_GOALS,
            path: '/onboarding/goals',
            pageBuilder: (context, state) => RightSlideIn(
              key: state.pageKey,
              child: GoalsPage(),
            ),
          ),
          GoRoute(
            name: AppRouteConstants.SELECT_DEVICE,
            path: '/onboarding/devices',
            pageBuilder: (context, state) => RightSlideIn(
              key: state.pageKey,
              child: SelectDevicePage(),
            ),
          ),
          GoRoute(
            name: AppRouteConstants.ADD_DEVICE,
            path: '/onboarding/pair/device/:id',
            pageBuilder: (context, state) => RightSlideIn(
              key: state.pageKey,
              child: PairDevicePage(),
            ),
          ),
          GoRoute(
            name: AppRouteConstants.GET_APP_PERMISSIONS,
            path: '/onboarding/get/app_permissions',
            pageBuilder: (context, state) => RightSlideIn(
              key: state.pageKey,
              child: GetAppPermissionsPage(),
            ),
          ),
          GoRoute(
            name: AppRouteConstants.HOME,
            path: '/',
            builder: (context, state) => HomePage(),
          ),
        ],
        errorPageBuilder: (context, state) {
          return MaterialPage(child: ErrorPage());
        },
        redirect: (context, state) {
          final authState = context.read<AuthBloc>().state;

          if ((authState is AuthInitial || authState is AuthFailure) &&
              state.uri.toString() != '/auth/register') {
            return '/auth/login';
          }

          if (state.uri.toString() == '/onboarding/profile' &&
              authState.isAccountCompleted) {
            return '/';
          }

          if (!authState.isAccountCompleted && authState is AuthSuccess) {
            return '/onboarding/prorfile';
          }

          return null;
        },
      );
}
