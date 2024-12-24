//-------------------------- Flutter Packages Imports ----------------------------------
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/provider_helper_functions.dart';
import 'package:zcportal/control_layer/managers/themes_manager/mode_themes_manager.dart';
import 'package:zcportal/presentation_layer/screens/splash_screen.dart';



GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // determine screen dimensions,in order to use the two variables,"kScreenWidth" and "kScreenHeight", in everywhere direcly in any app file u wanna. please, do NOT move them from here, otherwise,the whole-app design won't fit its screen
    knowScreenWidth(context);
    knowScreenHeight(context);


    return MultiProvider(
      providers: ProviderHelperFunctions.getProviders(),
      builder: (context, _) {
        return MaterialApp(
          title: 'E-Commerce',
          debugShowCheckedModeBanner: false,
          theme: ModeThemeManager.lightThemes,
          darkTheme: ModeThemeManager.darkThemes,
          navigatorKey: kNavigatorKey,
          home: const SafeArea(
            minimum: EdgeInsets.all(Variables.two),
            child: SplashScreen(),
          ),
        );
      },
    );
  }
}
