// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_delegate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DebtDelegateResponse _$DebtDelegateResponseFromJson(
        Map<String, dynamic> json) =>
    DebtDelegateResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      debts: (json['debt_delivery'] as List<dynamic>?)
          ?.map((e) =>
              DebtDelegateDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DebtDelegateResponseToJson(
        DebtDelegateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'debt_delivery': instance.debts,
    };

DebtDelegateDataResponse _$DebtDelegateDataResponseFromJson(
        Map<String, dynamic> json) =>
    DebtDelegateDataResponse(
      id: json['id'] as int?,
      debtPriceDoler: json['debt_price_Doler'] as num?,
      debtPriceLera: json['debt_price_Lera'] as num?,
      date: json['date'] as String?,
      reasonExpensesNameAr: json['reason_expenses_name_ar'] as String?,
      reasonExpensesNameEn: json['reason_expenses_name_en'] as String?,
    );

Map<String, dynamic> _$DebtDelegateDataResponseToJson(
        DebtDelegateDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'debt_price_Doler': instance.debtPriceDoler,
      'debt_price_Lera': instance.debtPriceLera,
      'date': instance.date,
      'reason_expenses_name_ar': instance.reasonExpensesNameAr,
      'reason_expenses_name_en': instance.reasonExpensesNameEn,
    };
