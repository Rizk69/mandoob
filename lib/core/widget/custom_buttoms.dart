import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.all(10.0),
          ),
          backgroundColor:
          MaterialStateProperty.all<Color>(ColorManager.baseColorLight),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  AppSize.s40), // Adjust the radius as needed
            ),
          ),
        ),
        onPressed: onPressed,
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
