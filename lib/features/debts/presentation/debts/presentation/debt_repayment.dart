import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';
import 'package:mandoob/features/debts/presentation/debts/cubit/debts_cubit.dart';
import 'package:mandoob/features/debts/presentation/debts/cubit/debts_state.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/backgrond_image.dart';
import '../../../../../core/widget/custom_text_form_info.dart';
import '../../../../../core/widget/header_screen.dart';
import '../../../../home/presentation/widget/drawer_home.dart';

class DebtRepayment extends StatelessWidget {
  DebtRepayment({Key? key, required this.debtDetail}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final DebtDetail debtDetail;

  final _dateController = TextEditingController();
  final List<String> currencyOptions = ['دولار', 'ليرة'];
  String? selectedCurrency;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocProvider(
        create: (context) => instance<DebtsCubit>(),
        child: Scaffold(
          key: scaffoldKey,
          drawer: buildDrawer(context),
          body: Stack(
            children: [
              imageBackground(context),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: BlocConsumer<DebtsCubit, DebtsState>(
                    listener: (context, state) {
                      if (state is PayDebtTraderErrorState) {
                        final snackBar = defaultSnakeBar(
                          title: LocaleKeys.ERROR.tr(),
                          message: LocaleKeys.ERROR.tr(),
                          state: ContentType.failure,
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }

                      if (state is PayDebtTraderLoadedState) {
                        final snackBar = defaultSnakeBar(
                          title: LocaleKeys.SUCCESS.tr(),
                          message: LocaleKeys.SUCCESS.tr(),
                          state: ContentType.success,
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                        Navigator.pushNamed(
                            context, Routes.sucssufflyDebtsTrader,
                            arguments: SuccessMessageArguments(
                                'تم الصرف بنجاح',
                                'الفاتورة',
                                DebtsCubit.get(context)
                                    .payDebtTraderModel!
                                    .invoiceId));
                      }
                    },
                    builder: (context, state) {
                      var debtsCubit = DebtsCubit.get(context);
                      return Column(
                        children: [
                          SizedBox(
                            height: AppSize.s6.h,
                          ),
                          HeaderScreen(
                              functionDrawer: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              title: 'تسديد الديون',
                              functionIcon: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(height: AppSize.s5.h),
                          customTextFormFiledInfo(
                            text: 'مبلغ الدين ليرة',
                            enable: false,
                            onChanged: null,
                            hint: "${debtDetail.debtLera}",
                            context: context,
                          ),
                          SizedBox(height: AppSize.s5.h),
                          customTextFormFiledInfo(
                            text: 'مبلغ الدين دولار',
                            enable: false,
                            onChanged: null,
                            hint: "${debtDetail.debtDoler}",
                            context: context,
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
                                    debtsCubit.setCurrencyId(id);
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.s5.h),
                          customTextFormFiledInfo(
                            text: 'المبلغ المدفوع',
                            enable: true,
                            onChanged: (pay) {
                              debtsCubit.setPrice(pay);
                            },
                            context: context,
                          ),
                          SizedBox(height: AppSize.s5.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'تاريخ الدفع القادم',
                                  style: TextStyle(
                                    fontSize: AppSize.s20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                  controller: _dateController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).primaryColorDark,
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () async {
                                        final DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2025),
                                        );
                                        if (pickedDate != null) {
                                          _dateController.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          debtsCubit
                                              .setDueDate(_dateController.text);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.s12.h),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: CustomButton(
                                onPressed: () {
                                  if (debtsCubit.price.toString().isNotEmpty &&
                                      debtsCubit.currencyId.toString().isNotEmpty  &&
                                      debtsCubit.dueDate!.isNotEmpty) {
                                    debtsCubit.setTraderId(debtDetail.id);

                                    debtsCubit.payDebtTrader();
                                  } else {
                                    final snackBar = defaultSnakeBar(
                                      title: LocaleKeys.ERROR.tr(),
                                      message: LocaleKeys.ERROR.tr(),
                                      state: ContentType.failure,
                                    );
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                  }
                                },
                                buttonText: 'تسديد',
                              ))
                        ],
                      );
                    },
                  ),
                ),
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
        return 0;
      default:
        return -1;
    }
  }
}
