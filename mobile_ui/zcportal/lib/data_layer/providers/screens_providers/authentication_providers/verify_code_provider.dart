//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/foundation.dart';

//-------------------------- InStore App Imports ----------------------------------

class VerifyCodeProviderState with ChangeNotifier, DiagnosticableTreeMixin {
  var isFromForgetPassword = false;
  var isFromLogin = false;
  var isCountingDown = false;
  var displayedPhone = "";

  updateDisplayedPhone(String value) {
    displayedPhone = value;
    notifyListeners();
  }
  updateIsFromLogin(bool value) {
    isFromLogin = value;
    notifyListeners();
  }

  updateIsFromForgetPass(bool value) {
    isFromForgetPassword = value;
    notifyListeners();
  }

  updateIsCountingDown(bool value) {
    isCountingDown = value;
    notifyListeners();
  }

  ///-------------------------- Makes properites readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}
