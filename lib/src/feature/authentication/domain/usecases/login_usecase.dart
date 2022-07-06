import 'package:dartz/dartz.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/core/utils/use_case.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/entities/login_param.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/repositories/login_repository.dart';

class LoginUsecase extends Usecase<bool, LoginParam> {
  LoginUsecase(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(LoginParam params) {
    return authRepository.login(params);
  }
}
