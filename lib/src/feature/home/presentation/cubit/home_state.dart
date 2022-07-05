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

class HomeInitial extends HomeState {
  const HomeInitial({
    super.currentPageIndex = 0,
    super.devices = const [],
    super.routines = const [],
    super.services = const [],
  });
}
