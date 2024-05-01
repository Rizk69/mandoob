import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/custody/presentation/el_salah/widget/cutom_alert.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';
import 'package:mandoob/features/purchase/presentation/cubit/purchase_cubit.dart';
import 'package:mandoob/features/trader/presentation/cubit/get_trade/trade_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/resources/values_manager.dart';
import '../../../core/widget/backgrond_image.dart';
import '../../../core/widget/custom_text_form_info.dart';
import '../../../core/widget/header_screen.dart';
import '../../../generated/locale_keys.g.dart';
import '../../home/presentation/widget/drawer_home.dart';

class SalePurchase extends StatelessWidget {
  PurchaseProductModel productModel;
  SalePurchase({super.key, required this.productModel});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> currencyOptions = [
    LocaleKeys.usd.tr(),
    LocaleKeys.lera.tr()
  ];
  String? selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        drawer: buildDrawer(context),
        body: Stack(
          children: [
            imageBackground(context),
            MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => instance<TradeCubit>()..getTrade()),
                BlocProvider(create: (context) => instance<PurchaseCubit>()),
              ],
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: BlocConsumer<PurchaseCubit, PurchaseState>(
                    listener: (context, state) {
                      if (state is SalePurchaseErrorState) {
                        final snackBar = defaultSnakeBar(
                          title: LocaleKeys.ERROR.tr(),
                          message: state.error,
                          state: ContentType.failure,
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }

                      if (state is SalePurchaseSuccessState) {
                        final snackBar = defaultSnakeBar(
                          title: LocaleKeys.SUCCESS.tr(),
                          message: LocaleKeys.SUCCESS.tr(),
                          state: ContentType.success,
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Container();
                          },
                        );
                        // Navigator.pushReplacementNamed(
                        //   context, Routes.purchase,
                        // );
                      }
                    },
                    builder: (context, state) {
                      var purchaseCubit = PurchaseCubit.get(context);

                      return Column(
                        children: [
                          SizedBox(
                            height: AppSize.s6.h,
                          ),
                          HeaderScreen(
                              functionDrawer: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              title: LocaleKeys.salePurchases.tr(),
                              functionIcon: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(height: AppSize.s5.h),
                          customTextFormFiledInfo(
                            text: LocaleKeys.product.tr(),
                            enable: false,
                            hint: productModel.productName,
                            context: context,
                            onChanged: (String) {},
                          ),
                          SizedBox(height: AppSize.s5.h),
                          Row(
                            children: [
                              Expanded(
                                child: customTextFormFiledInfo(
                                  inputType: TextInputType.number,
                                  text: LocaleKeys.quantity.tr(),
                                  enable: true,
                                  onChanged: (String count) {
                                    purchaseCubit.setCount(count);
                                  },
                                  hint: '',
                                  context: context,
                                ),
                              ),
                              SizedBox(width: AppSize.s10.w),
                              Expanded(
                                child: customTextFormFiledInfo(
                                  text: LocaleKeys.Unit.tr(),
                                  enable: false,
                                  onChanged: (String unit) {},
                                  hint: productModel.unit,
                                  context: context,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.s5.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  LocaleKeys.Trader.tr(),
                                  style: TextStyle(
                                    fontSize: AppSize.s20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: BlocConsumer<TradeCubit, TradeState>(
                                    listener: (context, state) {
                                      if (state is ActiveTradeErrorState) {
                                        final snackBar = defaultSnakeBar(
                                          title: LocaleKeys.ERROR.tr(),
                                          message: LocaleKeys.ERROR.tr(),
                                          state: ContentType.failure,
                                        );
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);
                                      }

                                      if (state is ActiveTradeLoadedState) {
                                        final snackBar = defaultSnakeBar(
                                          title: LocaleKeys.SUCCESS.tr(),
                                          message: LocaleKeys.SUCCESS.tr(),
                                          state: ContentType.success,
                                        );
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);

                                        TradeCubit.get(context).getTrade();
                                      }
                                    },
                                    builder: (context, state) {
                                      List<DropdownMenuItem<String>>
                                          tradeItems = [
                                        DropdownMenuItem(
                                          value: '-1',
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                TradeCubit.get(context)
                                                    .selectedTraderName,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ];

                                      String? currentDropdownValue;

                                      if (state is GetTradeLoadedState &&
                                          state.model?.trades != null) {
                                        tradeItems.addAll(
                                          state.model!.trades!.map((trade) {
                                            return DropdownMenuItem(
                                              value: trade.id.toString(),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: Image.network(
                                                      trade.img,
                                                      height: 50,
                                                      width: 50,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    trade.customerName,
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        );
                                        currentDropdownValue =
                                            currentDropdownValue ??
                                                tradeItems.first.value;
                                      }

                                      return DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        value: currentDropdownValue,
                                        items: tradeItems,
                                        onChanged: (value) {
                                          if (value == '-1') {
                                          } else {
                                            currentDropdownValue = value;
                                            purchaseCubit.setCustomerId(
                                                int.parse(value!));
                                          }
                                        },
                                        hint: Text(LocaleKeys.addNewTrade.tr()),
                                      );
                                    },
                                  )),
                            ],
                          ),
                          SizedBox(height: AppSize.s5.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  LocaleKeys.Currency.tr(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DropdownButtonFormField<String>(
                                  value: selectedCurrency,
                                  items: currencyOptions.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    selectedCurrency = value;
                                    int id = _getCurrencyId(value);
                                    purchaseCubit.setCurrencyId(id);
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.s5.h),
                          customTextFormFiledInfo(
                            inputType: TextInputType.number,
                            text: LocaleKeys.PurchasingPrice.tr(),
                            enable: true,
                            onChanged: (payUsd) {
                              purchaseCubit.setPrice(payUsd);
                            },
                            context: context,
                          ),
                          SizedBox(height: AppSize.s20.h),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: CustomButton(
                                onPressed: () {
                                  // if (purchaseCubit.price
                                  //         .toString()
                                  //         .isNotEmpty &&
                                  //     purchaseCubit.currencyId
                                  //         .toString()
                                  //         .isNotEmpty &&
                                  //     purchaseCubit.count.isNotEmpty &&
                                  //     int.parse(purchaseCubit.count) <
                                  //         productModel.count) {
                                  purchaseCubit.salePurchase(
                                      purcheseId: productModel.id.toString());
                                  // } else {
                                  //   final snackBar = defaultSnakeBar(
                                  //     title: LocaleKeys.ERROR.tr(),
                                  //     message: LocaleKeys.CompleteData.tr(),
                                  //     state: ContentType.failure,
                                  //   );
                                  //   ScaffoldMessenger.of(context)
                                  //     ..hideCurrentSnackBar()
                                  //     ..showSnackBar(snackBar);
                                  // }
                                },
                                buttonText: LocaleKeys.add.tr(),
                              ))
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int _getCurrencyId(String? currencyName) {
    if (currencyName == LocaleKeys.usd.tr()) {
      return 1;
    } else if (currencyName == LocaleKeys.lera.tr()) {
      return 2;
    } else {
      return -1;
    }
  }
}
