part of 'login_cubit.dart';

@immutable
abstract class LoginState {}


class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginFailureState extends LoginState {
  final String message;
  LoginFailureState(this.message);
}

class LoginDataValidState extends LoginState {}
class CheckValueState extends LoginState {
  bool checkValue=false;
  CheckValueState(this.checkValue);
}

//show And Hide Password
class ChangeVisibilityPasswordSate extends LoginState {}