import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';

abstract class HomeRemoteDataSource {
  Future<DeviceEntity> addNewDevice(DeviceEntity device);
  Future<List<DeviceEntity>> getAllDevices();
  Future<RoutineEntity> addNewRoutine(RoutineEntity routine);
  Future<RoutineEntity> editRoutine(RoutineEntity routine);
  Future<List<RoutineEntity>> getAllRoutines();
  Future<ServiceEntity> addService(ServiceEntity serviceEntity);
  Future<List<ServiceEntity>> getAllServices();
  Future<DeviceEntity> toggleDevice(DeviceEntity device);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<DeviceEntity> addNewDevice(DeviceEntity device) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    return device;
  }

  @override
  Future<RoutineEntity> addNewRoutine(RoutineEntity routine) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    return routine;
  }

  @override
  Future<ServiceEntity> addService(ServiceEntity serviceEntity) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    return serviceEntity;
  }

  @override
  Future<RoutineEntity> editRoutine(RoutineEntity routine) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    return routine;
  }

  @override
  Future<List<DeviceEntity>> getAllDevices() {
    throw UnimplementedError();
  }

  @override
  Future<List<RoutineEntity>> getAllRoutines() {
    throw UnimplementedError();
  }

  @override
  Future<List<ServiceEntity>> getAllServices() {
    throw UnimplementedError();
  }

  @override
  Future<DeviceEntity> toggleDevice(DeviceEntity device) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    return DeviceEntity(
      id: device.id,
      name: device.name,
      icon: device.icon,
      status: !device.status,
    );
  }
}
