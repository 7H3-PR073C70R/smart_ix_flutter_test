import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/home_page.dart';
import 'package:smart_ix_takehome/src/locator.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> onLoginButtonPressed({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 1), () {
      emit(LoginInitial());
    });

    await locator<NavigationService>().navigateOffAllNamed(
      HomePage.route,
      (route) => route.isCurrent,
    );
  }
}
