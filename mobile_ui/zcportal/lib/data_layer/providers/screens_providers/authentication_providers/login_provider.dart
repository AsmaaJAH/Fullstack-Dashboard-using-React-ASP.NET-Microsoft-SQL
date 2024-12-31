//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginProviderState with ChangeNotifier, DiagnosticableTreeMixin {
  var enteredPassword = '';
  bool obscureText = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  updateEnteredPassword(String value) {
    enteredPassword = value;
    notifyListeners();
  }


  void updateEmail(String value) {
    email.text = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password.text = value;
    notifyListeners();
  }

  void disposeController(TextEditingController controller) {
    controller.dispose();
    notifyListeners();
  }

  ///-------------------------- Makes `EnteredPhoneState` readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}
