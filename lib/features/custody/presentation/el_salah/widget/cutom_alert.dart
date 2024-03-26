import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';

showContainerDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context: context, lira: '13', usd: '15'),
      );
    },
  );
}

Widget contentBox(
    {required BuildContext context,
    required String lira,
    required String usd,
    required}) {
  return Container(
    margin: EdgeInsets.all(15),
    height: MediaQuery.of(context).size.height / 3,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'طريقة الدفع',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(
          height: 2.5.h,
        ),
        Text(
          'هي سيتم دفع مبلغ$liraليره او ما يعادلها $usd دولار  بشكل كاش ام أجل',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
                ),
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).hoverColor),
                shape: MaterialStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s40),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'كاش',
                style: getBoldSegoeStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: AppSize.s20.sp,
                ),
              ),
            ),
            SizedBox(width: 24.0),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
                ),
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).primaryColorDark),
                shape: MaterialStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s40),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'أجل',
                style: getBoldSegoeStyle(
                  color:  Theme.of(context).hoverColor,
                  fontSize: AppSize.s20.sp,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
