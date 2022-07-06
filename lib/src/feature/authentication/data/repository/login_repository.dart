import 'package:dartz/dartz.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/entities/login_param.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/repositories/login_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authRemoteDataSource);
  final AuthRemoteDataSource authRemoteDataSource;
  @override
  Future<Either<Failure, bool>> login(LoginParam param) async {
    try {
      await authRemoteDataSource.login(param);
      return const Right(true);
    } on Exception catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
