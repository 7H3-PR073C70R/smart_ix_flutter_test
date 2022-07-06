import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/entities/login_param.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/repositories/login_repository.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/usecases/login_usecase.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  final respository = AuthRepositoryMock();
  final usecase = LoginUsecase(respository);
  group('login usecase ...', () {
    const loginParam =
        LoginParam(email: 'example@example.com', password: '1234567890');

    test('''
verify a call to [AuthRepository.login]
    the right data''', () async {
      when(() => respository.login(loginParam))
          .thenAnswer((_) async => const Right(true));
      await usecase(loginParam);
      verify(
        () => respository.login(
          const LoginParam(
            email: 'example@example.com',
            password: '1234567890',
          ),
        ),
      );
    });
  });
}
