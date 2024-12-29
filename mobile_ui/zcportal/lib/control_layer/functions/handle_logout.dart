import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/provider_helper_functions.dart';
import 'package:zcportal/my_app.dart';
import 'package:zcportal/presentation_layer/screens/login_screen.dart';

void handleLogout() {
  ProviderHelperFunctions.readCurrentProviderState(
    currentOperation: Variables.accountProvider,
  );
  ProviderHelperFunctions.readCurrentProviderState(
    currentOperation: Variables.persistTabViewProvider,
  );

  ProviderHelperFunctions.accountProvider.updateAuthMode(AuthMode.unauthorized);
  ProviderHelperFunctions.persistState.updateIsHidden(false);

  if (kNavigatorKey.currentContext == null) {
    return;
  } else if (!kNavigatorKey.currentContext!.mounted) {
    return;
  } else {
    Navigator.of(kNavigatorKey.currentContext!).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }
}
