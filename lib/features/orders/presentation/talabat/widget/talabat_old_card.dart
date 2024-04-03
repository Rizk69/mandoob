import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/features/orders/domain/model/talabat_model.dart';

class OldOrder extends StatelessWidget {
  final OrdersTalabat talabatOld ;
  const OldOrder({super.key , required this.talabatOld});

  @override
  Widget build(BuildContext context) {

    final order = talabatOld;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'رقم الطلبية :  ${order.orderNo}',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المبلغ بالدولار : ${order.priceDoler}',
                    style: getBoldSegoeStyle(
                      fontSize: 18,
                      color: ColorManager.grey3,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.talabatOldDetails,arguments:order.id.toString() );

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "التفاصيل",
                        style: TextStyle(
                          color: ColorManager.babyBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'المبلغ بالليرة : ${order.priceLera}',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'التاريخ :  ${order.date}',
                style: getBoldSegoeStyle(
                  fontSize: 18,
                  color: ColorManager.grey3,
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
