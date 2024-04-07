import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';
import 'package:mandoob/features/invoices/presentation/fawater/cubit/fawater_cubit.dart';

class TraderInvoiceFawater extends StatelessWidget {
  TraderInvoiceModel? traderInvoiceModel;
  int index;
  TraderInvoiceFawater(
      {super.key, required this.traderInvoiceModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'رقم الفاتورة: ${traderInvoiceModel?.data[index].invoiceNo} ',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'السعر بالليرة : ${traderInvoiceModel?.data[index].priceLera ?? 0} ',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'السعر بالدولار : ${traderInvoiceModel?.data[index].priceDoler ?? 0} ',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'التاجر: ${traderInvoiceModel?.data[index].customerName}',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'التاريخ : ${traderInvoiceModel?.data[index].date}',
                    style: getBoldSegoeStyle(
                      fontSize: 18,
                      color: ColorManager.grey3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.fawaterTagerDetails,
                        arguments: traderInvoiceModel?.data[index].id,
                      );

                      // FawaterViewCubit.get(context)
                      //     .getFawaterTraderInvoiceDetails(
                      //     invoiceId: traderInvoiceModel!.data[index].id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "التفاصيل",
                        style: TextStyle(
                          color: ColorManager.babyBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey, width: 1)),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SupplierInvoiceFawater extends StatelessWidget {
  SupplierInvoiceModel? supplierInvoiceModel;
  int index;
  SupplierInvoiceFawater(
      {super.key, required this.supplierInvoiceModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'السعر بالليرة : ${supplierInvoiceModel?.data.totalLera}',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'السعر بالدولار : ${supplierInvoiceModel?.data.totalDoler}',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'التاريخ  : ${supplierInvoiceModel?.data.date}',
                    style: getBoldSegoeStyle(
                      fontSize: 18,
                      color: ColorManager.grey3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.fawaterMandobDetailsView,

                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "التفاصيل",
                        style: TextStyle(
                          color: ColorManager.babyBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey, width: 1)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
