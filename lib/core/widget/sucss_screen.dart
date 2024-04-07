import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/anmation.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SucssufflySceen extends StatelessWidget {
  String title;
  String textbutton;
  int id;
  SucssufflySceen(
      {super.key,
      required this.title,
      required this.textbutton,
      required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const Center(
              child: AnimatedCheck(img: 'assets/images/sucssimage.png')),
          SizedBox(
            height: AppSize.s4.h,
          ),
          Text(
            title,
            style: getBoldSegoeStyle(
                fontSize: 25, color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: AppSize.s18.h,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomButton(
                  onPressed: () {
                    if (id == -1) {
                      Navigator.pushReplacementNamed(
                          context, Routes.homeViewRoute,
                          arguments: id);
                    } else {
                      Navigator.pushReplacementNamed(
                          context, Routes.fawaterTagerDetails,
                          arguments: id);
                    }
                  },
                  buttonText: textbutton))
        ],
      ),
    );
  }
}
