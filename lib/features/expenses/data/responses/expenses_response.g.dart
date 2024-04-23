// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesResponse _$ExpensesResponseFromJson(Map<String, dynamic> json) =>
    ExpensesResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      expenses: (json['expenses'] as List<dynamic>?)
          ?.map((e) => ExpenseDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpensesResponseToJson(ExpensesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'expenses': instance.expenses,
    };

ExpenseDataResponse _$ExpenseDataResponseFromJson(Map<String, dynamic> json) =>
    ExpenseDataResponse(
      id: json['id'] as int?,
      reasonExpenseAr: json['reason_expense_ar'] as String?,
      reasonExpenseEn: json['reason_expense_en'] as String?,
      price: json['price'] as String?,
      count: json['count'] as String?,
      date: json['date'] as String?,
      statusAr: json['status_ar'] as String?,
      statusEn: json['status_en'] as String?,
    );

Map<String, dynamic> _$ExpenseDataResponseToJson(
        ExpenseDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason_expense_ar': instance.reasonExpenseAr,
      'reason_expense_en': instance.reasonExpenseEn,
      'price': instance.price,
      'count': instance.count,
      'date': instance.date,
      'status_ar': instance.statusAr,
      'status_en': instance.statusEn,
    };
