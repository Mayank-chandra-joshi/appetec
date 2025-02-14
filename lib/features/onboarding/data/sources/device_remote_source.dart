import 'package:appetec/core/constants/backend/url.dart';
import 'package:appetec/features/onboarding/data/models/device_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class DeviceRemoteSource {
  Future<DevicesModel> getAllDevices();
}

class DeviceRemoteSourceImp implements DeviceRemoteSource {
  final dio = Dio();
  final storage = FlutterSecureStorage();

  @override
  Future<DevicesModel> getAllDevices() async {
    try {
      String? token = await storage.read(key: 'accessToken');

      final response = await dio.get(
        "${BackendURL.url}/api/devices",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final Map<String, dynamic> devicesJson = response.data;

      return DevicesModel.fromJson(devicesJson);
    } catch (e) {
      throw Exception('Failed to load devices');
    }
  }
}
