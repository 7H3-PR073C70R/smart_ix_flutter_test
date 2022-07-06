import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/core/utils/services_type.dart';
import 'package:smart_ix_takehome/src/feature/home/data/datasource/remote_date_source.dart';
import 'package:smart_ix_takehome/src/feature/home/data/repository/home_repository_impl.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';

class HomeRemoteDataSourceMock extends Mock implements HomeRemoteDataSource {}

void main() {
  final remoteDataSource = HomeRemoteDataSourceMock();
  final repository = HomeRepositoryImpl(remoteDataSource);

  const deviceEntity = DeviceEntity(
    id: 'id',
    name: 'name',
    status: true,
    icon: 'icon',
  );

  const routineEntity = RoutineEntity(
    id: 'id',
    name: 'name',
    imagePath: 'icon',
    action: true,
    repeatedDays: [],
    time: '00:00',
  );

  const serviceEntity = ServiceEntity(
    id: 'id',
    name: 'name',
    icon: 'icon',
    details: '',
    type: ServiceType.news,
  );

  group('home repository impl ...', () {
    //! Device Unit Test
    group('Device Usecases Test', () {
      test('''
when [addNewDevice] is called and return the 
        right data expect the right side of either and verify a call with the right data''',
          () async {
        when(
          () => remoteDataSource.addNewDevice(deviceEntity),
        ).thenAnswer(
          (_) => Future.value(deviceEntity),
        );
        final result = await repository.addNewDevice(deviceEntity);
        expect(
          result,
          equals(
            const Right<Failure, DeviceEntity>(
              DeviceEntity(
                id: 'id',
                name: 'name',
                status: true,
                icon: 'icon',
              ),
            ),
          ),
        );
        verify(
          () => remoteDataSource.addNewDevice(
            const DeviceEntity(
              id: 'id',
              name: 'name',
              status: true,
              icon: 'icon',
            ),
          ),
        );
      });

      test('''
when [addNewDevice] is called and
the call failed expect the left side of either''', () async {
        when(
          () => remoteDataSource.addNewDevice(deviceEntity),
        ).thenAnswer(
          (_) => throw Exception('error'),
        );
        final result = await repository.addNewDevice(deviceEntity);
        expect(
          result,
          equals(
            const Left<Failure, DeviceEntity>(ServerFailure(message: 'error')),
          ),
        );
      });

      test('''
when [toggleDevice] is called and return the 
        right data expect the right side of either and verify a call with the right data''',
          () async {
        when(
          () => remoteDataSource.toggleDevice(deviceEntity),
        ).thenAnswer(
          (_) => Future.value(
            const DeviceEntity(
              id: 'id',
              name: 'name',
              status: false,
              icon: 'icon',
            ),
          ),
        );
        final result = await repository.toggleDevice(deviceEntity);
        expect(
          result,
          equals(
            const Right<Failure, DeviceEntity>(
              DeviceEntity(
                id: 'id',
                name: 'name',
                status: false,
                icon: 'icon',
              ),
            ),
          ),
        );
        verify(
          () => remoteDataSource.toggleDevice(
            const DeviceEntity(
              id: 'id',
              name: 'name',
              status: true,
              icon: 'icon',
            ),
          ),
        );
      });

      test('''
when [toggleDevice] is called and
the call failed expect the left side of either''', () async {
        when(
          () => remoteDataSource.toggleDevice(deviceEntity),
        ).thenAnswer(
          (_) => throw Exception('error'),
        );
        final result = await repository.toggleDevice(deviceEntity);
        expect(
          result,
          equals(
            const Left<Failure, DeviceEntity>(ServerFailure(message: 'error')),
          ),
        );
      });

      test('''
when [getAllDevices] is called and return the right data
expect the right side of either.''', () async {
        when(
          remoteDataSource.getAllDevices,
        ).thenAnswer(
          (_) => Future.value(const [deviceEntity]),
        );
        final result = await repository.getAllDevices();

        expect(
          result,
          equals(
            const Right<Failure, List<DeviceEntity>>(
              [
                DeviceEntity(
                  id: 'id',
                  name: 'name',
                  status: true,
                  icon: 'icon',
                ),
              ],
            ),
          ),
        );
        expect(result.length(), equals(1));
      });

      test('''
when [getAllDevices] is called and return the call failed
expect the left side of either.''', () async {
        when(
          remoteDataSource.getAllDevices,
        ).thenAnswer(
          (_) => throw Exception('error'),
        );
        final result = await repository.getAllDevices();

        expect(
          result,
          equals(
            const Left<Failure, DeviceEntity>(
              ServerFailure(message: 'error'),
            ),
          ),
        );
      });
    });

    //! Routine Unit Test
    group('Routine Usecases Test', () {
      test('''
when [addNewRoutine] is called and return the 
        right data expect the right side of either and verify a call with the right data''',
          () async {
        when(
          () => remoteDataSource.addNewRoutine(routineEntity),
        ).thenAnswer(
          (_) => Future.value(routineEntity),
        );
        final result = await repository.addNewRoutine(routineEntity);
        expect(
          result,
          equals(
            const Right<Failure, RoutineEntity>(
              RoutineEntity(
                id: 'id',
                name: 'name',
                imagePath: 'icon',
                action: true,
                repeatedDays: [],
                time: '00:00',
              ),
            ),
          ),
        );
        verify(
          () => remoteDataSource.addNewRoutine(
            const RoutineEntity(
              id: 'id',
              name: 'name',
              imagePath: 'icon',
              action: true,
              repeatedDays: [],
              time: '00:00',
            ),
          ),
        );
      });

      test('''
when [addNewRoutine] is called and
the call failed expect the left side of either''', () async {
        when(
          () => remoteDataSource.addNewRoutine(routineEntity),
        ).thenAnswer(
          (_) => throw Exception('error'),
        );
        final result = await repository.addNewRoutine(routineEntity);
        expect(
          result,
          equals(
            const Left<Failure, DeviceEntity>(ServerFailure(message: 'error')),
          ),
        );
      });

      test('''
when [editRoutine] is called and return the 
        right data expect the right side of either and verify a call with the right data''',
          () async {
        when(
          () => remoteDataSource.editRoutine(routineEntity),
        ).thenAnswer(
          (_) => Future.value(routineEntity),
        );
        final result = await repository.editRoutine(routineEntity);
        expect(
          result,
          equals(
            const Right<Failure, RoutineEntity>(
              RoutineEntity(
                id: 'id',
                name: 'name',
                imagePath: 'icon',
                action: true,
                repeatedDays: [],
                time: '00:00',
              ),
            ),
          ),
        );
        verify(
          () => remoteDataSource.editRoutine(
            const RoutineEntity(
              id: 'id',
              name: 'name',
              imagePath: 'icon',
              action: true,
              repeatedDays: [],
              time: '00:00',
            ),
          ),
        );
      });

      test('''
when [editRoutine] is called and
the call failed expect the left side of either''', () async {
        when(
          () => remoteDataSource.editRoutine(routineEntity),
        ).thenAnswer(
          (_) => throw Exception('error'),
        );
        final result = await repository.editRoutine(routineEntity);
        expect(
          result,
          equals(
            const Left<Failure, DeviceEntity>(ServerFailure(message: 'error')),
          ),
        );
      });

      test('''
when [getAllRoutine] is called and return the right data
expect the right side of either.''', () async {
        when(
          remoteDataSource.getAllRoutines,
        ).thenAnswer(
          (_) => Future.value(const [routineEntity]),
        );
        final result = await repository.getAllRoutines();

        expect(
          result,
          equals(
            const Right<Failure, List<RoutineEntity>>([
              RoutineEntity(
                id: 'id',
                name: 'name',
                imagePath: 'icon',
                action: true,
                repeatedDays: [],
                time: '00:00',
              )
            ]),
          ),
        );
        expect(result.length(), equals(1));
      });

      test('''
when [getAllRoutine] is called and return the call failed
expect the left side of either.''', () async {
        when(
          remoteDataSource.getAllRoutines,
        ).thenAnswer(
          (_) => throw Exception('error'),
        );
        final result = await repository.getAllRoutines();

        expect(
          result,
          equals(
            const Left<Failure, RoutineEntity>(
              ServerFailure(message: 'error'),
            ),
          ),
        );
      });
    });

    //! Service Unit Test
    group('Service Usecases Test', () {
      test('''
when [addService] is called and return the 
        right data expect the right side of either and verify a call with the right data''',
          () async {
        when(
          () => remoteDataSource.addService(serviceEntity),
        ).thenAnswer(
          (_) => Future.value(serviceEntity),
        );
        final result = await repository.addService(serviceEntity);
        expect(
          result,
          equals(
            const Right<Failure, ServiceEntity>(
              ServiceEntity(
                id: 'id',
                name: 'name',
                icon: 'icon',
                details: '',
                type: ServiceType.news,
              ),
            ),
          ),
        );
        verify(
          () => remoteDataSource.addService(
            const ServiceEntity(
              id: 'id',
              name: 'name',
              icon: 'icon',
              details: '',
              type: ServiceType.news,
            ),
          ),
        );
      });

      test('''
when [addService] is called and
the call failed expect the left side of either''', () async {
        when(
          () => remoteDataSource.addService(serviceEntity),
        ).thenAnswer(
          (_) => throw Exception('error'),
        );
        final result = await repository.addService(serviceEntity);
        expect(
          result,
          equals(
            const Left<Failure, ServiceEntity>(ServerFailure(message: 'error')),
          ),
        );
      });

      test('''
when [getAllService] is called and return the right data
expect the right side of either.''', () async {
        when(
          remoteDataSource.getAllServices,
        ).thenAnswer(
          (_) => Future.value(const [serviceEntity]),
        );
        final result = await repository.getAllServices();

        expect(
          result,
          equals(
            const Right<Failure, List<ServiceEntity>>([
              ServiceEntity(
                id: 'id',
                name: 'name',
                icon: 'icon',
                details: '',
                type: ServiceType.news,
              )
            ]),
          ),
        );
        expect(result.length(), equals(1));
      });

      test('''
when [getAllService] is called and return the call failed
expect the left side of either.''', () async {
        when(
          remoteDataSource.getAllServices,
        ).thenAnswer(
          (_) => throw Exception('error'),
        );
        final result = await repository.getAllServices();

        expect(
          result,
          equals(
            const Left<Failure, ServiceEntity>(
              ServerFailure(message: 'error'),
            ),
          ),
        );
      });
    });
  });
}
