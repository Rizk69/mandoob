// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String?,
      accountPassword: json['password'] as String?,
      deviceToken: json['deviceToken'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.accountPassword,
      'deviceToken': instance.deviceToken,
    };

ColorProfile _$ColorProfileFromJson(Map<String, dynamic> json) => ColorProfile(
      json['color_id'] as String,
    );

Map<String, dynamic> _$ColorProfileToJson(ColorProfile instance) =>
    <String, dynamic>{
      'color_id': instance.colorId,
    };
