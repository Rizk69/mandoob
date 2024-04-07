import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/expenses/data/responses/addExpenses_requests.dart';
import 'package:mandoob/features/expenses/domain/model/reason_expenses_model.dart';
import 'package:mandoob/features/expenses/presentaton/cubit/expenses_cubit.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/core/widget/custom_text_form_info.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddExpensesView extends StatelessWidget {
  AddExpensesView({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<ExpensesCubit>()..getReasonExpenses(),
      child: SafeArea(
          top: false,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
            child: Stack(
              children: [
                imageBackground(context),
                Scaffold(
                  key: scaffoldKey,
                  drawer: buildDrawer(context),
                  body: SingleChildScrollView(
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
                              title: LocaleKeys.addNewExpense.tr(),
                              functionIcon: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(height: AppSize.s5.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  LocaleKeys.typeExpenses.tr(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              const SizedBox(width: 16),
                              BlocBuilder<ExpensesCubit, ExpensesState>(
                                builder: (context, state) {
                                  if (state is GetExpensesReasonsLoadedState) {
                                    if (context.read<ExpensesCubit>().model !=
                                        null &&
                                        context
                                            .read<ExpensesCubit>()
                                            .model!
                                            .reasonExpense
                                            .isNotEmpty) {
                                      return Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                            borderRadius:
                                            const BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                          child: DropdownButton<int>(
                                            value: context
                                                .read<ExpensesCubit>()
                                                .model!
                                                .reasonExpense
                                                .first
                                                .id,
                                            // Example of setting initial value
                                            elevation: 16,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor, // Text color
                                              fontSize: 18, // Text size
                                            ),
                                            dropdownColor: Theme.of(context)
                                                .primaryColorDark,
                                            onChanged: (value) {
                                              // Handle dropdown value change
                                            },
                                            items: context
                                                .read<ExpensesCubit>()
                                                .model!
                                                .reasonExpense
                                                .map<DropdownMenuItem<int>>(
                                                    (ReasonExpense
                                                reasonExpense) {
                                                  return DropdownMenuItem<int>(
                                                    value: reasonExpense.id,
                                                    child: Text(translateString(
                                                        context: context,
                                                        arString:
                                                        reasonExpense.nameAr,
                                                        enString:
                                                        reasonExpense.nameEn)),
                                                  );
                                                }).toList(),
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                  return const CircularProgressIndicator();
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.s5.h),
                          buildCostRow(context),
                          SizedBox(height: AppSize.s5.h),
                          buildInvoicesRow(context),
                          SizedBox(height: AppSize.s5.h),

                          customTextFormFiledInfo(
                            text: LocaleKeys.cost.tr(),
                            onChanged: (address) {
                            },
                            context: context,
                          ),
                          SizedBox(height: AppSize.s12.h),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: CustomButton(
                                onPressed: () {
                                  final addExpensesRequests = AddExpensesRequests(
                                    image: ExpensesCubit.get(context).image,
                                    currencyId: ExpensesCubit.get(context).currencyId,
                                    count: ExpensesCubit.get(context).count,
                                    price: ExpensesCubit.get(context).price,
                                    reasonExpenseId: ExpensesCubit.get(context).reasonExpenseId.toString(),
                                  );
                                  ExpensesCubit.get(context).addReasonExpenses(addExpensesRequests);
                                },
                                buttonText: LocaleKeys.add.tr(),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }


  Widget buildInvoicesRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            LocaleKeys.invoices.tr(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
          ),
        ),
        IconButton(
          icon: Icon(Icons.upload_file, color: Theme.of(context).primaryColor),
          onPressed: () => ExpensesCubit.get(context).pickImage(),
        ),
      ],
    );
  }


  Widget buildCostRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: customTextFormFiledInfo(
            text: LocaleKeys.cost.tr(),
            onChanged: (price) {
              context.read<ExpensesCubit>().price = price;
            },
            context: context,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: BlocBuilder<ExpensesCubit, ExpensesState>(
            builder: (context, state) {
              final cubit = context.read<ExpensesCubit>();
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: DropdownButton<int>(
                  value: cubit.reasonExpenseId ?? 0,
                  elevation: 16,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                  dropdownColor: Theme.of(context).primaryColorDark,
                  onChanged: (value) {
                    cubit.updateReasonExpenseId(value!);
                  },
                  items: const <DropdownMenuItem<int>>[
                    DropdownMenuItem<int>(
                      value: 0,
                      child: Text("ليره"),
                    ),
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text("دولار"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

}
