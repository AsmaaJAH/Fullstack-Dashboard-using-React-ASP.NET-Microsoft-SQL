//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';

class LinearCircularProgressIndicator extends StatelessWidget {
  const LinearCircularProgressIndicator({
    super.key,
    required this.isLinearProgressIndicator,
    this.value,
    this.linearKey,
    this.circularKey,
    this.strokeCap,
    this.color,
    this.linearProgressWidth,
    this.linearProgressHeight,
    this.circularProgressHeight,
    this.circularProgressWidth,
    this.semanticsLabel,
    this.semanticsValue,
    this.valueColor,
    this.borderRadius,
    this.strokeAlign = Variables.strokeAlignCenter,
    this.strokeWidth = Variables.seven,
    this.linearProgressMinHeight = Variables.ten,
  });

  final String? semanticsValue;
  final String? semanticsLabel;

  final bool isLinearProgressIndicator;

  final double? value;
  final double strokeWidth;

  final double linearProgressMinHeight;
  final double? circularProgressHeight;
  final double? circularProgressWidth;
  final double? linearProgressWidth;
  final double? linearProgressHeight;
  final double strokeAlign;

  final Key? linearKey;
  final Key? circularKey;

  final Color? color;

  final Animation<Color?>? valueColor;
  final BorderRadiusGeometry? borderRadius;

  final StrokeCap? strokeCap;

  Widget get linearOrCircularWidget {
    if (isLinearProgressIndicator) {
      return SizedBox(
        height: linearProgressHeight ?? linearProgressMinHeight,
        width: linearProgressWidth ?? kScreenWidth * 0.85,
        child: LinearProgressIndicator(
          value: value,
          key: linearKey,
          valueColor: valueColor,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
          color: AppColors.lightGray,
          minHeight: linearProgressMinHeight,
          backgroundColor: AppColors.primary,
          borderRadius: borderRadius ??
              const BorderRadius.horizontal(
                left: Radius.circular(Variables.double20),
                right: Radius.circular(Variables.double20),
              ),
        ),
      );
    } else {
      return SizedBox(
        height: circularProgressHeight,
        width: circularProgressWidth,
        child: CircularProgressIndicator(
          value: value,
          strokeCap: strokeCap,
          strokeAlign: strokeAlign,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
          color: AppColors.lightGray,
          strokeWidth: strokeWidth,
          valueColor: valueColor,
          key: circularKey,
          backgroundColor: AppColors.primary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return linearOrCircularWidget;
  }
}
