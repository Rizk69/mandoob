import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:mandoob/features/notification/presentation/widget/cart_notification.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';

class NotificationScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<NotificationCubit>()..getNotifications(),
      child: SafeArea(
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
                      BlocBuilder<NotificationCubit, NotificationState>(
                        builder: (context, state) {
                          if (state is GetNotificationSuccessState) {
                            return ListView.builder(
                              itemBuilder: (context, index) => CartNotification(
                                model: NotificationCubit.get(context).model!.notification![index],
                              ),
                              shrinkWrap: true,
                              itemCount: NotificationCubit.get(context).model!.notification!.length, // Make sure to handle the count dynamically based on the actual data received
                            );
                          } else if (state is GetNotificationLoadingState) {
                            return const Center(child: CircularProgressIndicator());
                          } else {
                            return Center(child: Text(LocaleKeys.NO_CONTENT.tr()));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
