import 'package:appetec/features/onboarding/domain/entities/onboarding_data.dart';

class DeviceDataModel extends DeviceData {
  DeviceDataModel({required super.deviceId, required super.serialId});

  factory DeviceDataModel.fromEntity(DeviceData data) {
    return DeviceDataModel(deviceId: data.deviceId, serialId: data.serialId);
  }
}
