part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}
class SignUpSuccessState extends SignUpState {}
class SignUpFailureState extends SignUpState {
  final String message;
  SignUpFailureState(this.message);
}

class SignUpDataValidState extends SignUpState {}

class ChangeVisibilityPasswordState extends SignUpState {}