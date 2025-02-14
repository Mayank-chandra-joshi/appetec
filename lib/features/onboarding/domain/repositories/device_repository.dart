import 'package:appetec/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/device.dart';

abstract class DeviceRepository {
  Future<Either<Failure, Devices>> fetchDevices();
}
