// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      returnValue: json['returnValue'] as int?,
      returnString: json['returnString'] as String?,
      userId: json['user_id'] as int?,
      userArName: json['user_ar_name'] as String?,
      userPicture: json['user_picture'] as String?,
      userTypeId: json['user_type_id'] as int?,
      userTypeArName: json['user_type_ar_name'] as String?,
      token: json['token'] == null
          ? null
          : TokenResponse.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnString': instance.returnString,
      'user_id': instance.userId,
      'user_ar_name': instance.userArName,
      'user_picture': instance.userPicture,
      'user_type_id': instance.userTypeId,
      'user_type_ar_name': instance.userTypeArName,
      'token': instance.token,
    };

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      funcs: json['funcs'] as int?,
      eduCompList: (json['EduCompList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      token: json['token'] as String?,
      returnValue: json['returnValue'] as int?,
      roleId: json['role_Id'] as int?,
      typeId: json['type_Id'] as int?,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'funcs': instance.funcs,
      'EduCompList': instance.eduCompList,
      'token': instance.token,
      'returnValue': instance.returnValue,
      'role_Id': instance.roleId,
      'type_Id': instance.typeId,
    };
