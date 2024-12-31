//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/foundation.dart';
import 'package:zcportal/constants/app_enum.dart';

class HomeProviderState with ChangeNotifier, DiagnosticableTreeMixin {
  RequestStatus adBannerRequestStatus = RequestStatus.neutral;

  void updateAdBannerRequestStatus(RequestStatus requestStatus) {
    adBannerRequestStatus = requestStatus;
    notifyListeners();
  }



  ///-------------------------- Makes properites readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}
