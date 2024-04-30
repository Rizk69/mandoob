import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/features/debts/presentation/debts/cubit/debts_cubit.dart';
import 'package:mandoob/features/debts/presentation/debts/cubit/debts_state.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InvoiceTrader extends StatelessWidget {
  int id;
  InvoiceTrader({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            imageBackground(context),
            BlocProvider(
              create: (context) =>
                  instance<DebtsCubit>()..getDebtInvoiceTrader(id),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: BlocBuilder<DebtsCubit, DebtsState>(
                    builder: (context, state) {
                      var data =
                          DebtsCubit.get(context).debtInvoiceTraderModel?.data;
                      if(state is GetDebtInvoiceTraderLoadingState){
                        return Center(child: SingleChildScrollView(),);
                      }else if(state is GetDebtInvoiceTraderErrorState){
                        Center(child: Text(state.message),);
                      }else if(state is GetDebtInvoiceTraderLoadedState){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: AppSize.s6.h,
                            ),
                            Center(
                              child: Text(
                                "${LocaleKeys.invoiceTrader.tr()} ${data?.traderName}",
                                style: getBoldSegoeStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.s1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/whatsApp.svg'),
                                Text(
                                  data!.traderPhone,
                                  style: getBoldSegoeStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.s3.h),
                            rowCard(
                                title: LocaleKeys.date.tr(),
                                colorTitle: ColorManager.black,
                                colordes: ColorManager.black,
                                des: data.date,
                                context: context),
                            SizedBox(height: AppSize.s2.h),
                            rowCard(
                                title: LocaleKeys.invoiceNumber.tr(),
                                colorTitle: ColorManager.black,
                                colordes: ColorManager.black,
                                des: data.invoiceNo,
                                context: context),
                            SizedBox(height: AppSize.s2.h),
                            rowCard(
                                title: LocaleKeys.DebtAmountLira.tr(),
                                colorTitle: ColorManager.black,
                                colordes: ColorManager.black,
                                des: data.debtPriceLera.toString(),
                                context: context),
                            SizedBox(height: AppSize.s2.h),
                            rowCard(
                                title: LocaleKeys.DebtAmountDollar.tr(),
                                colorTitle: ColorManager.black,
                                colordes: ColorManager.black,
                                des: data.debtPriceDoler.toString(),
                                context: context),
                            SizedBox(height: AppSize.s2.h),
                            rowCard(
                                title: LocaleKeys.AmountPaidLira.tr(),
                                colorTitle: ColorManager.black,
                                colordes: ColorManager.black,
                                des: data.payPriceLera.toString(),
                                context: context),
                            SizedBox(height: AppSize.s2.h),
                            rowCard(
                                title: LocaleKeys.AmountPaidUSD.tr(),
                                colorTitle: ColorManager.black,
                                colordes: ColorManager.black,
                                des: data.payPriceDoler.toString(),
                                context: context),
                            SizedBox(height: AppSize.s2.h),
                            rowCard(
                                title: LocaleKeys.RemainingAmountLira.tr(),
                                colorTitle: ColorManager.black,
                                colordes: ColorManager.black,
                                des: data.restPriceLera.toString(),
                                context: context),
                            SizedBox(height: AppSize.s2.h),
                            rowCard(
                                title: LocaleKeys.RemainingAmountDollar.tr(),
                                colorTitle: ColorManager.black,
                                colordes: ColorManager.black,
                                des: data.restPriceDoler.toString(),
                                context: context),
                            SizedBox(height: AppSize.s12.h),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: CustomButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      Routes.homeRoute,
                                    );
                                  },
                                  buttonText: LocaleKeys.Print.tr(),
                                ))
                          ],
                        );
                      }
                        return  Text(LocaleKeys.ERROR.tr());


                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowCard(
      {required String title,
      required Color colorTitle,
      required BuildContext context,
      required Color colordes,
      required String des}) {
    return Row(
      children: [
        Text("$title :  ",
            style: getBoldSegoeStyle(
                color: Theme.of(context).primaryColor, fontSize: 22)

            //

            ),
        SizedBox(
          width: 8,
        ),
        Text(des,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w500))
      ],
    );
  }
}
