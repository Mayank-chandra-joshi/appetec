import 'package:appetec/core/error/failures.dart';
import 'package:appetec/features/onboarding/data/models/device_model.dart';
import 'package:appetec/features/onboarding/data/sources/device_remote_source.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceRemoteSource deviceRemoteSource;

  DeviceRepositoryImpl({required this.deviceRemoteSource});

  @override
  Future<Either<Failure, DevicesModel>> fetchDevices(int page) async {
    try {
      final devices = await deviceRemoteSource.getAllDevices(page);
      return right(devices);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
