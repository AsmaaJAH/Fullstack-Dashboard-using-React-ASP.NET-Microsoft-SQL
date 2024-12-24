//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/managers/themes_manager/text_theme_manager.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';


class CustomizedTextFormField extends StatelessWidget {
  const CustomizedTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.onSaved,
    this.decoration,
    this.width,
    this.focusNode,
    this.validator,
    this.hintColor,
    this.labelColor,
    this.labelFontSize,
    this.labelStyle,
    this.hintStyle,
    this.suffixStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.onEditingComplete,
    this.hintFontSize,
    this.isDense,
    this.isEnabled = true,
    this.obscureText = false,
    this.isAutoFocus = false,
    this.isLabelTranslated = true,
    this.isHintTranslated = true,
    this.isBorderEnabeled = true,
    this.isSuggestionsEnabled = true,
    this.isHintHasVerticalPadding = false,
    this.isFocusedBorderEnebaled = true,
    this.isMorePaddingUnderLabel = false,
    this.isUnderLineFocusBorder = false,
    this.isHorizontalPaddingEnabled = true,
    this.givenHeight = 50,
    this.errorMaxLines = 1,
    this.obscuringCharacter = '*',
    this.userInputColor = AppColors.black,
    this.isAutoCorrected = true,
    this.textCapitalization = TextCapitalization.none,
    this.isObsecuredPasswordForm = false,
    this.clipBehavior = Clip.hardEdge,
  });

  // final int? maxLines; // if your box is big
  // //and u intended to increase the text form field height,
  // //kindly don't use the maxlines
  // //just use or adjust your desirable height
  // //and I will do the rest of work for u ISA

  final double? width;
  final double givenHeight; //kindly, increase the height in case
  // your validation function has an "Error"
  // using selector state management, for usage example,
  //refer to email_form.dart in the "widgets folder" in this project.
  final double? labelFontSize;
  final double? hintFontSize;

  final int errorMaxLines;

  final String? label;
  final String? hint;
  final String obscuringCharacter;

  final Color? userInputColor;
  final Color? hintColor;
  final Color? labelColor;

  final bool? isDense;
  final bool isEnabled;
  final bool isAutoFocus;
  final bool obscureText;
  final bool isAutoCorrected;
  final bool isLabelTranslated;
  final bool isHintTranslated;
  final bool isBorderEnabeled;
  final bool isMorePaddingUnderLabel;
  final bool isSuggestionsEnabled;
  final bool isFocusedBorderEnebaled;
  final bool isUnderLineFocusBorder;
  final bool isHintHasVerticalPadding;
  final bool isHorizontalPaddingEnabled;
  final bool isObsecuredPasswordForm;

  final Widget? suffix;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final FocusNode? focusNode;

  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? suffixStyle;

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextCapitalization textCapitalization;
  final Clip clipBehavior;

  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;

  bool get isAddingMoreSpace => label != null && isMorePaddingUnderLabel;
  bool get isTranslatedHint => hint != null && isHintTranslated;
  bool get isHintNotTransled =>
      hint != null && true;
  double get height => givenHeight >= Variables.minTextFormFieldHeight
      ? givenHeight
      : Variables.minTextFormFieldHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? CustomLocalizedTextWidget(
                isTranslate: isLabelTranslated,
                stringKey: label!,
                style: labelStyle ??
                    TextThemeManager.regularFont(
                        fontColor: labelColor ?? AppColors.black,
                        fontSize: labelFontSize ?? Variables.double16),
              )
            : const SizedBox.shrink(),
        SizedBox(
            height: isAddingMoreSpace ? Variables.double20 : Variables.five),
        SizedBox(
          width: width ?? kScreenWidth * 0.8,
          height: height,
          child: TextFormField(
            clipBehavior: clipBehavior,
            autocorrect: isAutoCorrected,
            textCapitalization: textCapitalization,
            //expands: isBigBox ? true : false,
            expands: isObsecuredPasswordForm ? false : true,
            cursorColor: AppColors.primary,
            cursorHeight: Variables.double20,
            autofocus: isAutoFocus,
            focusNode: focusNode,
            maxLines: isObsecuredPasswordForm ? Variables.oneInt : null,
            // maxLines: !isBigBox ? ConstConventions.oneInt : null,
            controller: controller,
            enabled: isEnabled,
            obscureText: obscureText,
            obscuringCharacter: obscuringCharacter,
            enableSuggestions: isSuggestionsEnabled,
            keyboardType: keyboardType ?? TextInputType.text,
            style: TextThemeManager.regularFont(
                fontColor:
                    userInputColor ?? AppColors.blackUsrInputTxtFormField),
            textAlignVertical: TextAlignVertical.top,
            textAlign: prefix != null ? TextAlign.center : TextAlign.start,
            decoration: decoration ??
                InputDecoration(
                  constraints: BoxConstraints(minHeight: height),
                  enabledBorder: isBorderEnabeled
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Variables.zero),
                          borderSide: const BorderSide(
                            width: Variables.double0_5,
                            color: AppColors.grayBorder,
                          ),
                        )
                      : null,
                  disabledBorder: isBorderEnabeled
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Variables.zero),
                          borderSide: const BorderSide(
                              width: Variables.double0_5,
                              color: AppColors.grayBorder),
                        )
                      : null,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Variables.zero),
                    borderSide:
                        const BorderSide(color: AppColors.redErrorBorder),
                  ),
                  errorMaxLines: errorMaxLines,
                  errorStyle: TextThemeManager.regularFont(
                    fontColor: AppColors.redErrorText,
                    fontSize: Variables.double12,
                  ),
                  border: isBorderEnabeled ? InputBorder.none : null,
                  focusedBorder: isFocusedBorderEnebaled
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Variables.zero),
                          borderSide:
                              const BorderSide(color: AppColors.primary))
                      : null,
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Variables.zero),
                      borderSide:
                          const BorderSide(color: AppColors.redErrorBorder)),
                  hintText: isTranslatedHint
                      ? hint!.tr()
                      : isHintNotTransled
                          ? hint!
                          : null,
                  hintStyle: hintStyle ??
                      TextThemeManager.lightFont(
                          fontSize: hintFontSize ?? Variables.double14,
                          fontColor: hintColor ?? AppColors.grayFilling),
                  contentPadding: const EdgeInsets.fromLTRB(
                    Variables.double18,
                    Variables.ten,
                    Variables.double15,
                    Variables.five,
                  ),
                  isDense: isDense,
                  suffix: suffix,
                  suffixIcon: suffixIcon,
                  suffixStyle: suffixStyle,
                  prefix: prefix,
                  prefixIcon: prefixIcon,
                  suffixIconConstraints:
                      BoxConstraints(maxWidth: kScreenWidth * 0.3),
                ),
            onSaved: onSaved,
            onEditingComplete: onEditingComplete,
            onChanged: onChanged,
            validator: validator,
          ),
        )
      ],
    );
  }
}
