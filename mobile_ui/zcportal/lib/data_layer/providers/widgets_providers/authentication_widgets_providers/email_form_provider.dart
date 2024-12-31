//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/foundation.dart';

//-------------------------- InStore App Imports ----------------------------------

class EmailFormProviderState with ChangeNotifier, DiagnosticableTreeMixin  {

  var isErrorEmailValidator=false;

  updateIsErrorEmailValidator(bool value) {
    isErrorEmailValidator = value;
    notifyListeners();
  }


///-------------------------- Makes properities readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}