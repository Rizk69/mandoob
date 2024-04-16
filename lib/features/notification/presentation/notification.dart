import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/notification/presentation/widget/cart_notification.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';

class NotificationScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  NotificationScreen({Key? key}) : super(key: key);

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
                              title: LocaleKeys.notification.tr(),
                              functionIcon: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(height: AppSize.s5.h),
                          ListView.builder(itemBuilder: (context, index) => CartNotification(),
                          shrinkWrap: true,
                            itemCount: 3,
                          )

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
