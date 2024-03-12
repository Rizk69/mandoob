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

UserDataResponse _$UserDataFromJson(Map<String, dynamic> json) => UserDataResponse(
      name: json['name'] as String?,
      color: json['color'] as String?,
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => ColorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      balanceTL: json['balanceTL'] as num?,
      balanceUsd: json['balanceUsd'] as num?,
      salse_Lera: json['salse_Lera'] as num?,
      salse_Doler: json['salse_Doler'] as num?,
      commissions_Lera: json['commissions_Lera'] as num?,
      commissions_Doler: json['commissions_Doler'] as num?,
    );

Map<String, dynamic> _$UserDataToJson(UserDataResponse instance) => <String, dynamic>{
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
    };

ColorItem _$ColorItemFromJson(Map<String, dynamic> json) => ColorItem(
      id: json['id'] as int?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$ColorItemToJson(ColorItem instance) => <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
    };
