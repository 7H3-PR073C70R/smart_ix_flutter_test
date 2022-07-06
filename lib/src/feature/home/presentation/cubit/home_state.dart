part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState({
    required this.currentPageIndex,
    required this.devices,
    required this.routines,
    required this.services,
  });
  final int currentPageIndex;
  final List<DeviceEntity> devices;
  final List<RoutineEntity> routines;
  final List<ServiceEntity> services;

  @override
  List<Object> get props => [
        currentPageIndex,
        devices,
        routines,
        services,
      ];
}

class HomeLoading extends HomeState {
  const HomeLoading({
    super.currentPageIndex = 0,
    super.devices = const [],
    super.routines = const [],
    super.services = const [],
  });
}

class HomeLoaded extends HomeState {
  const HomeLoaded({
    super.currentPageIndex = 0,
    super.devices = const [],
    super.routines = const [],
    super.services = const [],
  });

  @override
  List<Object> get props => [
        currentPageIndex,
        devices,
        routines,
        services,
      ];
}
