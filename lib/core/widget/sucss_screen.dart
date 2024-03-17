import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/anmation.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';

class SucssufflySceen extends StatelessWidget {
  const SucssufflySceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: AnimatedCheck(img: 'assets/images/sucssimage.png')),
          SizedBox(
            height: AppSize.s4.h,
          ),
          Text(
            'تم الصرف بنجاح ',
            style: getBoldSegoeStyle(fontSize: 25, color: ColorManager.black),
          ),
          SizedBox(
            height: AppSize.s12.h,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomButton(onPressed: () {}, buttonText: 'الفاتورة'))
        ],
      ),
    );
  }
}
