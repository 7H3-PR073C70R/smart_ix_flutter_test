// ignore_for_file: cascade_invocations

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/core/utils/services_type.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_device_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_routine_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_services_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/edit_routine_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/toggle_device_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';

class AddServiceUsecaseMock extends Mock implements AddServiceUsecase {}

class AddDeviceUsecaseMock extends Mock implements AddDeviceUsecase {}

class AddRoutineUsecaseMock extends Mock implements AddRoutineUsecase {}

class EditRoutineUsecaseMock extends Mock implements EditRoutineUsecase {}

class NavigationServiceMock extends Mock implements NavigationService {}

class ToggleDeviceUsecaseMock extends Mock implements ToggleDeviceUsecase {}

void main() {
  final addDeviceUsecase = AddDeviceUsecaseMock();
  final addRoutineUsecase = AddRoutineUsecaseMock();
  final editRoutineUsecase = EditRoutineUsecaseMock();
  final addServiceUsecase = AddServiceUsecaseMock();
  final navigationService = NavigationServiceMock();
  final toggleDeviceUsecase = ToggleDeviceUsecaseMock();

  const deviceEntity = DeviceEntity(
    id: 'id',
    name: 'name',
    status: false,
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
  group('CounterCubit', () {
    test('initial state is HomeLoaded', () {
      expect(
        HomeCubit(
          addDeviceUsecase: addDeviceUsecase,
          addRoutineUsecase: addRoutineUsecase,
          addServiceUsecase: addServiceUsecase,
          editRoutineUsecase: editRoutineUsecase,
          navigationService: navigationService,
          toggleDeviceUsecase: toggleDeviceUsecase,
        ).state,
        equals(
          const HomeLoaded(),
        ),
      );
    });

    blocTest<HomeCubit, HomeState>(
      '''
emits HomeLoaded with currentPageIndex set to 
      1 when increment is called''',
      build: () => HomeCubit(
        addDeviceUsecase: addDeviceUsecase,
        addRoutineUsecase: addRoutineUsecase,
        addServiceUsecase: addServiceUsecase,
        editRoutineUsecase: editRoutineUsecase,
        navigationService: navigationService,
        toggleDeviceUsecase: toggleDeviceUsecase,
      ),
      act: (cubit) => cubit.onPageChanged(1),
      expect: () => [
        equals(
          const HomeLoaded(
            currentPageIndex: 1,
          ),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      '''
emits HomeLoaded with added device when addDevice is called''',
      build: () => HomeCubit(
        addDeviceUsecase: addDeviceUsecase,
        addRoutineUsecase: addRoutineUsecase,
        addServiceUsecase: addServiceUsecase,
        editRoutineUsecase: editRoutineUsecase,
        navigationService: navigationService,
        toggleDeviceUsecase: toggleDeviceUsecase,
      ),
      act: (cubit) => cubit.addDevice(
        deviceEntity,
      ),
      setUp: () => when(
        () => addDeviceUsecase(deviceEntity),
      ).thenAnswer(
        (_) async => const Right<Failure, DeviceEntity>(deviceEntity),
      ),
      expect: () => [
        equals(const HomeLoading()),
        equals(
          const HomeLoaded(
            devices: [
              DeviceEntity(
                id: 'id',
                name: 'name',
                status: false,
                icon: 'icon',
              ),
            ],
          ),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      '''
emits HomeLoaded with added service when addService is called''',
      build: () => HomeCubit(
        addDeviceUsecase: addDeviceUsecase,
        addRoutineUsecase: addRoutineUsecase,
        addServiceUsecase: addServiceUsecase,
        editRoutineUsecase: editRoutineUsecase,
        navigationService: navigationService,
        toggleDeviceUsecase: toggleDeviceUsecase,
      ),
      setUp: () => when(
        () => addServiceUsecase(serviceEntity),
      ).thenAnswer(
        (_) async => const Right<Failure, ServiceEntity>(serviceEntity),
      ),
      act: (cubit) => cubit.addService(serviceEntity),
      expect: () => [
        equals(const HomeLoading()),
        equals(
          const HomeLoaded(
            currentPageIndex: 2,
            services: [
              ServiceEntity(
                id: 'id',
                name: 'name',
                icon: 'icon',
                details: '',
                type: ServiceType.news,
              )
            ],
          ),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      '''
emits HomeLoaded with added routine when addRoutine is called''',
      build: () => HomeCubit(
        addDeviceUsecase: addDeviceUsecase,
        addRoutineUsecase: addRoutineUsecase,
        addServiceUsecase: addServiceUsecase,
        editRoutineUsecase: editRoutineUsecase,
        navigationService: navigationService,
        toggleDeviceUsecase: toggleDeviceUsecase,
      ),
      setUp: () => when(
        () => addRoutineUsecase(routineEntity),
      ).thenAnswer(
        (_) async => const Right<Failure, RoutineEntity>(routineEntity),
      ),
      act: (cubit) => cubit.addRoutine(routineEntity),
      expect: () => [
        equals(const HomeLoading()),
        equals(
          const HomeLoaded(
            currentPageIndex: 1,
            routines: [
              RoutineEntity(
                id: 'id',
                name: 'name',
                imagePath: 'icon',
                action: true,
                repeatedDays: [],
                time: '00:00',
              ),
            ],
          ),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      '''
emits HomeLoaded with currentPageIndex set to 
      1 when increment is called''',
      build: () => HomeCubit(
        addDeviceUsecase: addDeviceUsecase,
        addRoutineUsecase: addRoutineUsecase,
        addServiceUsecase: addServiceUsecase,
        editRoutineUsecase: editRoutineUsecase,
        navigationService: navigationService,
        toggleDeviceUsecase: toggleDeviceUsecase,
      ),
      act: (cubit) => cubit.onPageChanged(1),
      expect: () => [
        equals(
          const HomeLoaded(
            currentPageIndex: 1,
          ),
        ),
      ],
    );
  });
}
