import 'package:flutter/material.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/features/orders/domain/model/order_details_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuildProductDetails extends StatelessWidget {
  final Product product;

  const BuildProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey3,
            offset: Offset(1, 2),
            spreadRadius: 0.1,
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Image.network(
            product.img,
            height: 13.h,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/product.png',
                height: 13.h,
              );
            },
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translateString(
                  context: context,
                  enString: product.name_en,
                  arString: product.name_ar,
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                '${product.count} ${translateString(context: context, enString: product.unit_en, arString: product.unit_ar)}',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
