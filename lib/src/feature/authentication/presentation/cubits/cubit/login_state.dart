part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  const LoginFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'LoginError { message: $message }';
}
