import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/orders/presentation/el_salah/widget/DropdownMenu.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ElMulakhas extends StatelessWidget {
  const ElMulakhas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: ColorManager.backGround,
      drawer: buildDrawer(context),
      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: AppSize.s8.h),
            HeaderScreen(
              title: 'الملخص' '',
              functionIcon: () {
                Navigator.pushNamed(context, Routes.elSalah);
              },
              functionDrawer: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
            SizedBox(height: AppSize.s4.h),
            Row(
              children: [
                Text(
                  'التاجر',
                  style: getBoldSegoeStyle(
                      fontSize: 20, color: ColorManager.black),
                ),
                SizedBox(
                  width: AppSize.s4.w,
                ),
                Expanded(
                  child: DropdownMenuCustom(
                    color: Colors.transparent,
                    dropdownMenuEntries: ['vd', 'ha', 'mo'],
                    initText: 'اختار التاجر',
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.s3.h),
            Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: ColorManager.greenBorder),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/product.png',
                        height: AppSize.s13.h),
                    SizedBox(width: AppSize.s3.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'شامبو حجم كبير',
                          style: getRegularSegoeStyle(
                              fontSize: 18, color: ColorManager.black),
                        ),
                        Text(
                          '1 طن',
                          style: getRegularSegoeStyle(
                              fontSize: 18, color: ColorManager.black),
                        ),
                        Text(
                          '\$681',
                          style: getRegularSegoeStyle(
                              fontSize: 18, color: ColorManager.black),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: ColorManager.greenBorder),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/product.png',
                        height: AppSize.s13.h),
                    SizedBox(width: AppSize.s3.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'شامبو حجم كبير',
                          style: getRegularSegoeStyle(
                              fontSize: 18, color: ColorManager.black),
                        ),
                        Text(
                          '1 طن',
                          style: getRegularSegoeStyle(
                              fontSize: 18, color: ColorManager.black),
                        ),
                        Text(
                          '\$681',
                          style: getRegularSegoeStyle(
                              fontSize: 18, color: ColorManager.black),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: AppSize.s4.h,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomButton(onPressed: () {
                  Navigator.pushNamed(context, Routes.sucssufflySceen);

                }, buttonText: 'صرف'))
          ],
        ),
      ),
    );
  }
}
