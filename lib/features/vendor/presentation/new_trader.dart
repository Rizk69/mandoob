import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/orders/presentation/el_salah/widget/DropdownMenu.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';

import '../../home/widget/drawer_home.dart';


class NewTraderView extends StatelessWidget {
  const NewTraderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
        top: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: ColorManager.backGround,
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
                      title: 'إضافة تاجر جديد',
                      functionIcon: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(height: AppSize.s5.h),
                  customRow(text: 'أسم التاجر'),
                  SizedBox(height: AppSize.s5.h),
                  customRow(text: 'عنوانه'),
                  SizedBox(height: AppSize.s5.h),
                  customRow(text: 'رقم التليفون'),
                  SizedBox(height: AppSize.s5.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'التاجر',
                          style: getBoldSegoeStyle(
                              fontSize: 20, color: ColorManager.black),
                        ),
                      ),
                      SizedBox(
                        width: AppSize.s4.w,
                      ),
                      Expanded(
                        flex: 3,
                        child: DropdownMenuCustom(
                          color: Colors.white,
                          dropdownMenuEntries: ['vd', 'ha', 'mo'],
                          initText: 'مفرق',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s12.h),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child:
                      CustomButton(onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.sucssufflyAddTrader);


                      }, buttonText: 'إضافة'))
                ],
              ),
            ),
          ),
        ));
  }

  Widget customRow({required String text}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            scribbleEnabled: true,
            cursorHeight: 30,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
