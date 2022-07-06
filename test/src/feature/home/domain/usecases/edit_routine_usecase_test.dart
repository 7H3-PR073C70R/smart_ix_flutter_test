import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/repositories/home_repository.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/edit_routine_usecase.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  final respository = HomeRepositoryMock();
  final usecase = EditRoutineUsecase(respository);
  group('edit routine usecase ...', () {
    const routineEntity = RoutineEntity(
      id: 'id',
      name: 'name',
      status: true,
      icon: 'icon',
      action: true,
    );

    test('''
verify a call to [HomeRepository.editRoutine]
    the right data''', () async {
      when(() => respository.editRoutine(routineEntity))
          .thenAnswer((_) async => const Right(routineEntity));
      await usecase(routineEntity);
      verify(
        () => respository.editRoutine(
          const RoutineEntity(
            id: 'id',
            name: 'name',
            status: true,
            icon: 'icon',
            action: true,
          ),
        ),
      );
    });
  });
}
