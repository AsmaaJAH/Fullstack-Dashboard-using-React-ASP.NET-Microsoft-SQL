//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/foundation.dart';

//-------------------------- InStore App Imports ----------------------------------

class NameFormProviderState with ChangeNotifier, DiagnosticableTreeMixin {
  var isErrorNameValidator = false;

  updateIsErrorNameValidator(bool value) {
    isErrorNameValidator = value;
    notifyListeners();
  }

  ///-------------------------- Makes `EnteredPhoneState` readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}
