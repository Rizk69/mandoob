import 'package:flutter/material.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/utiles_app/header_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../home/widget/drawer_home.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class TrafficLines extends StatelessWidget {
  const TrafficLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: buildDrawer(context),
      key: scaffoldKey,
      backgroundColor: ColorManager.backGround,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s4.h,
            ),
            HeaderScreen(
                functionDrawer: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                title: 'خطوط السير',
                functionIcon: () {
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                }),
            SizedBox(height: AppSize.s4.h),
            TextFormField(
              scribbleEnabled: true,
              cursorHeight: 30,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.date_range,
                    color: ColorManager.grey2,
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            primaryColor: ColorManager.babyBlue,
                            hintColor: ColorManager.babyBlue,
                            colorScheme: ColorScheme.light(
                                primary: ColorManager.babyBlue),
                          ),
                          child: child!,
                        );
                      },
                    );
                  },
                ),
                hintText: 'ابحث هنا',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
