//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/device_info.dart';
import 'package:zcportal/my_app.dart';




void main() async {
  //Ensure Initialization:
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  //lock the landscape mode, and allow only the portrait mode:
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  DeviceInfo.determineTimeZone();
  DeviceInfo.determineDeviceType();
  DeviceInfo.determineDeviceLanguage();

  runApp(
      EasyLocalization(
      supportedLocales: const [Variables.enUsLocale, Variables.arSaLocale],
      path: 'assets/translations',
      fallbackLocale: Variables.enUsLocale,
      child: const MyApp(),
    ),
  );
}
