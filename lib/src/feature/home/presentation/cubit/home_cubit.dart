import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void onPageChanged(int index) {
    emit(HomeInitial(currentPageIndex: index));
  }
}
