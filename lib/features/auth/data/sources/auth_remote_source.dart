import 'dart:convert';
import 'dart:io';

import 'package:appetec/core/constants/backend/url.dart';
import 'package:appetec/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteSource {
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteSourceImp implements AuthRemoteSource {
  final HttpClient httpClient = HttpClient();

  @override
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse("${BackendURL.url}/api/login");

      final request = await httpClient.postUrl(url)
        ..headers.contentType = ContentType.json
        ..write(jsonEncode({'email': email, 'password': password}));

      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final String responseBody =
            await response.transform(utf8.decoder).join();
        final Map<String, dynamic> jsonData = jsonDecode(responseBody);

        print(responseBody);
        return UserModel.fromJson(jsonData);
      } else {
        throw HttpException(
          "Error: ${response.statusCode} ${response.reasonPhrase}",
        );
      }
    } catch (e) {
      throw "Exception: $e";
    }
  }
}
