class DeviceModel {
  DeviceModel({
    this.deviceType,
    this.mostFavDeviceLangCode,
    this.timeZone,
    this.localization,
    this.deviceID,
    this.firebaseAuthToken,
    this.isLoggedOut,
  });

  int? deviceID;
  bool? isLoggedOut;
  String? firebaseAuthToken;
  String? deviceType;
  String? localization;//ex: 'en'
  String? timeZone; // ex: 'Cairo'
  String? mostFavDeviceLangCode; 
  //----------------------   Read me: ----------------------------
  // this last string is the
  //most favourite user " DEVICE " language ,
  // not necessary to be the same choosen language inside the app
  //  ex: if the user chosed to display the app in arabic
  // while his system device language is english.
  //So, if u need to get the inStore app displaying language,
  //then use:
  // UserCurrentStatus.getAppLanguageCode();
  //or:
  //var langCode= ServerConstants.currentLanguageCode;
  //or:
  //  String? localization;
//------------------------------------------------------------------------

  DeviceModel.fromJson(dynamic json) {
    deviceType = json['device_type'];
    firebaseAuthToken = json['firebase_token'];
    localization = json['locale'];
    deviceID = json['id'];
    timeZone = json['Timezone'];
    isLoggedOut=json['logged_out'];
  }

  Map<String, dynamic> toJson({
    bool isDeviceTypeExist = false,
    bool isfirebaseTokenExist = false,
    bool isFirebaseAuthTokenExist= false,
    bool isLocale = false,
    bool isDeviceIDExist = false,
    bool isTimeZoneExist = false,
    bool isloggedOutExist=false,
  }) {
    final map = <String, dynamic>{};

    if (isDeviceTypeExist) map['device_type'] = deviceType;
    if (isfirebaseTokenExist) map['firebase_token'] = firebaseAuthToken;
    if(isFirebaseAuthTokenExist) map['firebase_auth_token']=firebaseAuthToken;
    if (isLocale) map['locale'] = localization;
    if (isDeviceIDExist) map['id'] = deviceID;
    if (isTimeZoneExist) map['Timezone'] = timeZone;
    if (isloggedOutExist) map['logged_out']=isLoggedOut;

    return map;
  }
}
