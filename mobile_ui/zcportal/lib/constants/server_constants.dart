class ServerConstants {
  const ServerConstants._();
  //---languages code:
  static String currentLanguageCode = "";


  //-----------------------------Firebase Server----------------------------------
  static String dummyFCMtoken = "1UHAR6Bo69WFZ5ih9sdt4CTbzRE2";

  //------------------------ Device Strorage Local Server -----------------
  //-------- shared prefernces internal database:
  //the shared-pref keys:
  static const String accessTokenKEY = "TokenKEYinStore";
  static const String verifyTokenKEY = "VerificationTokenKEYinStore";
  static const String isLoggedInBoolKEY = "isLoggedinKEYinStore";
  static const String languageCodeKEY = "languageCodeKEYinStore";
  static const String isVerifiedKEY = "isVerifiedKEYinStore";
  static const String phoneKEY = "phoneKEYinStore";
  static const String emailKEY = "emailKEYinStore";

  //the shared-pref Data:
  static String currentSharedPrefToken = "";
  static late bool isVerified;
}
