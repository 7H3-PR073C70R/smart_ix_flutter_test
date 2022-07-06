import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/device_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';
import 'package:smart_ix_takehome/src/feature/home/domain/entities/service_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void onPageChanged(int index) {
    emit(
      HomeInitial(
        currentPageIndex: index,
        devices: state.devices,
        routines: state.routines,
        services: state.services,
      ),
    );
  }
}
