//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/managers/themes_manager/text_theme_manager.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';


class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomizedAppBar({
    super.key,
    this.title,
    this.actions,
    this.titleStyle,
    this.subTitle,
    this.leadingLogoPath,
    this.isBackIcon = true,
    this.isBottomLine = false,
    this.isCentered = true,
    this.isAppBarLocalized = true,
    this.height = kToolbarHeight,
    this.squareSide = Variables.double24,
    this.searchBar,
    this.actionsIconTheme,
    this.logoImageWidget,
    this.scrolledUnderElevation,
    this.backgroundColor,
  });

  final double squareSide;
  final double height;

  final String? title;
  final String? leadingLogoPath;
  final Widget? logoImageWidget;

  final bool isCentered; //---> is "title" or "searchBar" centered or not?
  final bool isBackIcon;
  final bool isBottomLine;
  final bool isAppBarLocalized;

  final TextStyle? titleStyle;
  final Widget? subTitle;
  final Widget? searchBar;

  final List<Widget>? actions;
  final IconThemeData? actionsIconTheme;
  final double? scrolledUnderElevation;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size(double.infinity, height);

  bool isSearchBarExist() => searchBar != null ? true : false;
  bool isTitleOnly() =>
      title != null && subTitle == null && leadingLogoPath == null;
  bool isLogoWithSubTitle() =>
      title != null && subTitle != null && leadingLogoPath != null;
  bool isLogoWithoutSubTitle() =>
      title != null && subTitle == null && leadingLogoPath != null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isSearchBarExist()
          ? const EdgeInsets.fromLTRB(
              Variables.zero,
              Variables.five,
              Variables.zero,
              Variables.zero,
            )
          : const EdgeInsets.all(Variables.zero),
      child: AppBar(
        scrolledUnderElevation: scrolledUnderElevation ??
            Variables
                .zero, // Flutter Material3 disable appbar color change on scroll
        bottom: isBottomLine
            ? PreferredSize(
                preferredSize: const Size.fromHeight(Variables.one),
                child: Container(
                  color: AppColors.darkGray,
                  height: Variables.one,
                  width: double.infinity,
                ),
              )
            : null,
        elevation: Variables.zero,
        backgroundColor:backgroundColor?? AppColors.commonWhite,
        leading: isBackIcon == true
            ? Padding(
                padding: const EdgeInsets.all(Variables.ten),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: AppColors.gray),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            : isSearchBarExist()
                ? null
                : Container(), // null works if u use "Navigator.pushReplacement" only instead of "Navigator.push"
        actions: actions ?? [],
        actionsIconTheme: actionsIconTheme,
        titleSpacing: isSearchBarExist() ? kScreenWidth * 0.05 : null,
        title: isLogoWithSubTitle()
            ? Row(
                children: [
                  logoImageWidget ??
                      Image.network(
                        leadingLogoPath!,
                        width: squareSide,
                        height: squareSide,
                        fit: BoxFit.fill,
                      ),
                  const SizedBox(
                    width: Variables.double20,
                  ),
                  Column(
                    children: [
                      CustomLocalizedTextWidget(
                        isTranslate: isAppBarLocalized,
                        stringKey: title!,
                        style: titleStyle ??
                            TextThemeManager.mediumFont(
                                fontSize: Variables.double16,
                                fontColor: AppColors.blackTitle),
                      ),
                      const SizedBox(
                        height: Variables.five,
                      ),
                      subTitle!
                    ],
                  ),
                ],
              )
            : isLogoWithoutSubTitle()
                ? Row(
                    children: [
                      Image.network(
                        leadingLogoPath!,
                        width: squareSide,
                        height: squareSide,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(width: Variables.ten),
                      CustomLocalizedTextWidget(
                        isTranslate: isAppBarLocalized,
                        stringKey: title!,
                        style: titleStyle ??
                            TextThemeManager.mediumFont(
                                fontSize: Variables.double16,
                                fontColor: AppColors.blackTitle),
                      ),
                    ],
                  )
                : isTitleOnly()
                    ? CustomLocalizedTextWidget(
                        isTranslate: isAppBarLocalized,
                        stringKey: title!,
                        style: titleStyle ??
                            TextThemeManager.mediumFont(
                                fontSize: Variables.double16,
                                fontColor: AppColors.blackTitle),
                      )
                    : isSearchBarExist()
                        ? searchBar
                        : const SizedBox.shrink(),
        centerTitle: title != null && isCentered ? true : false,
      ),
    );
  }
}
