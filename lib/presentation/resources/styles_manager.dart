import 'package:flutter/material.dart';
import 'package:mandoob/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
    String fontFamily, double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color);
}

TextStyle getRegularSegoeStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.segoeFontFamily);
}

TextStyle getBoldSegoeStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.segoeFontFamily);
}

TextStyle getRegularInterStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.interFontFamily);
}

TextStyle getMediumInterStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.medium,
      fontFamily: FontConstants.interFontFamily);
}

TextStyle getBoldInterStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.interFontFamily);
}

TextStyle getSemiBoldInterStyle({
  double fontSize = FontSize.s12,
  required Color color,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.interFontFamily,
    decoration: decoration,
  );
}

TextStyle getRegularOpenSansStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.openSansFontFamily);
}

TextStyle getSemiBoldOpenSansStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.semiBold,
      fontFamily: FontConstants.openSansFontFamily);
}

TextStyle getBoldOpenSansStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.openSansFontFamily);
}

// Oxygen styles

TextStyle getBoldOxygenStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.oxygenFontFamily);
}

TextStyle getRegularOxygenStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.oxygenFontFamily);
}

TextStyle getLightOxygenStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.light,
      fontFamily: FontConstants.oxygenFontFamily);
}
