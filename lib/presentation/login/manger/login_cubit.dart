import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/model/login/login_model.dart';
import 'package:mandoob/domain/usecase/login_usecase.dart';
import 'package:mandoob/presentation/common/freezed_data_class.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  void toggleCheckbox(bool checkValue) => emit(CheckValueState(checkValue));

  final LoginUseCase _loginUseCase;
  var loginObject = LoginObject("", "");

  LoginCubit(this._loginUseCase) : super(LoginInitialState());

  String _email = '';
  String _password = '';

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

//Todo Create Vallidtion Email And Password in Function file

  bool isDataValid = false;

  void _checkDataValidity() {
    isDataValid = _email.isNotEmpty && _password.isNotEmpty;
    emit(LoginDataValidState());
  }

  Future<void> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    emit(LoginLoadingState());
    loginObject = loginObject.copyWith(email: email, password: password);
    final result = await _loginUseCase.execute(LoginRequest(
        email: loginObject.email, accountPassword: loginObject.password));
    emit(_failureOrLoginToState(result));
  }

  LoginState _failureOrLoginToState(Either<Failure, LoginModel> either) {
    return either.fold((failure) => LoginFailureState(failure.message), (data) {
      return _saveUserDataLocal(data);
    });
  }

  _saveUserDataLocal(LoginModel data) {
    AppPreferences _appPreferences = instance<AppPreferences>();
    _appPreferences.setUserLoggedIn(true);
    _appPreferences.setUserId(data.yearId);
    _appPreferences.setStudentId(data.studentId);
    _appPreferences.setUserId(data.userId);
    _appPreferences.setUserArName(data.userArName);
    _appPreferences.setUserPicture(data.userPicture);
    _appPreferences.setUserTypeId(data.userTypeId);
    _appPreferences.setUserTypeArName(data.userTypeArName);
    _appPreferences.setUserToken(data.authToken!.token);
    _appPreferences.setRoleId(data.authToken!.roleId);
    _appPreferences.setTypeId(data.authToken!.typeId);
    _appPreferences.setUserLoggedIn(true);
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
