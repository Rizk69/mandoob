import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/font_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//       /// main colors
//       primaryColor: ColorManager.white,
//       primaryColorDark: ColorManager.black,
//       primaryColorLight: ColorManager.azure,
//       disabledColor: ColorManager.coolGrey,
//       splashColor: ColorManager.azure,
//
//       /// card view theme
//       cardTheme: CardTheme(
//         color: ColorManager.coolGrey.withOpacity(0.05),
//         shadowColor: ColorManager.transparent,
//         elevation: AppSize.s1,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(AppSize.s25),
//           ),
//         ),
//       ),
//
//       // /// divider theme
//       // dividerTheme: const DividerThemeData(
//       //     endIndent: AppSize.s16,
//       //     indent: AppSize.s16,
//       //     space: AppSize.s16),
//
//       /// app bar theme
//       appBarTheme: AppBarTheme(
//           centerTitle: true,
//           color: ColorManager.darkSkyBlue,
//           elevation: AppSize.s4,
//           shadowColor: ColorManager.coolGrey,
//           titleTextStyle: getBoldSegoeStyle(
//               fontSize: FontSize.s16, color: ColorManager.white)),
//
//       /// button theme
//       buttonTheme: ButtonThemeData(
//           shape: const StadiumBorder(),
//           disabledColor: ColorManager.coolGrey,
//           buttonColor: ColorManager.darkSkyBlue,
//           splashColor: ColorManager.azure),
//
//       /// elevated button theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//               textStyle: getRegularSegoeStyle(
//                   color: ColorManager.white, fontSize: FontSize.s16.sp),
//               backgroundColor: ColorManager.darkSkyBlue,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(AppSize.s3.w)))),
//
//       /// text theme
//       textTheme: TextTheme(
//           headline1: getSemiBoldInterStyle(
//               color: ColorManager.black, fontSize: FontSize.s16),
//           headline2: getSemiBoldInterStyle(
//               color: ColorManager.black, fontSize: FontSize.s22),
//           headline3: getSemiBoldInterStyle(
//               color: ColorManager.black, fontSize: FontSize.s24),
//           headline4: getSemiBoldInterStyle(
//               color: ColorManager.darkGrey, fontSize: FontSize.s18),
//           subtitle1: getRegularInterStyle(
//               color: ColorManager.warmGrey, fontSize: FontSize.s12),
//           subtitle2: getRegularInterStyle(
//               color: ColorManager.black, fontSize: FontSize.s14),
//           caption: getRegularOpenSansStyle(color: ColorManager.coolGrey)),
//
//       /// input decoration theme (text form field)
//       inputDecorationTheme: InputDecorationTheme(
//         fillColor: ColorManager.paleGrey,
//         filled: false,
//
//         /// content padding
//         contentPadding: EdgeInsets.all(AppPadding.p6.w),
//         hintStyle: getRegularInterStyle(
//             color: ColorManager.coolGrey, fontSize: FontSize.s14),
//         labelStyle: getRegularInterStyle(
//             color: ColorManager.warmGrey3, fontSize: FontSize.s16),
//         errorStyle: getRegularInterStyle(color: ColorManager.red),
//
//         /// enabled
//         enabledBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.paleGrey, width: AppSize.s05.w),
//             borderRadius: BorderRadius.all(Radius.circular(AppSize.s5.w))),
//
//         /// focused border style
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: ColorManager.darkSkyBlue, width: AppSize.s05.w),
//             borderRadius: BorderRadius.all(Radius.circular(AppSize.s5.w))),
//
//         /// error border style
//         errorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.red, width: AppSize.s05.w),
//             borderRadius: BorderRadius.all(Radius.circular(AppSize.s5.w))),
//
//         /// error focused border style
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: ColorManager.darkSkyBlue, width: AppSize.s05.w),
//             borderRadius: BorderRadius.all(Radius.circular(AppSize.s5.w))),
//       ));
// }


ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: ColorManager.white,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // titleTextStyle: getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)
    ),
    primaryColorLight: const Color(0XFF6A6969),
    primaryColorDark: Colors.white,
    canvasColor: const Color(0XffF8F6F6));

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  primaryColor: Colors.black,
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.black,
  canvasColor: Colors.black,
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
);