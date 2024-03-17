import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AlertNotification extends StatelessWidget {
  const AlertNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            IconAssets.alert,
            width: AppSize.s24,
            height: AppSize.s24,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(AppPadding.p2.pt),
            width: AppSize.s5.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Text(
              '5',
              style: getMediumInterStyle(color: ColorManager.white,fontSize: AppSize.s16.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
