enum AppRunningMode {
  staging,
  production,
  //developing,
  //.. so on,
}

//------------------------------- Font Weights Values -----------------------------------------
enum CustomTextWeight {
  thinFont, // thin=w100,
  extraLightFont, // extraLight==w200,
  lightFont, // light==w300,

  regularFont, //regularFont==w400,

  mediumFont, //mediumFont==w500,

  semiBoldFont, // semiBoldFont==w600,
  boldFont, // boldFont==w700,
  extraBoldFont, //extraBoldFont=w800,

  blackFont, //black=w900
}

enum AuthMode { authorized, unauthorized }

enum RequestStatus {
  neutral,
  loading,
  error,
  completed,
}
