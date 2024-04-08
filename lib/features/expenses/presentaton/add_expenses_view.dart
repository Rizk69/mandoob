import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/customButton.dart';
import 'package:mandoob/core/widget/custom_text_form_info.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/expenses/presentaton/cubit/expenses_state.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';

import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'cubit/expenses_cubit.dart';

class AddExpensesView extends StatelessWidget {
  const AddExpensesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<ExpensesCubit>()..getReasonExpenses(),
      child: AddExpensesViewBody(),
    );
  }
}

class AddExpensesViewBody extends StatelessWidget {
  AddExpensesViewBody({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        child: Stack(
          children: [
            imageBackground(context),
            buildScaffold(context),
          ],
        ),
      ),
    );
  }

  Widget buildScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s18),
          child: Column(
            children: [
              SizedBox(height: AppSize.s6.h),
              HeaderScreen(
                functionDrawer: () => scaffoldKey.currentState?.openDrawer(),
                title: LocaleKeys.addNewExpense.tr(),
                functionIcon: () => Navigator.pop(context),
              ),
              SizedBox(height: AppSize.s5.h),
              TypeExpensesDropdown(),
              SizedBox(height: AppSize.s5.h),
              QuantityFormField(),
              SizedBox(height: AppSize.s5.h),
              CostRow(),
              SizedBox(height: AppSize.s5.h),
              InvoicesRow(),
              SizedBox(height: AppSize.s12.h),
              AddButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class TypeExpensesDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        final cubit = context.read<ExpensesCubit>();
        if (state is! GetExpensesReasonsLoadedState) {
          return const CircularProgressIndicator();
        }
        return DropdownButtonFormField<int>(
          decoration: InputDecoration(
            labelText: LocaleKeys.typeExpenses.tr(),
          ),
          value:
              cubit.reasonExpenseId ?? cubit.model?.reasonExpense.first.id ?? 0,
          onChanged: (value) => cubit.setReasonExpenseId(value!),
          items: cubit.model?.reasonExpense
              .map<DropdownMenuItem<int>>((reasonExpense) {
            return DropdownMenuItem<int>(
              value: reasonExpense.id,
              child: Text(reasonExpense.nameEn),
            );
          }).toList(),
        );
      },
    );
  }
}

class QuantityFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return customTextFormFiledInfo(
      text: LocaleKeys.quantity.tr(),
      onChanged: (value) => context.read<ExpensesCubit>().setUpdateCount(value),
      context: context,
    );
  }
}

class CostRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: customTextFormFiledInfo(
            text: LocaleKeys.cost.tr(),
            context: context,
            onChanged: (value) => context.read<ExpensesCubit>().setPrice(value),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: CurrencyDropdown(),
        ),
      ],
    );
  }
}

class CurrencyDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExpensesCubit>();
    return DropdownButtonFormField<int>(

      value:
          cubit.currencyId != null ? int.tryParse(cubit.currencyId!) ?? 0 : 0,
      onChanged: (value) => cubit.setCurrencyId(value.toString()),
      items: const [
        DropdownMenuItem(value: 0, child: Text("ليره")),
        DropdownMenuItem(value: 1, child: Text("دولار")),
      ],
    );
  }
}

class InvoicesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.invoices.tr(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: Icon(Icons.upload_file),
          onPressed: () => context.read<ExpensesCubit>().pickImage(),
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: LocaleKeys.add.tr(),
      onPressed: () => context.read<ExpensesCubit>().submitExpense(),
    );
  }
}
