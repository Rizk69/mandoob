import 'package:flutter/material.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';
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
      child: FutureBuilder<String>(
        future: _appPreferences.getPrimaryColor(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          Color buttonColor = Theme.of(context).hoverColor; // Default color
          if (snapshot.hasData) {
            String colorValue = snapshot.data!;
            if (colorValue.startsWith('#')) {
              colorValue = '0xff' + colorValue.substring(1);
            }
            try {
              buttonColor = Color(int.parse(colorValue));
            } catch (e) {
              print('Error parsing color: $e');
            }
          }
          return ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
              backgroundColor: MaterialStateProperty.all(buttonColor),
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
          );
        },
      ),
    );
  }
}
