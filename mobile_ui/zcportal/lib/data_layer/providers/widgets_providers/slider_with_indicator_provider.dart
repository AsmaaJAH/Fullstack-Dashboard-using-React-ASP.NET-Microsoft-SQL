import 'package:flutter/foundation.dart';

class SliderWithIndicatorProviderState with ChangeNotifier, DiagnosticableTreeMixin {
  int currentActiveIndex = 0;

  updateCurrentActiveIndex(int index) {
    currentActiveIndex = index;
    notifyListeners();
  }
}
