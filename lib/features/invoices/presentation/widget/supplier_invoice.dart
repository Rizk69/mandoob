import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SupplierInvoice extends StatelessWidget {
  final SupplierInvoiceModel? supplierInvoiceModel;
  const SupplierInvoice(
      {super.key, required this.supplierInvoiceModel});

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
                '${LocaleKeys.priceInLera.tr()} : ${supplierInvoiceModel?.data?.totalLera}',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: AppSize.s1.h),
              Text(
                '${LocaleKeys.PriceInUsd.tr()} : ${supplierInvoiceModel?.data?.totalDoler}',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: AppSize.s1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${LocaleKeys.date.tr()} : ${supplierInvoiceModel?.data?.date}',
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
                        LocaleKeys.Details.tr(),
                        style: TextStyle(
                          color: ColorFunctions.loadButtonColor(),
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
