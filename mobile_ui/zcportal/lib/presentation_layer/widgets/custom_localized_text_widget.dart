//-------------------------- Flutter Packages Imports ----------------------------------
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_fonts.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/managers/themes_manager/text_theme_manager.dart';

//Kindly, use this ((--- localized and customized themes text widget ----))
//instead of the ordinary flutter "Text()" widget:
class CustomLocalizedTextWidget extends StatelessWidget {
  const CustomLocalizedTextWidget({
    super.key,
    this.args,
    this.style,
    this.overflow,
    this.maxLines,
    this.textDirection,
    required this.stringKey,
    this.fontSize = 14,
    this.isTranslate = true,
    this.isSoftWrapped = true,
    this.isThreeDotsInOverFlow =
        false, //it make no sense to set it to true if the "isTranslate" is also true..
    this.fontFamily = AppFonts.fontFamily,
    this.color = AppColors.gray,
    this.textAlign = TextAlign.start,
    this.fontWeight = CustomTextWeight.regularFont, // thin=w100,
    // extraLight==w200,
    // light==w300,
    //regularFont==w400,
    //mediumFont==w500,
    // semiBoldFont==w600,
    // boldFont==w700,
    //extraBoldFont=w800,
    //black=w900
  });

  final Color color;

  final int? maxLines;

  final double fontSize;

  final bool isSoftWrapped;
  final bool isTranslate;
  final bool isThreeDotsInOverFlow;

  final String fontFamily;
  final String stringKey;

  final TextStyle? style;
  final TextAlign textAlign;
  final List<String>? args;

  final ui.TextDirection? textDirection;
  final CustomTextWeight fontWeight;
  final TextOverflow? overflow;

  Text textWidget(BuildContext context) {
    final direction =
        Localizations.localeOf(context).languageCode == Variables.arLangCode
            ? ui.TextDirection.rtl
            : ui.TextDirection.ltr;
    return Text(stringKey,
        textAlign: textAlign,
        overflow: isThreeDotsInOverFlow ? TextOverflow.ellipsis : overflow,
        maxLines: maxLines,
        textDirection: textDirection ?? direction,
        softWrap: isSoftWrapped,
        style: style ??
            TextThemeManager.fontWeight(
              fontSize: fontSize,
              fontColor: color,
              fontWeight: fontWeight,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return isTranslate
        ? textWidget(context).tr(args: args)
        : textWidget(context);
  }
}
