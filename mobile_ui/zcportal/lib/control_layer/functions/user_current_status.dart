//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zcportal/constants/server_constants.dart';
import 'package:zcportal/control_layer/managers/shared_pref_manager.dart';

class UserCurrentStatus {
  const UserCurrentStatus._();
  static late bool isTokenExist;
  static late bool isVerified;
  static SharedPrefManager sharedPrefManager = SharedPrefManager();

  //know current token:
  static Future getToken() async {
    ServerConstants.currentSharedPrefToken =
        await sharedPrefManager.getString(key: ServerConstants.accessTokenKEY);
  }

  //update current token status:
  static Future<bool> updateTokenStatus() async {
    await getToken();
    isTokenExist = ServerConstants.currentSharedPrefToken != "";
    if (isTokenExist) {
      await sharedPrefManager.setBool(
        key: ServerConstants.isLoggedInBoolKEY,
        value: true,
      );
    } else {
      await sharedPrefManager.setBool(
        key: ServerConstants.isLoggedInBoolKEY,
        value: false,
      );
    }
    return isTokenExist;
  }

  //get app language code:
  static Future getAppCurrentLanguageCode(BuildContext context) async {
    SharedPrefManager sharedPrefManager = SharedPrefManager();

    ServerConstants.currentLanguageCode =
        await sharedPrefManager.getString(key: ServerConstants.languageCodeKEY);

    // if the user didn't, choose any prefered language in the app yet, and the shared preferances are still empty,then, refer to the most favourite device language, and use it as your, language code if it is a supported language:
    final isCodeEmpty = ServerConstants.currentLanguageCode.isEmpty;
    if (isCodeEmpty) {
      // ignore: use_build_context_synchronously
      if (!context.mounted) {
        return;
      }
      ServerConstants.currentLanguageCode = context.locale.languageCode;
    }
  }

  //know current token:
  static Future<bool> getIsVerified() async {
    return ServerConstants.isVerified =
        await sharedPrefManager.getBool(key: ServerConstants.isVerifiedKEY);
  }

  static Future<String> get displayedPhoneOnScreen async {
    SharedPrefManager sharedPrefManager = SharedPrefManager();
    return await sharedPrefManager.getString(key: ServerConstants.phoneKEY);
  }
}
