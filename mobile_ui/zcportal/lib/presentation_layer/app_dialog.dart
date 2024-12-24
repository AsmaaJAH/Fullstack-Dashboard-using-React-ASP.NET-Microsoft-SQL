//-------------------------- Flutter Packages Imports ----------------------------------


import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/presentation_layer/widgets/two_opitons_dialog_widget.dart';

class AppDialog {
  const AppDialog({
    required this.context,
    this.builder,
    this.positiveAction,
    this.dialogTitle,
    this.dialogContent,
    this.positiveButtonText,
    this.negativeButtonText,
    this.negativeButtonColor,
    this.positiveButtonColor,
    this.titleStyle,
    this.dialogContentTextStyle,
    this.isDialogContentLocalized=true,
    this.isDialogTitleLocalized=true,
    this.isNegativeBtnTxtDialogLocalized=true,
    this.isPositiveBtnTxtDialogLocalized=true,
  });
  final bool isDialogContentLocalized;
  final bool isDialogTitleLocalized;
  final bool isPositiveBtnTxtDialogLocalized;
  final bool isNegativeBtnTxtDialogLocalized;
  final BuildContext context;
  final Function? positiveAction;
  final String? dialogTitle;
  final String? dialogContent;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final Color? negativeButtonColor;
  final Color? positiveButtonColor;
  final Widget Function(BuildContext)? builder;
  final TextStyle? titleStyle;
  final TextStyle? dialogContentTextStyle;
  void showTwoOptionsDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: builder ??
            (ctx) => CupertinoTheme(
                  data: const CupertinoThemeData(
                    primaryContrastingColor: AppColors.offWhiteBackground,
                    primaryColor: AppColors.offWhiteBackground,
                    scaffoldBackgroundColor: AppColors.offWhiteBackground,
                    barBackgroundColor: AppColors.offWhiteBackground,
                  ),
                  child: CupertinoAlertDialog(
                    content: TwoOptionsDialogWidget(
                      isNegativeBtnTxtDialogLocalized: isNegativeBtnTxtDialogLocalized,
                      isPositiveBtnTxtDialogLocalized: isPositiveBtnTxtDialogLocalized,
                      isDialogContentLocalized: isDialogContentLocalized,
                      isDialogTitleLocalized:isDialogTitleLocalized ,
                      titleStyle: titleStyle,
                      dialogContentTextStyle: dialogContentTextStyle,
                      dialogTitle: dialogTitle,
                      dialogContent: dialogContent,
                      positiveAction: positiveAction,
                      positiveButtonText: positiveButtonText,
                      positiveButtonColor: positiveButtonColor,
                      negativeButtonText: negativeButtonText,
                      negativeButtonColor: negativeButtonColor,
                    ),
                  ),
                ),
      );
    } else {
      //android device and so on
      showDialog(
        context: context,
        builder: builder ??
            (ctx) => AlertDialog(
                  backgroundColor: AppColors.offWhiteBackground,
                  //surfaceTintColor: AppColors.red,
                  contentPadding: const EdgeInsets.all(Variables.zero),
                  content: TwoOptionsDialogWidget(
                    isNegativeBtnTxtDialogLocalized: isNegativeBtnTxtDialogLocalized,
                    isPositiveBtnTxtDialogLocalized: isNegativeBtnTxtDialogLocalized,
                    isDialogContentLocalized: isDialogContentLocalized,
                    isDialogTitleLocalized: isDialogTitleLocalized,
                    titleStyle: titleStyle,
                    dialogContentTextStyle: dialogContentTextStyle,
                    dialogTitle: dialogTitle,
                    dialogContent: dialogContent,
                    positiveAction: positiveAction,
                    positiveButtonText: positiveButtonText,
                    positiveButtonColor: positiveButtonColor,
                    negativeButtonText: negativeButtonText,
                    negativeButtonColor: negativeButtonColor,
                  ),
                ),
      );
    }
  }
}
