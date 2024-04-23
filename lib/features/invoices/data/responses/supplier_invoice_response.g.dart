// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierInvoiceResponse _$SupplierInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    SupplierInvoiceResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataSupplierInvoiceResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SupplierInvoiceResponseToJson(
        SupplierInvoiceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataSupplierInvoiceResponse _$DataSupplierInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    DataSupplierInvoiceResponse(
      totalDoler: json['total_Doler'] as String?,
      totalLera: json['total_Lera'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$DataSupplierInvoiceResponseToJson(
        DataSupplierInvoiceResponse instance) =>
    <String, dynamic>{
      'total_Doler': instance.totalDoler,
      'total_Lera': instance.totalLera,
      'date': instance.date,
    };
