import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/debts/presentation/debts/cubit/debts_state.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../cubit/debts_cubit.dart';

class DebtsView extends StatelessWidget {
  const DebtsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DebtsViewBody();
  }
}

class DebtsViewBody extends StatelessWidget {
  DebtsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController _dateController = TextEditingController();

    return BlocProvider<DebtsCubit>(
      create: (context) => instance<DebtsCubit>()
        ..getDelegateDebts()
        ..getTraderDebts(),
      child: Scaffold(
        key: scaffoldKey,
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocBuilder<DebtsCubit, DebtsState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: AppSize.s8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        Center(
                          child: Text(
                            LocaleKeys.debts.tr(),
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.homeRoute);
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s4.h),
                    TextFormField(
                      controller: _dateController,  // Use the controller here
                      scribbleEnabled: true,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      cursorHeight: 30,
                      onChanged: (value) {
                        DebtsCubit.get(context).searchDebts(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null) {
                              // Format the picked date
                              final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

                              // Update the text field with the selected date
                              _dateController.text = formattedDate;

                              // Perform search with the selected date
                              DebtsCubit.get(context).searchDebts(formattedDate);
                            }
                          },
                        ),
                        hintText: LocaleKeys.SearchHere.tr(),
                        filled: true,
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        fillColor: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    SizedBox(height: AppSize.s6.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.shadowColor,
                            blurRadius: 9,
                            spreadRadius: 8,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          DefaultTabController(
                            length: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TabBar(
                                  indicatorColor: Colors.black,
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        'ديون  التجار',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .primaryColor, // Change this to your desired text color
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'ديون المندوب ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .primaryColor, // Change this to your desired text color
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppSize.s80.h,
                                  child: TabBarView(
                                    children: [
                                      ListView.builder(
                                          itemBuilder: (context, index) {
                                            var debtsCubit =
                                                DebtsCubit.get(context)
                                                    .filteredTraderData;
                                            if (debtsCubit == null ||
                                                debtsCubit.isEmpty) {
                                              return SizedBox();
                                            }

                                            if (index >=
                                                debtsCubit.length) {
                                              return SizedBox();
                                            }

                                            final debts =
                                                debtsCubit[index];
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      rowCard(
                                                          title: 'اسم التاجر',
                                                          colorTitle:
                                                          Theme.of(context).primaryColor,
                                                          colordes: Theme.of(context).primaryColor,
                                                          des: debts.traderName,
                                                          context: context),
                                                      rowCard(
                                                          title:
                                                              'مبلغ الدين باالدولار',
                                                          colorTitle:
                                                          Theme.of(context).primaryColor,
                                                          colordes: Theme.of(context).primaryColor,
                                                          des:
                                                              "${debts.debtDoler}",
                                                          context: context),
                                                      rowCard(
                                                          title:
                                                              'مبلغ الدين بالليرة',
                                                          colorTitle:
                                                          Theme.of(context).primaryColor,
                                                          colordes: Theme.of(context).primaryColor,
                                                          des:
                                                              "${debts.debtLera}",
                                                          context: context),
                                                      rowCard(
                                                          title:
                                                              'تاريخ اخر دفعة',
                                                          colorTitle:
                                                          Theme.of(context).primaryColor,
                                                          colordes: Theme.of(context).primaryColor,
                                                          des:
                                                              "${debts.lastDate}",
                                                          context: context),
                                                      rowCard(
                                                          title:
                                                              'تاريخ الدفعة القادمة',
                                                          colorTitle:
                                                          Theme.of(context).primaryColor,
                                                          colordes: Theme.of(context).primaryColor,
                                                          des:
                                                              "${debts.dueDate}",
                                                          context: context),
                                                      SizedBox(height: 8),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              Routes
                                                                  .debtRepayment,
                                                              arguments: debts);
                                                        },
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            'تسديد',
                                                            style: TextStyle(
                                                              color:
                                                                  ColorManager
                                                                      .babyBlue,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 12),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey,
                                                            border: Border.all(
                                                                color:
                                                                    Colors.grey,
                                                                width: 1)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                          itemCount: DebtsCubit.get(context)
                                                  .deptTraderModel
                                                  ?.debts
                                                  .length ??
                                              0),
                                      ListView.builder(
                                        itemBuilder: (context, index) {
                                          var delegateDebtsCubit =
                                              DebtsCubit.get(context)
                                                  .filterDelegateData;
                                          if (delegateDebtsCubit == null ||
                                              delegateDebtsCubit
                                                  .isEmpty) {
                                            return SizedBox();
                                          }

                                          if (index >=
                                              delegateDebtsCubit.length) {
                                            return SizedBox();
                                          }

                                          final debts =
                                              delegateDebtsCubit[index];
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    rowCard(
                                                        title:
                                                            'مبلغ الدين باالدولار',
                                                        colorTitle:
                                                            ColorManager.grey3,
                                                        colordes:
                                                            ColorManager.grey3,
                                                        des: debts
                                                            .debtPriceDoler
                                                            .toString(),
                                                        context: context),
                                                    rowCard(
                                                        title:
                                                            'مبلغ الدين بالليرة',
                                                        colorTitle:
                                                            ColorManager.grey3,
                                                        colordes:
                                                            ColorManager.grey3,
                                                        des: debts
                                                            .debtPriceLera
                                                            .toString(),
                                                        context: context),
                                                    rowCard(
                                                        title:
                                                            'تاريخ الدين',
                                                        colorTitle:
                                                            ColorManager.grey3,
                                                        colordes:
                                                            ColorManager.grey3,
                                                        des: debts
                                                            .date
                                                            .toString(),
                                                        context: context),
                                                    rowCard(
                                                        title:
                                                            'السبب',
                                                        colorTitle:
                                                            ColorManager.grey3,
                                                        colordes:
                                                            ColorManager.grey3,
                                                        des: debts
                                                            .reasonExpensesNameAr
                                                            .toString(),
                                                        context: context),
                                                    SizedBox(height: 12),
                                                    Container(
                                                      width: MediaQuery.of(
                                                          context)
                                                          .size
                                                          .width,
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          border: Border.all(
                                                              color:
                                                              Colors.grey,
                                                              width: 1)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        itemCount: DebtsCubit.get(context)
                                                .delegateModel
                                                ?.debts
                                                .length ??
                                            0,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
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
        Text(
          "$title :  ",
          style: getBoldSegoeStyle(
            fontSize: 18,
            color: colorTitle,
          ),
        ),
        Text(
          des,
          style: getBoldSegoeStyle(
            fontSize: 18,
            color: colordes ,
          ),
        )
      ],
    );
  }
}
