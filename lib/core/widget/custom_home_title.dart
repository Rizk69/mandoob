import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/font_manager.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomHomeTitle extends StatelessWidget {
  String title;
  void Function()? onPressed;

  CustomHomeTitle({super.key, required this.title , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p2.pt),
          child: Expanded(
            child: Text(
              title.tr(),
              textDirection: getTextDirection(context),
              style: getBoldInterStyle(
                color: ColorManager.greyishBrown,
                fontSize: FontSize.s22.sp,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed:onPressed,
          child: Text(
            LocaleKeys.viewAll.tr(),
            style: getSemiBoldInterStyle(
              color: ColorManager.coolBlue,
              fontSize: AppSize.s16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
