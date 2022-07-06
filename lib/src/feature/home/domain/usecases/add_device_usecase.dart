import 'package:dartz/dartz.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/core/utils/use_case.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/repositories/home_repository.dart';

class AddDeviceUsecase extends Usecase<DeviceEntity, DeviceEntity> {

  AddDeviceUsecase(this.homeRepository);

  final HomeRepository homeRepository;
  @override
  Future<Either<Failure, DeviceEntity>> call(DeviceEntity params) {
    return homeRepository.addNewDevice(params);
  }
}
