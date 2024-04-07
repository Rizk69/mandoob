// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason_expenses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReasonExpensesResponse _$ReasonExpensesResponseFromJson(
        Map<String, dynamic> json) =>
    ReasonExpensesResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      reasonExpense: (json['reason_expense'] as List<dynamic>?)
          ?.map(
              (e) => ReasonExpenseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReasonExpensesResponseToJson(
        ReasonExpensesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'reason_expense': instance.reasonExpense,
    };

ReasonExpenseResponse _$ReasonExpenseResponseFromJson(
        Map<String, dynamic> json) =>
    ReasonExpenseResponse(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );

Map<String, dynamic> _$ReasonExpenseResponseToJson(
        ReasonExpenseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
    };
