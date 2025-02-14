import 'package:appetec/core/error/failures.dart';
import 'package:appetec/features/onboarding/data/sources/device_remote_source.dart';
import 'package:appetec/features/onboarding/domain/entities/device.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceRemoteSource deviceRemoteSource;

  DeviceRepositoryImpl({required this.deviceRemoteSource});

  @override
  Future<Either<Failure, Devices>> fetchDevices() async {
    try {
      final devices = await deviceRemoteSource.getAllDevices();

      return right(devices);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
