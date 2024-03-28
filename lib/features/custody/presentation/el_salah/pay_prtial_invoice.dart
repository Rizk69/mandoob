import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/custom_text_form_info.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class PayPartialInvoice extends StatelessWidget {
  num invoiceNumber;
  num priceDoler;
  num priceLera;

  PayPartialInvoice({required this.invoiceNumber,required this.priceDoler,required this.priceLera});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Container(
          color:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
          child: Stack(
            children: [
              imageBackground(context),
              Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppSize.s6.h,
                        ),
                        HeaderScreen(
                            title: LocaleKeys.payDept.tr(),
                            functionIcon: () {
                              Navigator.pop(context);
                            }),
                        SizedBox(height: AppSize.s5.h),
                        customTextFormFiledInfo(
                          text: LocaleKeys.totalLera.tr(),
                          enable: false,
                          onChanged:null,
                          hint: priceLera.toString(),
                          context: context,
                        ),
                        SizedBox(height: AppSize.s5.h),
                        customTextFormFiledInfo(
                          text: LocaleKeys.totalUSD.tr(),
                          enable: false,
                          onChanged:null,
                          hint: priceDoler.toString(),
                          context: context,
                        ),
                        SizedBox(height: AppSize.s5.h),
                        customTextFormFiledInfo(
                          text: LocaleKeys.payedTL.tr(),
                          enable: priceLera==0?false:true,
                          onChanged: (payTl) {
                          },
                          context: context,
                        ),

                        SizedBox(height: AppSize.s5.h),
                        customTextFormFiledInfo(
                          text: LocaleKeys.payedUSD.tr(),
                          enable: priceDoler==0?false:true,
                          onChanged: (payUsd) {
                          },
                          context: context,
                        ),

                        SizedBox(height: AppSize.s12.h),
                        SizedBox(
                            width:
                            MediaQuery.of(context).size.width * 0.9,
                            child: CustomButton(
                              onPressed: () {
                              },
                              buttonText: LocaleKeys.payDept.tr(),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
