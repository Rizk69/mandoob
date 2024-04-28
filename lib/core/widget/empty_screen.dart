import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/anmation.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyScreen extends StatelessWidget {
  String title;
  String textbutton;
  bool viewButtom;
  EmptyScreen(
      {super.key,
      required this.title,
      required this.textbutton,
      required this.viewButtom});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (viewButtom) imageBackground(context),
        Column(
          children: [
            if (viewButtom)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            if (viewButtom == false)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            const Center(child: AnimatedCheck(img: 'assets/images/error.png')),
            SizedBox(
              height: AppSize.s4.h,
            ),
            Text(
              title,
              style: getBoldSegoeStyle(
                  fontSize: 25, color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: AppSize.s5.h,
            ),
            if (viewButtom)
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: CustomButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.homeRoute,
                        );
                      },
                      buttonText: textbutton))
          ],
        )
      ],
    );
  }
}
