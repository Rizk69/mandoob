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
  EmptyScreen({super.key, required this.title, required this.textbutton});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        imageBackground(context),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const Center(
                child: AnimatedCheck(img: 'assets/images/error.png')),
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
