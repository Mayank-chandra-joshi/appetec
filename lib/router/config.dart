import 'package:appetec/router/path_constants.dart';
import 'package:appetec/router/transitions/fade_page_transition.dart';
import 'package:appetec/router/transitions/scale_page_transition.dart';
import 'package:appetec/router/transitions/slide_from_right_page_transition.dart';
import 'package:appetec/views/enter_device_page.dart';
import 'package:appetec/views/error_page.dart';
import 'package:appetec/views/get_app_permission_page.dart';
import 'package:appetec/views/login_page.dart';
import 'package:appetec/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appetec/views/profile_setup_page.dart';
import 'package:appetec/views/goals_page.dart';
import 'package:appetec/views/select_device_page.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/auth/login',
    routes: [
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
        path: '/auth/profile',
        pageBuilder: (context, state) => RightSlideIn(
          key: state.pageKey,
          child: ProfileSetupPage(),
        ),
      ),
      GoRoute(
        name: AppRouteConstants.SET_GOALS,
        path: '/auth/goals',
        pageBuilder: (context, state) => RightSlideIn(
          key: state.pageKey,
          child: GoalsPage(),
        ),
      ),
      GoRoute(
        name: AppRouteConstants.SELECT_DEVICE,
        path: '/devices',
        pageBuilder: (context, state) => RightSlideIn(
          key: state.pageKey,
          child: SelectDevicePage(),
        ),
      ),
      GoRoute(
        name: AppRouteConstants.ADD_DEVICE,
        path: '/add/device',
        pageBuilder: (context, state) => RightSlideIn(
          key: state.pageKey,
          child: EnterDevicePage(),
        ),
      ),
      GoRoute(
        name: AppRouteConstants.GET_APP_PERMISSIONS,
        path: '/get/app_permissions',
        pageBuilder: (context, state) => RightSlideIn(
          key: state.pageKey,
          child: GetAppPermissionsPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage());
    },
    // redirect: (context, state) {

    // },
  );
}
