class Device {
  final String id;
  final String name;
  final String description;
  final double version;
  final String thumbnailUrl;

  Device({
    required this.id,
    required this.name,
    required this.description,
    required this.version,
    required this.thumbnailUrl,
  });
}

class Devices {
  final int totalDevices;
  final int currentDevicesCount;
  final List<Device> devices;

  Devices(
      {required this.totalDevices,
      required this.currentDevicesCount,
      required this.devices});
}
