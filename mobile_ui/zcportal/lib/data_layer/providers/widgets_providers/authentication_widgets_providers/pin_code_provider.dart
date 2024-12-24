//-------------------------- Flutter Packages Imports ----------------------------------
import 'package:flutter/foundation.dart';
//-------------------------- InStore App Imports ----------------------------------



class PinCodeProviderState with ChangeNotifier, DiagnosticableTreeMixin  {
  String pinCode="";
  
  updatePinCode(String value) {
    pinCode = value;
    notifyListeners();
  }


 ///-------------------------- Makes `properites` readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(StringProperty('enteredPassword', enteredPassword));
  }
} 