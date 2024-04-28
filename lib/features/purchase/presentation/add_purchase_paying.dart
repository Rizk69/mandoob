import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/purchase/presentation/cubit/purchase_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/resources/values_manager.dart';
import '../../../core/widget/backgrond_image.dart';
import '../../../core/widget/custom_text_form_info.dart';
import '../../../core/widget/header_screen.dart';
import '../../../generated/locale_keys.g.dart';
import '../../home/presentation/widget/drawer_home.dart';

class AddPurchase extends StatelessWidget {
  AddPurchase({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> currencyOptions = ['دولار', 'ليرة'];
  String? selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<PurchaseCubit>(),
      child: SafeArea(
        top: false,
        child: Scaffold(
          key: scaffoldKey,
          drawer: buildDrawer(context),
          body: Stack(
            children: [
              imageBackground(context),
              BlocConsumer<PurchaseCubit, PurchaseState>(
                listener: (context, state) {
                  if (state is AddPurchaseErrorState) {
                    final snackBar = defaultSnakeBar(
                      title: LocaleKeys.ERROR.tr(),
                      message:state.error,
                      state: ContentType.failure,
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }

                  if (state is AddPurchaseSuccessState) {
                    final snackBar = defaultSnakeBar(
                      title: LocaleKeys.SUCCESS.tr(),
                      message: LocaleKeys.SUCCESS.tr(),
                      state: ContentType.success,
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    Navigator.pushReplacementNamed(
                        context, Routes.purchase,
                    );
                  }
                },
                builder: (context, state) {
                  var purchaseCubit = PurchaseCubit.get(context);

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          SizedBox(
                            height: AppSize.s6.h,
                          ),
                          HeaderScreen(
                              functionDrawer: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              title: 'إضافة مشتريات ',
                              functionIcon: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(height: AppSize.s5.h),
                          customTextFormFiledInfo(
                            text: 'المادة',
                            enable: true,
                            onChanged: (String productName){
                              purchaseCubit.setProductName(productName);
                            },

                            hint: '',
                            context: context,
                          ),
                          SizedBox(height: AppSize.s5.h),
                          Row(
                            children: [
                              Expanded(
                                child: customTextFormFiledInfo(
inputType: TextInputType.number,
                                  text: 'الكمية',
                                  enable: true,
                                  onChanged: (String count){
                                    purchaseCubit.setCount(count);
                                  },
                                  hint: '',
                                  context: context,
                                ),
                              ),
                              SizedBox(width: AppSize.s10.w),
                              Expanded(
                                child: customTextFormFiledInfo(
                                  text: 'الوحده',
                                  enable: true,
                                  onChanged: (String unit){
                                    purchaseCubit.setUnit(unit);
                                  },
                                  hint: '',
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
                                  'العملة',
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
                            text: 'سعر الشراء',
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
                                  if (purchaseCubit.price.toString().isNotEmpty &&
                                      purchaseCubit.currencyId
                                          .toString()
                                          .isNotEmpty &&
                                      purchaseCubit.productName.isNotEmpty&&
                                      purchaseCubit.count.isNotEmpty&&
                                      purchaseCubit.unit.isNotEmpty
                                  ) {

                                    purchaseCubit.addPurchase();
                                  } else {
                                    final snackBar = defaultSnakeBar(
                                      title: LocaleKeys.ERROR.tr(),
                                      message: 'برجاء اكمال البيانات المطلوبه',
                                      state: ContentType.failure,
                                    );
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                  }
                                },
                                buttonText: LocaleKeys.add.tr(),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getCurrencyId(String? currencyName) {
    switch (currencyName) {
      case 'دولار':
        return 1;
      case 'ليرة':
        return 2;
      default:
        return -1;
    }
  }
}
