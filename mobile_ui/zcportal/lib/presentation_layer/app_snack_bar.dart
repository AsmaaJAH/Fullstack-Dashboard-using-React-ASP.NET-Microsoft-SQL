//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/managers/themes_manager/text_theme_manager.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class AppSnackBar {
  const AppSnackBar({
    required this.context,
    required this.message,
    this.isError = false,
    this.backgroundColor,
    this.animation,
    this.durationInSeconds,
    this.elevation,
    this.margin,
    this.width,
    this.action,
    this.content,
    this.padding,
    this.suffix,
    this.prefix,
    this.shape,
    this.snackBarKey,
    this.isSnackBarLocalized = true,
    this.behavior,
    this.fontSize,
    this.contentHeight,
    this.errorIcon,
    this.successIcon,
    this.textStyle,
    this.isRoundedBorder = false,
    this.isFloatingSnackBar = false,
    this.bottomMarginCloseError,
  });

  final Key? snackBarKey;

  final bool isError;
  final bool isFloatingSnackBar;
  final bool isSnackBarLocalized;
  final bool isRoundedBorder;

  final String message;

  final double?
      width; //width could be null, if u don't need it don't pass it at all
  final double? fontSize;
  final double? elevation;
  final double?
      contentHeight; //contentHeight could be null, if u don't need it don't pass it at all
  final double? bottomMarginCloseError;

  final int? durationInSeconds;

  final Widget? suffix;
  final Widget? prefix;
  final Widget? content;

  final IconData? errorIcon;
  final IconData? successIcon;

  final TextStyle? textStyle;
  final ShapeBorder? shape;
  final BuildContext context;
  final Color? backgroundColor;
  final SnackBarAction? action;
  final EdgeInsetsGeometry? margin;
  final Animation<double>? animation;
  final SnackBarBehavior?
      behavior; //behavior could be null, if u don't need it don't pass it at all
  final EdgeInsetsGeometry? padding;

  void showAppSnackBar() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      key: snackBarKey,
      margin: margin,
      action: action,
      elevation: elevation ?? Variables.zero,
      animation: animation,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                isRoundedBorder ? Variables.ten : Variables.zero,
              ),
            ),
          ),
      behavior: isFloatingSnackBar ? SnackBarBehavior.floating : behavior,
      duration: Duration(
        seconds: durationInSeconds ?? Variables.twoInt,
      ),
      padding: padding ??
          EdgeInsetsDirectional.only(
            top: kScreenWidth * 0.03,
            bottom: kScreenWidth * 0.05,
            start: kScreenWidth * 0.04,
            end: kScreenWidth * 0.02,
          ),
      width: width, //?? kScreenWidth * 0.9,
      content: content ??
          SizedBox(
            height: contentHeight, //?? kScreenHeight * 0.025,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                prefix != null
                    ? prefix!
                    : isError
                        ? Container(
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            margin: EdgeInsetsDirectional.only(
                                bottom:
                                    bottomMarginCloseError ?? Variables.zero,
                                end: Variables.ten),
                            child: Icon(errorIcon ?? Icons.close,
                                size: Variables.double20,
                                color: AppColors.redSnackBar),
                          )
                        : Padding(
                            padding: const EdgeInsetsDirectional.only(
                                bottom: Variables.five, end: Variables.ten),
                            child: Icon(
                                successIcon ?? Icons.check_circle_rounded,
                                size: Variables.double24,
                                color: AppColors.commonWhite),
                          ),
                CustomLocalizedTextWidget(
                  isTranslate: isSnackBarLocalized,
                  stringKey: message,
                  textAlign: TextAlign.start,
                  style: textStyle ??
                      TextThemeManager.boldFont(
                          fontColor: AppColors.commonWhite,
                          fontSize: Variables.double16),
                ),
                suffix != null ? suffix! : const SizedBox.shrink()
              ],
            ),
          ),
      backgroundColor: backgroundColor ??
          (isError ? AppColors.redSnackBar : AppColors.greenSnackBar),
    ));
  }
}
