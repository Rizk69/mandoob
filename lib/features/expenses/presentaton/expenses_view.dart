import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/features/expenses/presentaton/cubit/expenses_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../generated/locale_keys.g.dart';
import '../../home/presentation/widget/drawer_home.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<ExpensesCubit>(),
      child: Scaffold(
        drawer: buildDrawer(context),
        key: scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
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
                        LocaleKeys.expenses.tr(),
                        style: getBoldSegoeStyle(
                            fontSize: 25,
                            color: Theme.of(context).primaryColorLight),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.homeRoute);
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).primaryColorLight,
                        ))
                  ],
                ),
                SizedBox(height: AppSize.s4.h),
                TextFormField(
                  cursorHeight: 30,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'ابحث هنا',
                    filled: true,
                    hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    fillColor: Theme.of(context).primaryColorDark,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.addExpenses);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          LocaleKeys.addExpenses.tr(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildExpenseDetail(
                                'نوع المصروف', 'بنزين', 18, ColorManager.grey3),
                            const SizedBox(height: 12),
                            _buildExpenseDetail('تاريخ الشراء', '24-11-2022',
                                18, ColorManager.grey3),
                            const SizedBox(height: 12),
                            _buildExpenseDetail(
                                'الكمية', '20 طن ', 18, ColorManager.grey3),
                            const SizedBox(height: 12),
                            _buildExpenseDetail('التاريخ ', '24-11-2022', 18,
                                ColorManager.grey3),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'الحالة: ',
                                  style: getBoldSegoeStyle(
                                    fontSize: 18,
                                    color: ColorManager.grey3,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'مقبول',
                                  style: getBoldSegoeStyle(
                                    fontSize: 18,
                                    color: ColorManager.greenLight,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildExpenseDetail(
                                'نوع المصروف', 'بنزين', 18, ColorManager.grey3),
                            const SizedBox(height: 12),
                            _buildExpenseDetail('تاريخ الشراء', '24-11-2022',
                                18, ColorManager.grey3),
                            const SizedBox(height: 12),
                            _buildExpenseDetail(
                                'الكمية', '20 طن ', 18, ColorManager.grey3),
                            const SizedBox(height: 12),
                            _buildExpenseDetail('التاريخ ', '24-11-2022', 18,
                                ColorManager.grey3),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'الحالة: ',
                                  style: getBoldSegoeStyle(
                                    fontSize: 18,
                                    color: ColorManager.grey3,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'مرفوض ويحسب كدين',
                                  style: getBoldSegoeStyle(
                                    fontSize: 18,
                                    color: ColorManager.red,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpenseDetail(
      String title, String description, double fontSize, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title: ',
          style: getBoldSegoeStyle(
            fontSize: fontSize,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          description,
          style: getBoldSegoeStyle(
            fontSize: fontSize,
            color: color,
          ),
        ),
      ],
    );
  }
}
