import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/repository/login_repository.dart';
import 'package:smart_ix_takehome/src/feature/authentication/domain/entities/login_param.dart';

class AuthRemoteDataSourceMock extends Mock implements AuthRemoteDataSource {}

void main() {
  final remoteDataSource = AuthRemoteDataSourceMock();
  final repository = AuthRepositoryImpl(remoteDataSource);
  group('login repository ...', () {
    const loginParam = LoginParam(
      email: 'example@example.com',
      password: '1234567890',
    );
    test('''
Verify that the Right side of Either is 
        returned when login is successful''', () async {
      when(
        () => remoteDataSource.login(loginParam),
      ).thenAnswer(
        (_) => Future.value(),
      );
      final result = await repository.login(loginParam);
      expect(
        result,
        equals(
          const Right<Failure, bool>(true),
        ),
      );
    });

    test('''
Verify that the Left side of Either is 
        returned when login is unsuccessful''', () async {
      when(
        () => remoteDataSource.login(loginParam),
      ).thenAnswer(
        (_) => throw Exception(),
      );
      final result = await repository.login(loginParam);
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ServerFailure(),
          ),
        ),
      );
    });

    test('''
Verify call to AuthRemoteDataSource with the exact data''', () async {
      when(
        () => remoteDataSource.login(loginParam),
      ).thenAnswer(
        (_) => throw Exception(),
      );
      await repository.login(loginParam);
      verify(
        () => remoteDataSource.login(
          const LoginParam(
            email: 'example@example.com',
            password: '1234567890',
          ),
        ),
      );
    });
  });
}
