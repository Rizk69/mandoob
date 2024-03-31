import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/backgrond_image.dart';
import '../../../../../core/widget/customButton.dart';
import '../../../../../core/widget/custom_text_form_info.dart';
import '../../../../../core/widget/header_screen.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../home/presentation/widget/drawer_home.dart';

class PayingDebts extends StatelessWidget {
  PayingDebts({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                            title: 'إضافة مشتريات ',
                            functionIcon: () {
                              Navigator.pop(context);
                            }),
                        SizedBox(height: AppSize.s5.h),
                        customTextFormFiledInfo(
                          text: 'المادة',
                          enable: true,
                          onChanged: null,
                          hint: '',
                          context: context,
                        ),
                        SizedBox(height: AppSize.s5.h),
                        customTextFormFiledInfo(
                          text: 'الكمية',
                          enable: true,
                          onChanged: null,
                          hint: '',
                          context: context,
                        ),
                        SizedBox(height: AppSize.s5.h),
                        customTextFormFiledInfo(
                          text: 'عملة الشراء',
                          enable: true,
                          onChanged: (payTl) {},
                          context: context,
                        ),
                        SizedBox(height: AppSize.s5.h),
                        customTextFormFiledInfo(
                          text: 'سعر الشراء',
                          enable: true,
                          onChanged: (payUsd) {},
                          context: context,
                        ),
                        SizedBox(height: AppSize.s12.h),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: CustomButton(
                              onPressed: () {},
                              title: LocaleKeys.add.tr(),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
