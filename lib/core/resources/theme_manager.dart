import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.backGround,
    primaryColor: ColorManager.black,
    hoverColor: ColorManager.baseColorLight,
    disabledColor: ColorManager.black,
    cardColor: Colors.black87,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    primaryColorLight: ColorManager.black,
    primaryColorDark: Colors.white,
    canvasColor: const Color(0XffF8F6F6));

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0XFF0E0E0E),
  primaryColor: Colors.white,
  cardColor: Colors.grey,

  hoverColor: ColorManager.baseColorDark,
  disabledColor:  ColorManager.baseColorDark,

  primaryColorLight: ColorManager.darkbabyBlue,
  primaryColorDark: Colors.black,
  canvasColor: Colors.black,
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
);
