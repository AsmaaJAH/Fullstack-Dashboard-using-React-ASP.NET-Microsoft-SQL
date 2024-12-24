//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/material.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/presentation_layer/widgets/overlay_layout_builder_widget.dart';

class AppOverlayBuilder {
  const AppOverlayBuilder();

  void openOverlayUI({
    bool isOverlayContentLocalized=true,
    bool isOverlayTitleLocalized=true,
    required BuildContext context,
    void Function(bool?)? onChanged,
    String? title,
    Widget?
        customOverlayWidget, //--> use this in (day-month-year) specific date widget
    //or a (sec-min-hr) specific time slot widget, or the specific "share overlay"

    List<Map<String, dynamic>> contentItems = //--->list of maps.
        Variables.dummyOverlayItems,
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

    Widget? itemRow, //-->if you are in "sorted by" overlay,
    //use this to send me a Row() or any widget to put as your
    //item title in the content items
    //ex: the first element in your row will
    //usually be the (price)
    // the second element in your low will be
    //either (high to low) or (low to high) or (..) or so on..

    bool? isShareOverlay,

    // usually, u will not need to use these below values:
    Widget? contentWidget,
    Widget? secondary,
    bool autofocus = false,
    FocusNode? focusNode,
    Color? hoverColor,
    MouseCursor? mouseCursor,
    void Function(bool)? onFocusChange,
  }) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => OverlayLayoutBuilderWidget(
        isOverlayContentLocalized: isOverlayContentLocalized ,
        isOverlayTitleLocalized: isOverlayTitleLocalized,
        title: title,
        contentWidget: contentWidget,
        customOverlayWidget: customOverlayWidget,
        isShareOverlay: isShareOverlay,
        contentItems: contentItems,
        itemRow: itemRow,
        secondary: secondary,
        autofocus: autofocus,
        focusNode: focusNode,
        hoverColor: hoverColor,
        mouseCursor: mouseCursor,
        onFocusChange: onFocusChange,
        onChanged: onChanged,
      ),
    );
  }
}
