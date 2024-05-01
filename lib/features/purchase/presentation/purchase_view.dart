import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/widget/empty_screen.dart';
import 'package:mandoob/features/purchase/presentation/cubit/purchase_cubit.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/resources/values_manager.dart';
import '../../../core/widget/backgrond_image.dart';
import '../../../core/widget/header_screen.dart';
import '../../home/presentation/widget/drawer_home.dart';

class Purchase extends StatelessWidget {
  Purchase({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<PurchaseCubit>()..getPurchase(),
      child: SafeArea(
        top: false,
        child: Scaffold(
          key: scaffoldKey,
          drawer: buildDrawer(context),
          body: Stack(
            children: [
              imageBackground(context),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: AppSize.s6.h,
                      ),
                      HeaderScreen(
                          functionDrawer: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          title: LocaleKeys.Purchases.tr(),
                          functionIcon: () {
                            Navigator.pop(context);
                          }),
                      SizedBox(height: AppSize.s5.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.addPayingDebts);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.add,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              LocaleKeys.addPurchases.tr(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<PurchaseCubit, PurchaseState>(
                        builder: (context, state) {
                          if (state is GetPurchaseLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (state is GetPurchaseErrorState) {
                            return Center(
                              child: Text(state.error),
                            );
                          } else if (state is GetPurchaseSuccessState) {
                            var purchase = PurchaseCubit.get(context)
                                .purchaseModel
                                ?.purchaseProductModel;
                            return purchase!.isNotEmpty
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: purchase.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 23),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: AppPadding.p20,
                                              vertical: AppPadding.p18),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        ColorManager.greyDark3,
                                                    blurRadius: 4,
                                                    spreadRadius: 1,
                                                    blurStyle: BlurStyle.normal,
                                                    offset: const Offset(1, 3))
                                              ]),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        LocaleKeys.ProductName
                                                            .tr(),
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        purchase[index]
                                                            .productName,
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      Navigator.pushNamed(context, Routes.salePurchase);


                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/send.png',
                                                            height: 18),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          LocaleKeys.sell.tr(),
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColorLight),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    LocaleKeys.quantity.tr(),
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "${purchase[index].count} ${purchase[index].unit}",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${LocaleKeys.TradePrice.tr()} : ",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "${purchase[index].purchasePrice}  ${purchase[index].currencyAr}",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : EmptyScreen(
                                    title: LocaleKeys.PurchasingEmpty.tr(),
                                    textbutton: '',
                                    viewButtom: false,
                                  );
                          }
                          return const SizedBox();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
