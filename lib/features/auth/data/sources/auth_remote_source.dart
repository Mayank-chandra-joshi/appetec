import 'dart:convert';

import 'package:appetec/core/constants/backend/url.dart';
import 'package:appetec/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
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
        throw "${e.response?.data["message"]}";
      } else {
        throw "${e.message}";
      }
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
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
    } catch (e) {
      throw "Exception: $e";
    }
  }
}
