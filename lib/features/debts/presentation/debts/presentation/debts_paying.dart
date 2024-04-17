import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/backgrond_image.dart';
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
      child: Scaffold(
        key: scaffoldKey,
        drawer: buildDrawer(context),
        body: Stack(
          children: [
            imageBackground(context),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: AppSize.s6.h,
                    ),
                    HeaderScreen(
                        functionDrawer: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        title: 'المشتريات',
                        functionIcon: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(height: AppSize.s5.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.addPayingDebts);

                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.add,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            'إضافة مشتريات ',
                            style:
                                TextStyle(color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p20, vertical: AppPadding.p18),
                      decoration: BoxDecoration(
                          color:Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: ColorManager.greyDark3,
                                blurRadius: 8,
                                spreadRadius: 3,
                            blurStyle: BlurStyle.normal,
                            offset: const Offset(1, 3)

                            )
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('اسم المادة :',style:
                                  TextStyle(color: Theme.of(context).primaryColor),),
                                  SizedBox(width: 8,),
                                  Text('زيت',style:
                                  TextStyle(color: Theme.of(context).primaryColor),),

                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/images/send.png',height: 18),
                                  SizedBox(width: 8,),
                                  Text('بيع',style:
                                  TextStyle(color: Theme.of(context).primaryColorLight),),

                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 7,),

                          Row(
                            children: [
                              Text('الكمية :',style:
                              TextStyle(color: Theme.of(context).primaryColor),),
                              SizedBox(width: 8,),
                              Text('10 لتر',style:
                              TextStyle(color: Theme.of(context).primaryColor),),

                            ],
                          ),
                          SizedBox(height: 7,),

                          Row(
                            children: [
                              Text('سعر البيع :',style:
                              TextStyle(color: Theme.of(context).primaryColor),),
                              SizedBox(width: 8,),
                              Text('10 دولار',style:
                              TextStyle(color: Theme.of(context).primaryColor),),

                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
