import 'package:appetec/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:appetec/features/dashboard/presentation/views/dashboard_page.dart';
import 'package:appetec/features/home/presentation/view/home_page.dart';
import 'package:appetec/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:appetec/features/profile/presentation/view/profile_page.dart';
import 'package:appetec/features/settings/presentation/view/settings_page.dart';
import 'package:appetec/features/splash/splash_page.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:appetec/router/dashboard_top_and_bottom_bar.dart';
import 'package:appetec/router/transitions/fade_page_transition.dart';
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

  GoRouter get router => GoRouter(
        initialLocation: '/',
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
            pageBuilder: (context, state) {
              final String deviceId = state.pathParameters['id']!;
              return RightSlideIn(
                key: state.pageKey,
                child: PairDevicePage(deviceId: deviceId),
              );
            },
          ),
          GoRoute(
            name: AppRouteConstants.GET_APP_PERMISSIONS,
            path: '/onboarding/get/app_permissions',
            pageBuilder: (context, state) => RightSlideIn(
              key: state.pageKey,
              child: GetAppPermissionsPage(),
            ),
          ),
          ShellRoute(
            builder: (context, state, child) {
              return DashboardTopAndBottombar(
                child: child,
              );
            },
            routes: [
              GoRoute(
                path: '/',
                name: AppRouteConstants.HOME,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: HomePage(),
                ),
              ),
              GoRoute(
                name: AppRouteConstants.DASHBOARD,
                path: '/dashboard',
                pageBuilder: (context, state) => RightSlideIn(
                  key: state.pageKey,
                  child: DashboardPage(),
                ),
              ),
              GoRoute(
                name: AppRouteConstants.SETTINGS,
                path: '/settings',
                pageBuilder: (context, state) => RightSlideIn(
                  key: state.pageKey,
                  child: SettingsPage(),
                ),
              ),
              GoRoute(
                name: AppRouteConstants.PROFILE,
                path: '/profile',
                pageBuilder: (context, state) => RightSlideIn(
                  key: state.pageKey,
                  child: ProfilePage(),
                ),
              )
            ],
          ),
        ],
        errorPageBuilder: (context, state) {
          return MaterialPage(child: ErrorPage());
        },
        redirect: (context, state) {
          // return '/onboarding/get/app_permissions';

          // context.goNamed(AppRouteConstants.ADD_DEVICE,
          //     pathParameters: {'id': "dfhskjnse"});

          final authState = context.read<AuthBloc>().state;
          final onboardingState = context.read<OnboardingBloc>().state;

          if (authState.isAuthenticated &&
              authState.userDetails != null &&
              authState.userDetails!.isAccountCompleted &&
              state.uri.path.contains("/onboarding")) {
            return '/';
          }

          if (!authState.isAuthenticated &&
              state.uri.toString() != '/auth/register') {
            return '/auth/login';
          }

          if (state.uri.toString() == '/onboarding/profile' &&
              authState.userDetails != null &&
              authState.userDetails!.isAccountCompleted) {
            return '/';
          }

          if (authState.userDetails != null &&
              !authState.userDetails!.isAccountCompleted) {
            if (onboardingState.onboardingData.age == null) {
              return '/onboarding/profile';
            }
            // else if(onboardingState.onboardingData.age != null) return ''
          }

          return null;
        },
      );
}
