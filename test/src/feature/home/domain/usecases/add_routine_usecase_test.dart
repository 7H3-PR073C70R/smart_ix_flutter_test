import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/repositories/home_repository.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_routine_usecase.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  final respository = HomeRepositoryMock();
  final usecase = AddRoutineUsecase(respository);
  group('add routine usecase ...', () {
    const routineEntity = RoutineEntity(
      id: 'id',
      name: 'name',
      imagePath: 'icon',
      action: true,
      repeatedDays: [],
      time: '00:00',
    );

    test('''
verify a call to [HomeRepository.addNewRoutine]
    the right data''', () async {
      when(() => respository.addNewRoutine(routineEntity))
          .thenAnswer((_) async => const Right(routineEntity));
      await usecase(routineEntity);
      verify(
        () => respository.addNewRoutine(
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
  });
}
