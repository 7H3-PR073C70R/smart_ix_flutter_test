import 'package:dartz/dartz.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/core/utils/use_case.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/repositories/home_repository.dart';

class AddServiceUsecase extends Usecase<ServiceEntity, ServiceEntity> {
  AddServiceUsecase(this.homeRepository);
  final HomeRepository homeRepository;
  @override
  Future<Either<Failure, ServiceEntity>> call(ServiceEntity params) {
    return homeRepository.addService(params);
  }
}
