import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/entities/login_param.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/usecases/login_usecase.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/home_page.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase, required this.navigationService})
      : super(LoginInitial());

  final LoginUsecase loginUseCase;
  final NavigationService navigationService;

  Future<void> onLoginButtonPressed({
    required String email,
    required String password,
  }) async {
    
    emit(LoginLoading());

    final result = await loginUseCase(
      LoginParam(email: email, password: password),
    );

    result.fold((l) => emit(LoginFailure(message: l.message)), (r) {
      if (r) {
        navigationService.navigateOffAllNamed(
          HomePage.route,
          (route) => route.isCurrent,
        );
      }
    });
  }
}
