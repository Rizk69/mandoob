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
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: AppSize.s6.h,
                          ),
                          Center(
                            child: Text(
                              "فاتورة التاجر ${data?.traderName}",
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
                              title: 'التاريخ',
                              colorTitle: ColorManager.black,
                              colordes: ColorManager.black,
                              des: data.date,
                              context: context),
                          SizedBox(height: AppSize.s2.h),
                          rowCard(
                              title: 'رقم الفاتورة',
                              colorTitle: ColorManager.black,
                              colordes: ColorManager.black,
                              des: data.invoiceNo,
                              context: context),
                          SizedBox(height: AppSize.s2.h),
                          rowCard(
                              title: 'مبلغ الدين بالليرة',
                              colorTitle: ColorManager.black,
                              colordes: ColorManager.black,
                              des: data.debtPriceLera.toString(),
                              context: context),
                          SizedBox(height: AppSize.s2.h),
                          rowCard(
                              title: 'مبلغ الدين بالدولار',
                              colorTitle: ColorManager.black,
                              colordes: ColorManager.black,
                              des: data.debtPriceDoler.toString(),
                              context: context),
                          SizedBox(height: AppSize.s2.h),
                          rowCard(
                              title: 'المبلغ المدفوع بالليرة',
                              colorTitle: ColorManager.black,
                              colordes: ColorManager.black,
                              des: data.payPriceLera.toString(),
                              context: context),
                          SizedBox(height: AppSize.s2.h),
                          rowCard(
                              title: 'المبلغ المدفوع بالدولار',
                              colorTitle: ColorManager.black,
                              colordes: ColorManager.black,
                              des: data.payPriceDoler.toString(),
                              context: context),
                          SizedBox(height: AppSize.s2.h),
                          rowCard(
                              title: 'المبلغ المتبقي بالليرة',
                              colorTitle: ColorManager.black,
                              colordes: ColorManager.black,
                              des: data.restPriceLera.toString(),
                              context: context),
                          SizedBox(height: AppSize.s2.h),
                          rowCard(
                              title: 'المبلغ المتبقي بالدولار',
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
                                    Routes.homeViewRoute,
                                  );
                                },
                                buttonText: 'طباعة',
                              ))
                        ],
                      );
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
