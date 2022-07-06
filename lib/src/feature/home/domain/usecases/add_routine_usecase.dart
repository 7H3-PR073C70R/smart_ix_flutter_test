import 'package:dartz/dartz.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/core/utils/use_case.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/repositories/home_repository.dart';

class AddRoutineUsecase extends Usecase<RoutineEntity, RoutineEntity> {
  AddRoutineUsecase(this.homeRepository);
  final HomeRepository homeRepository;
  @override
  Future<Either<Failure, RoutineEntity>> call(RoutineEntity params) {
    return homeRepository.addNewRoutine(params);
  }
}
