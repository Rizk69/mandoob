import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandoob/data/network/requests.dart';

part 'freezed_data_class.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String email, String password) = _LoginObject;
}

@freezed
class EditProfileObject with _$EditProfileObject {
  factory EditProfileObject(
    String arabicUserName,
    String mobileNumber,
    String profilePicture,
    String password,
    String confirmPassword,
    String newPassword,
    String email,
  ) = _EditProfileObject;
}

@freezed
class PictureObject with _$PictureObject {
  factory PictureObject(
    String base64,
    String name,
    int size,
    String type,
    int lastModified,
    String lastModifiedDate,
  ) = _PictureObject;
}

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(
    String email,
    String password,
    String confirmPassword,
    String mobileNumber,
    String userName,
    String guardianName,
    String guardianNumber,
    int eduYearID,
    String stage,
    int stageId,
  ) = _RegisterObject;
}

@freezed
class ForgetPasswordObject with _$ForgetPasswordObject {
  factory ForgetPasswordObject(
    String email,
    String code,
    String newPassword,
    String confirmedNewPassword,
  ) = _ForgetPasswordObject;
}

@freezed
class ProfileObject with _$ProfileObject {
  factory ProfileObject(
    String arabicUserName,
    String mobileNumber,
    String password,
    String confirmPassword,
    String newPassword,
    File profilePicture,
  ) = _ProfileObject;
}
