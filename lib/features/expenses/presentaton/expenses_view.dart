import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/expenses/domain/model/expenses_model.dart';
import 'package:mandoob/features/expenses/presentaton/cubit/expenses_cubit.dart';
import 'package:mandoob/features/expenses/presentaton/get_expenses_cubit/get_expenses_cubit.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<GetExpensesCubit>()..getExpenses(),
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
              BlocConsumer<GetExpensesCubit, GetExpensesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetExpensesLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is GetExpensesLoadedState) {
                    var expensesModel = GetExpensesCubit.get(context).expensesModel;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: expensesModel?.expenses.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        var expense = expensesModel!.expenses[index];
                        return _buildExpenseItem(context, expense);
                      },
                    );
                  } else if (state is GetExpensesErrorState) {
                    return const Text('Error loading expenses');
                  } else {
                    return Container(); // Fallback for other states
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ),
);
  }

  Widget _buildExpenseItem(BuildContext context, ExpenseDataModel expense) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExpenseDetail('نوع المصروف', expense.reasonExpenseAr, 18, ColorManager.grey3),
            const SizedBox(height: 12),
            _buildExpenseDetail('تاريخ الشراء', expense.date, 18, ColorManager.grey3),
            const SizedBox(height: 12),
            _buildExpenseDetail('الكمية', '${expense.count} طن', 18, ColorManager.grey3),
            const SizedBox(height: 12),
            _buildExpenseDetail('الحالة', expense.statusAr, 18, expense.statusAr == 'مقبول' ? ColorManager.greenLight : ColorManager.red),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseDetail(String title, String description, double fontSize, Color color) {
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
        Expanded(
          child: Text(
            description,
            style: getBoldSegoeStyle(
              fontSize: fontSize,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
