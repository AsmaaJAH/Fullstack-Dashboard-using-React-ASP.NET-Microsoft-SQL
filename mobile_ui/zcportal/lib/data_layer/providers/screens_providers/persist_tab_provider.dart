//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/foundation.dart';

//-------------------------- InStore App Imports ----------------------------------

class PersistTabProviderState with ChangeNotifier, DiagnosticableTreeMixin {
  bool isHidden = false;
  void updateIsHidden(bool value) {
    isHidden = value;
    notifyListeners();
  }

  ///-------------------------- Makes properties readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}
