import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/custom_text_form_info.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/custody/data/network/eahduh_requests.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_salah/el_salah_cubit.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class PayPartialInvoice extends StatelessWidget {
  final num invoiceNumber;
  final String priceDoler;
  final String priceLera;

  PayPartialInvoice(
      {required this.invoiceNumber, required this.priceDoler, required this.priceLera});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<ElSalahCubit>(),
      child: BlocConsumer<ElSalahCubit, ElSalahState>(
        listener: (context, state) {

          if (state is PayPartialDeptLoadedState) {
            final snackBar = defaultSnakeBar(
              title: LocaleKeys.SUCCESS.tr(),
              message: LocaleKeys.SUCCESS.tr(),
              state: ContentType.success,
            );
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);

            Navigator.pushReplacementNamed(context, Routes.invoiceDetails,
                arguments: invoiceNumber);
          }

          if (state is PayPartialDeptErrorState) {
            final snackBar = defaultSnakeBar(
              title: LocaleKeys.ERROR.tr(),
              message: state.message,
              state: ContentType.failure,
            );
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }

          },
        builder: (context, state) {
          return SafeArea(
              top: false,
              child: Scaffold(
                body: Stack(
                  children: [
                    imageBackground(context),
                    SingleChildScrollView(
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
                              onChanged: null,
                              hint: priceLera.toString(),
                              context: context,
                            ),
                            SizedBox(height: AppSize.s5.h),
                            customTextFormFiledInfo(
                              text: LocaleKeys.totalUSD.tr(),
                              enable: false,
                              onChanged: null,
                              hint: priceDoler.toString(),
                              context: context,
                            ),
                            SizedBox(height: AppSize.s5.h),
                            customTextFormFiledInfo(
                              text: LocaleKeys.payedTL.tr(),
                              enable: priceLera == 0 ? false : true,
                              onChanged: (payTl) {
                                ElSalahCubit.get(context).setPayLera(num.parse(payTl));
                              },
                              context: context,
                            ),

                            SizedBox(height: AppSize.s5.h),
                            customTextFormFiledInfo(
                              text: LocaleKeys.payedUSD.tr(),
                              enable: priceDoler == 0 ? false : true,
                              onChanged: (payUsd) {
                                ElSalahCubit.get(context).setPayDoler(num.parse(payUsd));
                              },
                              context: context,
                            ),

                            SizedBox(height: AppSize.s12.h),
                            SizedBox(
                                width:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
                                child: CustomButton(
                                  onPressed: () {
                                    ElSalahCubit.get(context).payPartialDept(partialDeptRequest: PayPartialDeptRequest(
                                      invoice_id: invoiceNumber ,
                                      pay_Doler: ElSalahCubit.get(context).pay_Doler??0,
                                      pay_Lera: ElSalahCubit.get(context).pay_Lera??0,
                                    ));

                                  },
                                  buttonText: LocaleKeys.payDept.tr(),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
