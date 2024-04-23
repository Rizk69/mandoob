// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDataResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user': instance.user,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      name: json['name'] as String?,
      color: json['color'] as String?,
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => ColorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      balanceTL: json['balanceTL'] as String?,
      balanceUsd: json['balanceUsd'] as String?,
      salse_Lera: json['salse_Lera'] as String?,
      salse_Doler: json['salse_Doler'] as String?,
      commissions_Lera: json['commissions_Lera'] as String?,
      commissions_Doler: json['commissions_Doler'] as String?,
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'colors': instance.colors,
      'email': instance.email,
      'phone': instance.phone,
      'balanceTL': instance.balanceTL,
      'balanceUsd': instance.balanceUsd,
      'salse_Lera': instance.salse_Lera,
      'salse_Doler': instance.salse_Doler,
      'commissions_Lera': instance.commissions_Lera,
      'commissions_Doler': instance.commissions_Doler,
      'companyName': instance.companyName,
    };

ColorItem _$ColorItemFromJson(Map<String, dynamic> json) => ColorItem(
      id: json['id'] as int?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$ColorItemToJson(ColorItem instance) => <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
    };
