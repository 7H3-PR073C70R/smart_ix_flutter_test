import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/repository/login_repository.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/repositories/login_repository.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/usecases/login_usecase.dart';

final locator = GetIt.instance;

Future<void> init() async {
//!UseCases DI
  locator
    ..registerLazySingleton(() => LoginUsecase(locator()))

//!DataSources DI
    ..registerLazySingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl.new,
    )

//!Repositories DI
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        locator(),
      ),
    )

//!External Services DI
    ..registerSingleton<Logger>(Logger());
}
