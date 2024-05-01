import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/core/common/freezed_data_class.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/domain/model/login/login_model.dart';
import 'package:mandoob/features/auth/domain/usecase/login_usecase.dart';
import 'package:meta/meta.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _email = '';
  String _password = '';
  bool isDataValid = false;


  void toggleCheckbox(bool checkValue) {
    emit(CheckValueState(checkValue));
  }

  final LoginUseCase _loginUseCase;
  var loginObject = LoginObject("", "");

  LoginCubit(this._loginUseCase) : super(LoginInitialState()) {
    checkRememberMe();
  }

  Future<void> checkRememberMe() async {
    AppPreferences _appPreferences = instance<AppPreferences>();

    bool rememberMe = await _appPreferences.getRememberMe();
    print("rememberMe :$rememberMe");
    if (rememberMe) {
      _email = await _appPreferences.getRememberMeEmail();
      _password = await _appPreferences.getRememberMePassword();
      emailController.text = _email;
      passwordController.text = _password;
      isDataValid = true;

      emit(RestoreEmailState(_email));
      emit(RestorePasswordState(_password));
    }
  }

  void setEmail(String email) {
    _email = email;
    loginObject = loginObject.copyWith(email: email.trim());
    _checkDataValidity();
  }

  void setPassword(String password) {
    _password = password;
    loginObject = loginObject.copyWith(password: password);

    _checkDataValidity();
  }

  void _checkDataValidity() {
    isDataValid = _email.isNotEmpty && _password.isNotEmpty;
    emit(LoginDataValidState());
  }

  void logout(BuildContext context) {
    AppPreferences _appPreferences = instance<AppPreferences>();
    _appPreferences.setUserLoggedIn(false);
    _appPreferences.logout();
    emit(LogoutSuccessState());
  }

  Future<void> login(
      {required BuildContext context,
      required String email,
      required String password,
      required bool rememberMe}) async {
    AppPreferences _appPreferences = instance<AppPreferences>();

    emit(LoginLoadingState());
    final result = await _loginUseCase
        .execute(LoginRequest(email: email, accountPassword: password));

    result.fold(
      (failure) => emit(LoginFailureState(failure.message)),
      (data) async {
        await _saveUserDataLocal(data);
        if (rememberMe) {
          await _appPreferences.setRememberMe(true);
          await _appPreferences.setRememberMeEmail(email);
          await _appPreferences.setRememberMePassword(password);
        } else {
          await _appPreferences.setRememberMe(false);
          await _appPreferences.setRememberMeEmail("");
        }
        emit(LoginSuccessState());
      },
    );
  }

  LoginState _failureOrLoginToState(Either<Failure, LoginModel> either) {
    return either.fold((failure) => LoginFailureState(failure.message), (data) {
      return _saveUserDataLocal(data);
    });
  }

  _saveUserDataLocal(LoginModel data) {
    AppPreferences _appPreferences = instance<AppPreferences>();
    _appPreferences.setUserLoggedIn(true);
    _appPreferences.setUserToken(data.token);
    resetModules();
    return LoginSuccessState();
  }

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_outlined;

  void changePasswordIcon() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibilityPasswordSate());
  }
}
