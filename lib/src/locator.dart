import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/repository/login_repository.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/repositories/login_repository.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/usecases/login_usecase.dart';
import 'package:smart_ix_takehome/src/services/local_storage.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';
import 'package:smart_ix_takehome/src/services/snackbar_service.dart';

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
    );

//!External Services DI
  final sharedPreferences = await SharedPreferences.getInstance();
  locator
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences)
    ..registerSingleton<LocalStorageService>(LocalStorageService(locator()))
    ..registerSingleton<NavigationService>(NavigationService())
    ..registerSingleton<SnackbarService>(SnackbarService())
    ..registerSingleton<Logger>(Logger());
}
