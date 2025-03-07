import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TraderInvoice extends StatelessWidget {
  final List<TraderInvoiceDataModel>? traderInvoiceModel;
  final int index;
  const TraderInvoice(
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
                '${LocaleKeys.invoiceNumber.tr()} : ${traderInvoiceModel![index].invoiceNo} ',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: AppSize.s1.h),
              Text(
                '${LocaleKeys.priceInLera.tr()} : ${traderInvoiceModel![index].priceLera ?? 0} ',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: AppSize.s1.h),
              Text(
                '${LocaleKeys.PriceInUsd.tr()} : ${traderInvoiceModel![index].priceDoler ?? 0} ',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: AppSize.s1.h),
              Text(
                '${LocaleKeys.Trader.tr()} : ${traderInvoiceModel![index].customerName}',
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
                    '${LocaleKeys.date.tr()} : ${traderInvoiceModel![index].date}',
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
                        arguments: traderInvoiceModel![index].id,
                      );

                      // FawaterViewCubit.get(context)
                      //     .getFawaterTraderInvoiceDetails(
                      //     invoiceId: traderInvoiceModel!.data[index].id);
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

