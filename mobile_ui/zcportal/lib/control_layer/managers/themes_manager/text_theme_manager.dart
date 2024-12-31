//-------------------------- Flutter Packages Imports ----------------------------------
import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_fonts.dart';

class TextThemeManager {
//singleton to not to be instantiated again
  const TextThemeManager._();
//---------------------------------- baseText -----------------------------------------
  static TextStyle _baseText({
    double? fontSize,
    Color? fontColor,
    required FontWeight fontWeight,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: fontSize ?? 14,
        color: fontColor ?? AppColors.gray,
        fontWeight: fontWeight,
        height: 1.35,
        decoration: textDecoration ?? TextDecoration.none,
      );
//=====================================================================================
//================================= FontWeights ========================================
//=====================================================================================
// -------------------------------- thin=w100------------------------------------------
//-------------------------------extraLight==w200--------------------------------------
// --------------------------------light==w300-----------------------------------------
//-------------------------------regularFont==w400-------------------------------------
//-------------------------------mediumFont==w500--------------------------------------
//------------------------------semiBoldFont==w600-------------------------------------
//---------------------------------boldFont==w700--------------------------------------
//------------------------------ extraBoldFont=w800 -----------------------------------
//---------------------------------- black=w900 ---------------------------------------

  static TextStyle thinFont(
          {double? fontSize,
          Color? fontColor,
          TextDecoration? textDecoration}) =>
      _baseText(
        fontWeight: FontWeight.w100,
        fontSize: fontSize,
        fontColor: fontColor,
        textDecoration: textDecoration,
      );
  static TextStyle extraLightFont(
          {double? fontSize,
          Color? fontColor,
          TextDecoration? textDecoration}) =>
      _baseText(
        fontWeight: FontWeight.w200,
        fontSize: fontSize,
        fontColor: fontColor,
        textDecoration: textDecoration,
      );

  static TextStyle lightFont({
    double? fontSize,
    Color? fontColor,
    TextDecoration? textDecoration,
  }) =>
      _baseText(
          fontWeight: FontWeight.w300,
          fontSize: fontSize,
          fontColor: fontColor,
          textDecoration: textDecoration);

  static TextStyle regularFont({
    double? fontSize,
    Color? fontColor,
    TextDecoration? textDecoration,
  }) =>
      _baseText(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        fontColor: fontColor,
        textDecoration: textDecoration,
      );

  static TextStyle mediumFont({
    double? fontSize,
    Color? fontColor,
    TextDecoration? textDecoration,
  }) =>
      _baseText(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontColor: fontColor,
        textDecoration: textDecoration,
      );

  static TextStyle semiBoldFont({
    double? fontSize,
    Color? fontColor,
    TextDecoration? textDecoration,
  }) =>
      _baseText(
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        fontColor: fontColor,
        textDecoration: textDecoration,
      );

  static TextStyle boldFont({
    double? fontSize,
    Color? fontColor,
    TextDecoration? textDecoration,
  }) =>
      _baseText(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        fontColor: fontColor,
        textDecoration: textDecoration,
      );

  static TextStyle extraBoldFont({
    double? fontSize,
    Color? fontColor,
    TextDecoration? textDecoration,
  }) =>
      _baseText(
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
        fontColor: fontColor,
        textDecoration: textDecoration,
      );

  static TextStyle blackFont({
    double? fontSize,
    Color? fontColor,
    TextDecoration? textDecoration,
  }) =>
      _baseText(
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        fontColor: fontColor,
        textDecoration: textDecoration,
      );
//-------------------------- choose any custom font weight u wanna --------------------------
  static TextStyle fontWeight({
    required CustomTextWeight fontWeight,
    double? fontSize,
    Color? fontColor,
  }) {
    switch (fontWeight) {
      case CustomTextWeight.thinFont:
        return thinFont(fontSize: fontSize, fontColor: fontColor);
      case CustomTextWeight.extraLightFont:
        return extraLightFont(fontSize: fontSize, fontColor: fontColor);
      case CustomTextWeight.lightFont:
        return lightFont(fontSize: fontSize, fontColor: fontColor);
      case CustomTextWeight.regularFont:
        return regularFont(fontSize: fontSize, fontColor: fontColor);
      case CustomTextWeight.mediumFont:
        return mediumFont(fontSize: fontSize, fontColor: fontColor);
      case CustomTextWeight.semiBoldFont:
        return semiBoldFont(fontSize: fontSize, fontColor: fontColor);
      case CustomTextWeight.boldFont:
        return boldFont(fontSize: fontSize, fontColor: fontColor);
      case CustomTextWeight.extraBoldFont:
        return extraBoldFont(fontSize: fontSize, fontColor: fontColor);
      case CustomTextWeight.blackFont:
        return extraBoldFont(fontSize: fontSize, fontColor: fontColor);
    }
  }
}
