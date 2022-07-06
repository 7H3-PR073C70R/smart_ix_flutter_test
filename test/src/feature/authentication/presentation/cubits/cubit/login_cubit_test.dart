import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/entities/login_param.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/usecases/login_usecase.dart';
import 'package:smart_ix_takehome/src/feature/authentication/presentation/cubits/cubit/login_cubit.dart';
import 'package:smart_ix_takehome/src/services/navigation_service.dart';

class LoginUsecaseMock extends Mock implements LoginUsecase {}

class NavigationServiceMock extends Mock implements NavigationService {}

void main() {
  final loginUsecase = LoginUsecaseMock();
  final navigationService = NavigationServiceMock();
  const loginParam =
      LoginParam(email: 'example@example.com', password: '1234567890');
  group('LoginCubit', () {
    test('initial state is LoginInitial', () {
      expect(
        LoginCubit(
          loginUseCase: loginUsecase,
          navigationService: navigationService,
        ).state,
        equals(
          LoginInitial(),
        ),
      );
    });
    blocTest<LoginCubit, LoginState>(
      'emits LoginLoading when [onLoginButtonPressed] is called',
      build: () => LoginCubit(
        loginUseCase: loginUsecase,
        navigationService: navigationService,
      ),
       setUp: () => when(
        () => loginUsecase(loginParam),
      ).thenAnswer(
        (_) async => const Right<Failure, bool>(true),
      ),
      act: (cubit) => cubit.onLoginButtonPressed(
       param:  loginParam,
      ),
      expect: () => [
        LoginLoading(),
        LoginInitial(),
      ],
    );
  });
}
