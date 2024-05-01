import 'package:flutter/material.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppPreferences _appPreferences = instance<AppPreferences>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s40),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
          backgroundColor: MaterialStateProperty.all(ColorFunctions.loadButtonColor()),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s40),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: getBoldSegoeStyle(
            color: ColorManager.black,
            fontSize: AppSize.s20.sp,
          ),
        ),
      ),
    );
  }
}
