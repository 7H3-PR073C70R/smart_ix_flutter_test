import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/repositories/home_repository.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/toggle_device_usecase.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  final respository = HomeRepositoryMock();
  final usecase = ToggleDeviceUsecase(respository);
  group('toggle device usecase ...', () {
    const deviceEntity = DeviceEntity(
      id: 'id',
      name: 'name',
      status: true,
      icon: 'icon',
    );

    test('''
verify a call to [HomeRepository.toggleDevice]
    the right data''', () async {
      when(() => respository.toggleDevice(deviceEntity))
          .thenAnswer((_) async => const Right(deviceEntity));
      await usecase(deviceEntity);
      verify(
        () => respository.toggleDevice(
          const DeviceEntity(
            id: 'id',
            name: 'name',
            status: true,
            icon: 'icon',
          ),
        ),
      );
    });
  });
}
