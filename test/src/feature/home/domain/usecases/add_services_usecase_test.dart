import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ix_takehome/src/core/utils/services_type.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/repositories/home_repository.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_services_usecase.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  final respository = HomeRepositoryMock();
  final usecase = AddServiceUsecase(respository);
  group('add service usecase ...', () {
    const serviceEntity = ServiceEntity(
      id: 'id',
      name: 'name',
      icon: 'icon',
      details: '',
      type: ServiceType.news,
    );

    test('''
verify a call to [HomeRepository.addService]
    the right data''', () async {
      when(() => respository.addService(serviceEntity))
          .thenAnswer((_) async => const Right(serviceEntity));
      await usecase(serviceEntity);
      verify(
        () => respository.addService(
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
  });
}
