import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_ix_takehome/src/services/local_storage.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';
import 'package:smart_ix_takehome/src/services/snackbar_service.dart';


final locator = GetIt.instance;

Future<void> init() async {
//!UseCases DI

//!DataSources DI

//!Repositories DI

//!External Services DI
  final sharedPreferences = await SharedPreferences.getInstance();
  locator
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences)
    ..registerSingleton<LocalStorageService>(LocalStorageService(locator()))
    ..registerSingleton<NavigationService>(NavigationService())
    ..registerSingleton<SnackbarService>(SnackbarService())
    ..registerSingleton<Logger>(Logger());
}
