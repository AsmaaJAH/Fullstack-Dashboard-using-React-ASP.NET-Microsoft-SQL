//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/foundation.dart';

//-------------------------- InStore App Imports ----------------------------------

class PasswordFormProviderState with ChangeNotifier, DiagnosticableTreeMixin {
  var password = "";
  var isErrorPassFormValidator = false;
  var isErrorConfirmPassFormValidator = false;
  var isObscurePassword = true;
  var isObscureConfirmPassword = true;

  void togglePasswordVisability() {
    isObscurePassword = !isObscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisability() {
    isObscureConfirmPassword = !isObscureConfirmPassword;
    notifyListeners();
  }

  updateIsErrorPassFormValidator(bool value) {
    isErrorPassFormValidator = value;
    notifyListeners();
  }

  updateIsObscurePassword(bool value) {
    isObscurePassword = value;
    notifyListeners();
  }

  updateIsObscureConfirmPassword(bool value) {
    isObscureConfirmPassword = value;
    notifyListeners();
  }

  updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  updateIsErrorConfirmPassFormValidator(bool value) {
    isErrorConfirmPassFormValidator = value;
    notifyListeners();
  }

  ///-------------------------- Makes `EnteredPhoneState` readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}
