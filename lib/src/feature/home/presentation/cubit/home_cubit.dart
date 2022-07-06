import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_device_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_routine_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/add_services_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/edit_routine_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/usecases/toggle_device_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/home_page.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.addDeviceUsecase,
    required this.addRoutineUsecase,
    required this.addServiceUsecase,
    required this.editRoutineUsecase,
    required this.navigationService,
    required this.toggleDeviceUsecase,
  }) : super(const HomeLoaded());

  final AddServiceUsecase addServiceUsecase;
  final AddDeviceUsecase addDeviceUsecase;
  final AddRoutineUsecase addRoutineUsecase;
  final EditRoutineUsecase editRoutineUsecase;
  final NavigationService navigationService;
  final ToggleDeviceUsecase toggleDeviceUsecase;

  void onPageChanged(int index) {
    emit(
      HomeLoaded(
        currentPageIndex: index,
        devices: state.devices,
        routines: state.routines,
        services: state.services,
      ),
    );
  }

  Future<void> toggleDevice(DeviceEntity device) async {
    final index = state.devices.indexOf(device);
    final previousState = state;
    emit(
      HomeLoading(
        devices: previousState.devices,
      ),
    );
    final result = await toggleDeviceUsecase(device);
    result.fold(
      (error) => emit(
        HomeLoaded(
          currentPageIndex: state.currentPageIndex,
          devices: previousState.devices,
          routines: previousState.routines,
          services: previousState.services,
        ),
      ),
      (device) => emit(
        HomeLoaded(
          currentPageIndex: previousState.currentPageIndex,
          devices: [...previousState.devices..[index] = device],
          routines: previousState.routines,
          services: previousState.services,
        ),
      ),
    );
    _navigateBack();
    _navigateBack();
  }

  Future<void> addDevice(DeviceEntity device) async {
    final previousState = state;
    emit(const HomeLoading());
    final result = await addDeviceUsecase(device);
    result.fold(
      (failure) => emit(
        HomeLoaded(
          devices: previousState.devices,
          routines: previousState.routines,
          services: previousState.services,
        ),
      ),
      (device) => emit(
        HomeLoaded(
          devices: [...previousState.devices, device],
          routines: previousState.routines,
          services: previousState.services,
        ),
      ),
    );
    _navigateToHome();
  }

  Future<void> addRoutine(RoutineEntity routine) async {
    final previousState = state;
    emit(const HomeLoading());
    final result = await addRoutineUsecase(routine);
    result.fold(
      (failure) => emit(HomeLoaded(routines: previousState.routines)),
      (routine) => emit(
        HomeLoaded(
          routines: [...previousState.routines, routine],
          currentPageIndex: 1,
          devices: previousState.devices,
          services: previousState.services,
        ),
      ),
    );
    _navigateBack();
    _navigateToHome();
  }

  Future<void> addService(ServiceEntity service) async {
    final previousState = state;
    if (previousState.services.contains(service)) {
      emit(
        HomeLoaded(
          services: previousState.services,
          currentPageIndex: 2,
          devices: previousState.devices,
          routines: previousState.routines,
        ),
      );
      _navigateBack();
      return;
    }
    emit(const HomeLoading());
    final result = await addServiceUsecase(service);
    result.fold(
      (failure) => emit(HomeLoaded(services: previousState.services)),
      (service) => emit(
        HomeLoaded(
          services: [...previousState.services, service],
          currentPageIndex: 2,
          devices: previousState.devices,
          routines: previousState.routines,
        ),
      ),
    );

    _navigateToHome();
  }

  Future<void> editRoutine({
    required RoutineEntity routine,
    required RoutineEntity oldRoutine,
  }) async {
    final previousState = state;
    final index = previousState.routines.indexOf(oldRoutine);
    emit(const HomeLoading());
    final result = await editRoutineUsecase(routine);
    result.fold(
      (failure) => emit(HomeLoaded(routines: previousState.routines)),
      (routine) => emit(
        HomeLoaded(
          routines: previousState.routines..[index] = routine,
          currentPageIndex: previousState.currentPageIndex,
          devices: previousState.devices,
          services: previousState.services,
        ),
      ),
    );
    _navigateToHome();
  }

  void _navigateBack() {
    navigationService.navigateBack();
  }

  void _navigateToHome() {
    navigationService.navigateOffAllNamed(
      HomePage.route,
      (routes) => routes.isFirst,
    );
  }
}
