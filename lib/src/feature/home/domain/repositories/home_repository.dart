import 'package:dartz/dartz.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, DeviceEntity>> addNewDevice(DeviceEntity device);
  Future<Either<Failure, List<DeviceEntity>>> getAllDevices();
  Future<Either<Failure, RoutineEntity>> addNewRoutine(RoutineEntity routine);
  Future<Either<Failure, RoutineEntity>> editRoutine(RoutineEntity routine);
  Future<Either<Failure, List<RoutineEntity>>> getAllRoutines();
  Future<Either<Failure, ServiceEntity>> addService(
    ServiceEntity serviceEntity,
  );
  Future<Either<Failure, List<ServiceEntity>>> getAllServices();
}
