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
  SucssufflySceen({super.key, required this.title,required this.textbutton});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,),
          const Center(child: AnimatedCheck(img: 'assets/images/sucssimage.png')),
          SizedBox(height: AppSize.s4.h,),
          Text(title,style: getBoldSegoeStyle(fontSize: 25, color: ColorManager.black),),
          SizedBox(height: AppSize.s18.h,),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,

              child: CustomButton(onPressed: (){
                Navigator.pushReplacementNamed(context, Routes.homeRoute);
              }, buttonText:textbutton ))

        ],
      ),
    );
  }
}
