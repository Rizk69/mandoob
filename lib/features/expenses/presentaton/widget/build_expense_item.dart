import 'package:flutter/material.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/features/expenses/domain/model/expenses_model.dart';

Widget buildExpenseItem(BuildContext context, ExpenseDataModel expense) {
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
          _buildExpenseDetail(
              'نوع المصروف',
              translateString(context: context,arString:expense.reasonExpenseAr ,enString:expense.reasonExpenseEn ,),
              18, ColorManager.grey3),
          const SizedBox(height: 12),
          _buildExpenseDetail(
              'تاريخ الشراء', expense.date, 18, ColorManager.grey3),
          const SizedBox(height: 12),
          _buildExpenseDetail(
              'الكمية', '${expense.count} طن', 18, ColorManager.grey3),
          const SizedBox(height: 12),
          _buildExpenseDetail(
              'الحالة',
              translateString(context: context,arString:expense.statusAr ,enString:expense.statusEn ,),
              18,
              expense.statusAr == 'مقبول'
                  ? ColorManager.greenLight
                  : ColorManager.red),
          const SizedBox(height: 12),
        ],
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
