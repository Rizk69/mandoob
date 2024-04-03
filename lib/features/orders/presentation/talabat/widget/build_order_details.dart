import 'package:flutter/material.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/features/orders/domain/model/order_details_model.dart';

class BuildOrderDetails extends StatelessWidget {

  final Order order;


  const BuildOrderDetails({super.key, required this.order});

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'رقم الطلبية : ${order.orderNo}',
            style: getBoldSegoeStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: 'الحالة : ',
              style: getBoldSegoeStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              ),
              children: [
                TextSpan(
                  text: translateString(
                      context: context,
                      arString: order.status_ar,
                      enString: order.status_en),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.greenLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'التاريخ : ${order.date}',
            style: getBoldSegoeStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
