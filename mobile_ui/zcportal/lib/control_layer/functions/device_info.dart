
import 'dart:io';
import 'package:zcportal/data_layer/models/device_model.dart';
import 'package:zcportal/my_app.dart';


class DeviceInfo {

   const DeviceInfo._();

  //dummy initialization after declaration
  static var currentDeviceInfo = DeviceModel(
    deviceType: 'unknown',
    timeZone: 'Cairo',
    mostFavDeviceLangCode: 'en',
  );

  static void determineDeviceType() {
    //------------------------------ device type: "android" , "ios" , "web", "unknown" ------------------------
    if (Platform.isAndroid) {
      currentDeviceInfo.deviceType = "android";
    } else if (Platform.isIOS) {
      currentDeviceInfo.deviceType = "ios";
    } else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      currentDeviceInfo.deviceType = "web";
    } else {
      currentDeviceInfo.deviceType = "unknown";
    }
  }

//------------------- time zone ------------------------------------------
  static void determineTimeZone() {
    currentDeviceInfo.timeZone = DateTime.now().timeZoneName.toString();
  }

//-------------------- language ------------------------------------------
  static void determineDeviceLanguage() {
    if (kNavigatorKey.currentContext == null) {
      return;
    } else if (!kNavigatorKey.currentContext!.mounted) {
      return;
    } else {
      //most Favourite Device Language:
            // currentDeviceInfo.mostFavDeviceLangCode = kNavigatorKey
            //     .currentContext!.deviceLocale
            //     .toString()
            //     .split('-')[0]
            //     .toString();
      }
      //   List? languagesList;
      //   languagesList = await Devicelocale.preferredLanguages;
      //   currentDeviceInfo.mostFavDeviceLangCode =
      //       languagesList!.asMap()[0].toString().split('-')[0].toString();
    }
}
 

