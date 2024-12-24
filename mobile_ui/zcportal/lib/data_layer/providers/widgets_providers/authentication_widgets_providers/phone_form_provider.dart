//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/foundation.dart';

//-------------------------- InStore App Imports ----------------------------------



class PhoneFormProviderState with ChangeNotifier, DiagnosticableTreeMixin  {

  var isErrorPhoneValidator=false;

  updateIsErrorPhoneValidator(bool value) {
    isErrorPhoneValidator = value;
    notifyListeners();
  }


///-------------------------- Makes `EnteredPhoneState` readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}