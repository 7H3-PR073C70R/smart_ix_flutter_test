// ignore_for_file: one_member_abstracts

import 'package:smart_ix_takehome/src/feature/authentication/domain/entities/login_param.dart';

abstract class AuthRemoteDataSource {
  Future<void> login(LoginParam param);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> login(LoginParam param) async {
    await Future.delayed(const Duration(seconds: 1), () {});
  }
}
