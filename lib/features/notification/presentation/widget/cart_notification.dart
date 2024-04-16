import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../app/functions.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class CartNotification extends StatelessWidget {
  const CartNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                '',
                height: AppSize.s8.h,
                width: AppSize.s8.h,
                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/product.png',
                    height: AppSize.s8.h,
                    width: AppSize.s8.h,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  translateString(
                      context: context,
                      enString: 'يصادف اليوم موعد تسديد دين التاجر احمد ',
                      arString: 'يصادف اليوم موعد تسديد دين التاجر احمد '),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  translateString(
                      context: context,
                      enString: '23/10/2022',
                      arString: '23/10/2022'),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.gray,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
