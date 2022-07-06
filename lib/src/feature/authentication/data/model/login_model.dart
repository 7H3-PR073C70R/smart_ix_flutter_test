import 'package:smart_ix_takehome/src/feature/authentication/domain/entities/login_param.dart';

class LoginParamModel extends LoginParam {
  LoginParamModel({required super.email, required super.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
