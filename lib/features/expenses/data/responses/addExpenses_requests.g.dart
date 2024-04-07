// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addExpenses_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddExpensesRequests _$AddExpensesRequestsFromJson(Map<String, dynamic> json) =>
    AddExpensesRequests(
      reasonExpenseId: json['reason_expense_id'] as String?,
      price: json['price'] as String?,
      currencyId: json['currency_id'] as String?,
      image: AddExpensesRequests._fileFromJson(json['image'] as String?),
      count: json['count'] as String?,
    );

Map<String, dynamic> _$AddExpensesRequestsToJson(
        AddExpensesRequests instance) =>
    <String, dynamic>{
      'reason_expense_id': instance.reasonExpenseId,
      'price': instance.price,
      'currency_id': instance.currencyId,
      'image': AddExpensesRequests._fileToJson(instance.image),
      'count': instance.count,
    };
