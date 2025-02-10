import 'package:appetec/router/path_constants.dart';
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
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        name: AppRouteConstants.REGISTER_USER,
        path: '/auth/register',
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        name: AppRouteConstants.PROFILE_SETUP,
        path: '/auth/profile',
        builder: (context, state) => ProfileSetupPage(),
      ),
      GoRoute(
        name: AppRouteConstants.SET_GOALS,
        path: '/auth/goals',
        builder: (context, state) => GoalsPage(),
      ),
      GoRoute(
        name: AppRouteConstants.SELECT_DEVICE,
        path: '/devices',
        builder: (context, state) => SelectDevicePage(),
      ),
      GoRoute(
        name: AppRouteConstants.ADD_DEVICE,
        path: '/add/device',
        builder: (context, state) => EnterDevicePage(),
      ),
      GoRoute(
        name: AppRouteConstants.GET_APP_PERMISSIONS,
        path: '/get/app_permissions',
        builder: (context, state) => GetAppPermissionsPage(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage());
    },
    // redirect: (context, state) {

    // },
  );
}
