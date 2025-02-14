import 'package:appetec/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/device.dart';
import '../repositories/device_repository.dart';

class GetDevices {
  final DeviceRepository repository;

  GetDevices(this.repository);

  Future<Either<Failure, Devices>> call() async {
    return await repository.fetchDevices();
  }
}
