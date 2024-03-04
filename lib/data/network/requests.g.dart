// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String?,
      accountPassword: json['password'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.accountPassword,
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      id: json['Id'] as int?,
      userTypeId: json['userTypeId'] as int?,
      arName: json['ar_name'] as String?,
      mobile: json['mobile'] as String?,
      accountEmail: json['account_email'] as String?,
      accountPassword: json['account_password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'userTypeId': instance.userTypeId,
      'ar_name': instance.arName,
      'mobile': instance.mobile,
      'account_email': instance.accountEmail,
      'account_password': instance.accountPassword,
      'confirmPassword': instance.confirmPassword,
    };
