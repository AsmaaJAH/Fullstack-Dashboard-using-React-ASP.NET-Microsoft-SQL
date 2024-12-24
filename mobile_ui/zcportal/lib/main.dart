//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zcportal/control_layer/functions/device_info.dart';
import 'package:zcportal/my_app.dart';




void main() async {
  //Ensure Initialization:
  WidgetsFlutterBinding.ensureInitialized();


  //lock the landscape mode, and allow only the portrait mode:
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  DeviceInfo.determineTimeZone();
  DeviceInfo.determineDeviceType();
  DeviceInfo.determineDeviceLanguage();

  runApp(
        const MyApp(),
  );
}
