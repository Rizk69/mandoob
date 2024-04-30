import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/expenses/presentaton/get_expenses_cubit/get_expenses_cubit.dart';
import 'package:mandoob/features/expenses/presentaton/widget/build_expense_item.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<GetExpensesCubit>()..getExpenses(),
      child: BlocBuilder<GetExpensesCubit, GetExpensesState>(
        builder: (context, state) {
          return Scaffold(
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
                      controller: _dateController,  // Use the controller here
                      scribbleEnabled: true,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      cursorHeight: 30,
                      onChanged: (value) {
                        GetExpensesCubit.get(context).searchExpenses(value);
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
                              GetExpensesCubit.get(context).searchExpenses(formattedDate);
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
                          var expensesModel =
                              GetExpensesCubit.get(context).filteredExpenses;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: expensesModel.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              var expense = expensesModel[index];
                              return buildExpenseItem(context, expense);
                            },
                          );
                        } else if (state is GetExpensesErrorState) {
                          return  Text(LocaleKeys.EMPTY_LIST.tr());
                        } else {
                          return Container(); // Fallback for other states
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
