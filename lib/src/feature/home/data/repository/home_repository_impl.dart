import 'package:dartz/dartz.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/feature/home/data/datasource/remote_date_source.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this.remoteDataSource);
  final HomeRemoteDataSource remoteDataSource;
  @override
  Future<Either<Failure, DeviceEntity>> addNewDevice(
    DeviceEntity device,
  ) async {
    try {
      final result = await remoteDataSource.addNewDevice(device);
      return Right(result);
    } catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, RoutineEntity>> addNewRoutine(
    RoutineEntity routine,
  ) async {
    try {
      final result = await remoteDataSource.addNewRoutine(routine);
      return Right(result);
    } catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ServiceEntity>> addService(
    ServiceEntity serviceEntity,
  ) async {
    try {
      final result = await remoteDataSource.addService(serviceEntity);
      return Right(result);
    } catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, RoutineEntity>> editRoutine(
    RoutineEntity routine,
  ) async {
    try {
      final result = await remoteDataSource.editRoutine(routine);
      return Right(result);
    } catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<DeviceEntity>>> getAllDevices() async {
    try {
      final result = await remoteDataSource.getAllDevices();
      return Right(result);
    } catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<RoutineEntity>>> getAllRoutines() async {
    try {
      final result = await remoteDataSource.getAllRoutines();
      return Right(result);
    } catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getAllServices() async {
    try {
      final result = await remoteDataSource.getAllServices();
      return Right(result);
    } catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, DeviceEntity>> toggleDevice(
    DeviceEntity device,
  ) async {
    try {
      final result = await remoteDataSource.toggleDevice(device);
      return Right(result);
    } catch (e) {
      return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }
}
