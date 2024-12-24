//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
class OverlayLayoutBuilderWidget extends StatelessWidget {
  const OverlayLayoutBuilderWidget({
    super.key,
    this.title,
    this.contentWidget,
    this.customOverlayWidget,
    this.isShareOverlay,
    this.contentItems = Variables.dummyOverlayItems,
    this.itemRow,
    this.secondary,
    this.autofocus = false,
    this.focusNode,
    this.hoverColor,
    this.mouseCursor,
    this.onFocusChange,
    this.onChanged,
    this.isOverlayContentLocalized = true,
    this.isOverlayTitleLocalized = true,
  });

  final String? title;
  final bool? isShareOverlay;
  final bool isOverlayContentLocalized;
  final bool isOverlayTitleLocalized;
  final void Function(bool?)? onChanged;
  final List<Map<String, dynamic>> contentItems; //--->list of maps.
  //Each map consists of two nodes only:
  //1. key  ---------------  2. value
  //the key is a string contains "name" or "isSelected" only
  // this will define if the user has selected this item or not,
  // to make the item appear in yellow or in gray color
  //ex:
  //  final contentItems= [
  //  {
  //      "name":"write your first item here",
  //      "isSelected":false
  //  },
  //  {   "name":"write your second item here",
  //      "isSelected":true
  //  }
  //  ];

  final Widget? itemRow; //-->if you are in "sorted by" overlay,
  //use this to send me a Row() or any widget to put as your
  //item title in the content items
  //ex: the first element in your row will
  //usually be the (price)
  // the second element in your low will be
  //either (high to low) or (low to high) or (..) or so on..

  final Widget?
      customOverlayWidget; //--> use this in (day-month-year) specific date widget
  //or a (sec-min-hr) specific time slot widget, or the specific "share overlay"

  // usually, u will not need to use these below values:
  final bool autofocus;
  final Color? hoverColor;
  final Widget? secondary;
  final Widget? contentWidget;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final void Function(bool)? onFocusChange;

  bool get isSharing => isShareOverlay != null && isShareOverlay!;
  bool _isSelected(int index) =>
      contentItems[index]["name"] != null &&
      contentItems[index]["isSelected"] == true;

  String _itemName(int index) {
    if (contentItems[index]["name"] != null) {
      return contentItems[index]["name"].toString();
    } else {
      return Variables.dummyOverlayItems[Variables.zeroInt]["name"].toString();
    }
  }

  double _getKeybordSpace(BuildContext context) {
    if (isSharing) return MediaQuery.of(context).viewInsets.bottom;
    return Variables.zero;
  }

  @override
  Widget build(BuildContext context) {
    //** suppose to be inside the layout builder in race app:
    final keybordSpace = _getKeybordSpace(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return customOverlayWidget ??
            SingleChildScrollView(
              child: Container(
                color: AppColors.white,
                padding: EdgeInsets.fromLTRB(
                  Variables.five,
                  Variables.eight,
                  Variables.double20,
                  keybordSpace + Variables.double20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          //** remove in race app:
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(
                          width: kScreenWidth * 0.23,
                        ),
                        CustomLocalizedTextWidget(
                            color: AppColors.black,
                            isTranslate: isOverlayTitleLocalized,
                            fontSize: Variables.double14,
                            fontWeight: CustomTextWeight.mediumFont,
                            textAlign: TextAlign.center,
                            stringKey: title ?? "place holder text")
                      ],
                    ),
                    Container(
                      color: AppColors.darkGray,
                      height: Variables.one,
                      width: double.infinity,
                    ),
                    contentWidget ??
                        Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: contentItems.length,
                              itemBuilder: (context, index) {
                                //** in race app , use RadioListTile:
                                return CheckboxListTile( 
                                  selected: _isSelected(index),
                                  secondary: secondary,
                                  mouseCursor: mouseCursor,
                                  hoverColor: hoverColor,
                                  focusNode: focusNode,
                                  autofocus: autofocus,
                                  onFocusChange: onFocusChange,
                                  overlayColor:
                                      WidgetStateProperty.resolveWith(
                                    (states) => AppColors.white,
                                  ),
                                  side: WidgetStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                          color: AppColors.white)),
                                  contentPadding: const EdgeInsets.only(
                                    left: Variables.double17,
                                  ),
                                  checkColor: AppColors.black,
                                  activeColor: AppColors.white,
                                  checkboxShape: const RoundedRectangleBorder()
                                      .copyWith(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          side: const BorderSide(
                                              color: AppColors.white)),
                                  fillColor: WidgetStateProperty.resolveWith(
                                      (states) => AppColors.white),
                                  title: itemRow ??
                                      CustomLocalizedTextWidget(
                                        color: _isSelected(index)
                                            ? AppColors.primary
                                            : AppColors.grayOverlayItems,
                                        isTranslate: isOverlayContentLocalized,
                                        fontSize: Variables.double14,
                                        fontWeight:
                                            CustomTextWeight.regularFont,
                                        textAlign: TextAlign.start,
                                        stringKey: _itemName(index),
                                      ),
                                  value: _isSelected(index),
                                  onChanged: onChanged,
                                );
                              },
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            );
      },
    );
  }
}
