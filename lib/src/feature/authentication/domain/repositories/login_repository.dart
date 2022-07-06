import 'package:dartz/dartz.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/entities/login_param.dart';

// ignore: one_member_abstracts
abstract class AuthRepository {
  Future<Either<Failure, bool>> login(LoginParam param);
}
