// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_trader_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DebtTraderResponse _$DebtTraderResponseFromJson(Map<String, dynamic> json) =>
    DebtTraderResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      debts: (json['traders'] as List<dynamic>?)
          ?.map((e) => DebtDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DebtTraderResponseToJson(DebtTraderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'traders': instance.debts,
    };

DebtDetailResponse _$DebtDetailResponseFromJson(Map<String, dynamic> json) =>
    DebtDetailResponse(
      id: json['id'] as int?,
      traderName: json['trader_name'] as String?,
      debtDoler: json['debt_Doler'] as String?,
      debtLera: json['debt_Lera'] as String?,
      lastDate: json['last_date'] as String?,
      dueDate: json['due_date'] as String?,
    );

Map<String, dynamic> _$DebtDetailResponseToJson(DebtDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trader_name': instance.traderName,
      'debt_Doler': instance.debtDoler,
      'debt_Lera': instance.debtLera,
      'last_date': instance.lastDate,
      'due_date': instance.dueDate,
    };
