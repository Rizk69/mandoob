import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/backgrond_image.dart';
import '../../../../../core/widget/custom_text_form_info.dart';
import '../../../../../core/widget/header_screen.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../home/presentation/widget/drawer_home.dart';

class AddPayingDebts extends StatelessWidget {
  AddPayingDebts({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child:
            Scaffold(
              key: scaffoldKey,
              drawer: buildDrawer(context),
              body: Stack(
                children: [
                  SingleChildScrollView(
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'عملة الشراء',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: DropdownButtonFormField<String>(
                                  value: null,
                                  items: <String>['دولار', 'ليرة']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {},
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.s5.h),
                          customTextFormFiledInfo(
                            text: 'سعر الشراء',
                            enable: true,
                            onChanged: (payUsd) {},
                            context: context,
                          ),
                          SizedBox(height: AppSize.s5.h),
                          customTextFormFiledInfo(
                            text: 'سعر بيع بالدولار',
                            enable: true,
                            onChanged: (payUsd) {},
                            context: context,
                          ),
                          SizedBox(height: AppSize.s5.h),
                          customTextFormFiledInfo(
                            text: 'سعر بيع بالليرة',
                            enable: true,
                            onChanged: (payUsd) {},
                            context: context,
                          ),
                          SizedBox(height: AppSize.s12.h),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: CustomButton(
                                onPressed: () {},
                                buttonText: LocaleKeys.add.tr(),
                              ))
                        ],
                      ),
                    ),
                  ),
                  imageBackground(context),

                ],
              ),
            ),
         );
  }
}
