import 'package:flutter/foundation.dart';

class SliderWithIndicatorProviderState with ChangeNotifier, DiagnosticableTreeMixin {
  int currentActiveIndex = 0;

  updateCurrentActiveIndex(int index) {
    currentActiveIndex = index;
    notifyListeners();
  }
///-------------------------- Makes properities readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}