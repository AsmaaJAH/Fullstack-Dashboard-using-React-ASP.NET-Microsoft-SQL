import 'package:flutter/foundation.dart';

class FavouriteProviderState with ChangeNotifier, DiagnosticableTreeMixin {
  List<bool> isFavourite = [
    false,
    false,
    false,
    false,
  ];

  updateIsFavourite({
    required int index,
    required bool value,
  }) {
    isFavourite[index] = value;
    notifyListeners();
  }

  ///-------------------------- Makes properities readable inside the devtools by listing all of its properties --------------
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(StringProperty('enteredPassword', enteredPassword));
  }
}
