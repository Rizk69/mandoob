part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LogoutSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final String message;
  LoginFailureState(this.message);
}

class RestoreEmailState extends LoginState {
  final String email;
  RestoreEmailState(this.email);
}

class RestorePasswordState extends LoginState {
  final String password;
  RestorePasswordState(this.password);
}

class LoginDataValidState extends LoginState {}

class CheckValueState extends LoginState {
  bool checkValue = false;
  CheckValueState(this.checkValue);
}

class ChangeVisibilityPasswordSate extends LoginState {}
