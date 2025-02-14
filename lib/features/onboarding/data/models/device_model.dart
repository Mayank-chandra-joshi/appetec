import 'package:appetec/features/onboarding/domain/entities/device.dart';

class DevicesModel extends Devices {
  @override
  List<DeviceModel> devices;

  DevicesModel({
    required super.totalDevices,
    required super.currentDevicesCount,
    required this.devices,
  }) : super(devices: devices);

  factory DevicesModel.fromJson(Map<String, dynamic> map) {
    return DevicesModel(
      totalDevices: map["total"],
      currentDevicesCount: map["nbHits"],
      devices: List<DeviceModel>.from(
          map["devices"].map((device) => DeviceModel.fromJson(device))),
    );
  }
}

class DeviceModel extends Device {
  DeviceModel({
    required super.id,
    required super.name,
    required super.description,
    required super.version,
    required super.thumbnailUrl,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> map) {
    return DeviceModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        thumbnailUrl: map['thumbnailUrl'],
        version: map['version']);
  }
}
