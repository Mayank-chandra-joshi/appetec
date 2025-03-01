import 'dart:convert';

import 'package:appetec/core/constants/backend/url.dart';
import 'package:appetec/features/auth/data/models/onboarding_model.dart';
import 'package:appetec/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

abstract interface class AuthRemoteSource {
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<String> registerWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  });

  Future<String> logoutUser();

  Future<UserUpdateModel> userProfileSetup({
    required int age,
    required String gender,
    required double height,
    required int weight,
    required String dietPreference,
    required String mindGoal,
    required String activityGoal,
    required String physicalGoal,
    required String sleepGoal,
    required DeviceDataModel? deviceData,
    required double deviceUsageLimit,
    required List<String> appPermissions,
  });
}

class AuthRemoteSourceImp implements AuthRemoteSource {
  final dio = Dio();

  @override
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final String url = "${BackendURL.url}/api/login";

      final response = await dio.post(
        url,
        data: jsonEncode({'email': email, 'password': password}),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      final Map<String, dynamic> jsonData = response.data;

      return UserModel.fromJson(jsonData);
    } on DioException catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey("message")) {
          throw "${responseData["message"]}";
        } else {
          throw "An unexpected error occurred.";
        }
      } else {
        throw "${e.message}";
      }
    } catch (e) {
      throw "An unexpected error occurred: $e";
    }
  }

  @override
  Future<String> registerWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  }) async {
    try {
      final String url = "${BackendURL.url}/api/register";

      final response = await dio.post(
        url,
        data: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'acceptTerms': acceptTerms,
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data['message'] ?? "Registration successful";
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception("${e.response?.data["message"]}");
      } else {
        throw Exception("${e.message}");
      }
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  @override
  Future<String> logoutUser() async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'accessToken');

    try {
      await dio.get(
        "${BackendURL.url}/api/logout",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      await HydratedBloc.storage.clear();
      await storage.deleteAll();

      return "Logged out successfully";
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception("${e.response?.data["message"]}");
      } else {
        throw Exception("${e.message}");
      }
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  @override
  Future<UserUpdateModel> userProfileSetup({
    required int age,
    required String gender,
    required double height,
    required int weight,
    required String dietPreference,
    required String mindGoal,
    required String activityGoal,
    required String physicalGoal,
    required String sleepGoal,
    required DeviceDataModel? deviceData,
    required double deviceUsageLimit,
    required List<String> appPermissions,
  }) async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'accessToken');
    final dio = Dio();

    debugPrint(weight.toString());

    try {
      final response = await dio.put(
        "${BackendURL.url}/api/profile/setup_profile",
        data: {
          "age": age,
          "gender": gender,
          "height": height,
          "weight": weight,
          "diet_preference": dietPreference,
          "mind_goal": mindGoal,
          "activity_goal": activityGoal,
          "physical_goal": physicalGoal,
          "sleep_goal": sleepGoal,
          "deviceData": deviceData != null
              ? {
                  "deviceId": deviceData.deviceId,
                  "serialId": deviceData.serialId,
                }
              : null,
          "deviceUsageLimit": deviceUsageLimit,
          "app_permissions": appPermissions,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final Map<String, dynamic> jsonData = response.data["user"];
      return UserUpdateModel.fromJson(jsonData);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception("${e.response?.data["message"]}");
      } else {
        throw Exception("${e.message}");
      }
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
