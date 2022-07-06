import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/repository/login_repository.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/repositories/login_repository.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/usecases/login_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/data/datasource/remote_date_source.dart';
import 'package:smart_ix_takehome/src/feature/home/data/repository/home_repository_impl.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/repositories/home_repository.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_device_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_routine_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_services_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/edit_routine_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/toggle_device_usecase.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';

final locator = GetIt.instance;

Future<void> init() async {
//!UseCases DI
  locator
    ..registerLazySingleton(() => LoginUsecase(locator()))
    ..registerLazySingleton(() => AddServiceUsecase(locator()))
    ..registerLazySingleton(() => AddDeviceUsecase(locator()))
    ..registerLazySingleton(() => AddRoutineUsecase(locator()))
    ..registerLazySingleton(() => EditRoutineUsecase(locator()))
    ..registerLazySingleton(() => ToggleDeviceUsecase(locator()))

    

//!DataSources DI
    ..registerLazySingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl.new,
    )
    ..registerLazySingleton<HomeRemoteDataSource>(
      HomeRemoteDataSourceImpl.new,
    )

//!Repositories DI
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        locator(),
      ),
    )
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        locator(),
      ),
    )

//!External Services DI
    ..registerSingleton<Logger>(Logger())
    ..registerLazySingleton<NavigationService>(
       NavigationService.new,
    );
}
