//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/data_layer/providers/screens_providers/account_provider.dart';
import 'package:zcportal/data_layer/providers/screens_providers/authentication_providers/login_provider.dart';
import 'package:zcportal/data_layer/providers/screens_providers/home_providers/home_provider.dart';
import 'package:zcportal/data_layer/providers/screens_providers/home_providers/notifications_provider.dart';
import 'package:zcportal/data_layer/providers/screens_providers/persist_tab_provider.dart';
import 'package:zcportal/data_layer/providers/widgets_providers/home_page_widgets_providers/slider_with_indicator_provider.dart';
import 'package:zcportal/my_app.dart';

class ProviderHelperFunctions {
  ProviderHelperFunctions._();
  static late AccountProviderState accountProvider;
  static late LoginProviderState loginProvider;
  static late PersistTabProviderState persistState;

  static List<SingleChildWidget> getProviders() {
    return [
      //authentication
      ChangeNotifierProvider(create: (_) => LoginProviderState()),

      //Home:
      ChangeNotifierProvider(create: (_) => SliderWithIndicatorProviderState()),
      ChangeNotifierProvider(create: (_) => PersistTabProviderState()),
      ChangeNotifierProvider(create: (_) => HomeProviderState()),
      ChangeNotifierProvider(create: (_) => NotificationProviderState()),
    ];
  }

  static void readCurrentProviderState({required String currentOperation}) {
    if (kNavigatorKey.currentContext == null) {
      return;
    } else if (!kNavigatorKey.currentContext!.mounted) {
      return;
    } else {
      if (currentOperation == Variables.persistTabViewProvider) {
        persistState =
            kNavigatorKey.currentContext!.read<PersistTabProviderState>();
      } else if (currentOperation == Variables.loginProvider) {
        loginProvider =
            kNavigatorKey.currentContext!.read<LoginProviderState>();
      } else if (currentOperation == Variables.accountProvider) {
        accountProvider =
            kNavigatorKey.currentContext!.read<AccountProviderState>();
      }
    }
  }
}
