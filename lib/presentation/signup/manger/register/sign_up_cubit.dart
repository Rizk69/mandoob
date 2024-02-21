import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/model/register/register_model.dart';
import 'package:mandoob/domain/usecase/register_usecase.dart';
import 'package:mandoob/presentation/common/freezed_data_class.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final RegisterUseCase _registerUseCase;

  var registerObject = RegisterObject("", "", "", "", "", "", "", 0, "", 0);

  // List<StageModel> stage;
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _mobileNumber = '';
  String _userName = '';
  bool isDataValid = false;
  bool isPasswordVisible = true;
  IconData suffixIcon = Icons.visibility;



  SignUpCubit(this._registerUseCase) : super(SignUpInitialState());


  //Register
  void setUserName(String userName) {
    _userName = userName;
    registerObject = registerObject.copyWith(userName: userName);
    _checkRegisterDataValidity();
  }

  void setEmail(String email) {
    _email = email;
    registerObject = registerObject.copyWith(email: email);
    _checkRegisterDataValidity();
  }

  void setPassword(String password) {
    _password = password;
    registerObject = registerObject.copyWith(password: password);
    _checkRegisterDataValidity();
  }

  void setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    registerObject = registerObject.copyWith(confirmPassword: confirmPassword);
    _checkRegisterDataValidity();
  }

  void setMobileNumber(String mobileNumber) {
    _mobileNumber = mobileNumber;
    registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    _checkRegisterDataValidity();
  }

  Future<void> register() async {
    emit(SignUpLoadingState());
    final result = await _registerUseCase.execute(RegisterRequest(
        accountEmail: registerObject.email,
        accountPassword: registerObject.password,
        confirmPassword: registerObject.confirmPassword,
        arName: registerObject.userName,
        id: null,
        mobile: registerObject.mobileNumber,
        userTypeId: 2));
    emit(_failureOrRegisterToState(result));
  }

  SignUpState _failureOrRegisterToState(Either<Failure, RegisterModel> either) {
    return either.fold((failure) => SignUpFailureState(failure.message),
            (data) => _saveUserDataLocal(data));
  }



  _saveUserDataLocal(RegisterModel data) {
    AppPreferences _appPreferences = instance<AppPreferences>();
    _appPreferences.setUserLoggedIn(true);
    _appPreferences.setUserId(data.userId);
    _appPreferences.setUserArName(data.userArName);
    _appPreferences.setUserPicture(data.userPicture);
    _appPreferences.setUserTypeId(data.userTypeId);
    _appPreferences.setUserTypeArName(data.userTypeArName);
    _appPreferences.setUserToken(data.token!.token);
    _appPreferences.setRoleId(data.token!.roleId);
    _appPreferences.setTypeId(data.token!.typeId);
    resetModules();
    return SignUpSuccessState();
  }


  void _checkRegisterDataValidity() {
    isDataValid = _email.isNotEmpty && _password.isNotEmpty && _confirmPassword.isNotEmpty && _userName.isNotEmpty&& _mobileNumber.isNotEmpty;
    emit(SignUpDataValidState());
  }




  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    suffixIcon = isPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeVisibilityPasswordState());
  }


}
