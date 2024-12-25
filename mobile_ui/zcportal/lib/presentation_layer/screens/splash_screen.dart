//-------------------------- Flutter Packages Imports ----------------------------------

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/provider_helper_functions.dart';
import 'package:zcportal/control_layer/functions/user_current_status.dart';
import 'package:zcportal/flavors_layer/delete_me.dart';
import 'package:zcportal/presentation_layer/screens/login_screen.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body:Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 7, 223, 252),
              Color.fromARGB(255, 13, 67, 74)
            ],
          ),
        ),
        child:
      
      
       Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImagesAssets.splachScreenLogoPath),
            SizedBox(
              height: kScreenWidth * 0.02,
            ),
            const CustomLocalizedTextWidget(
              fontSize: Variables.double23,
              stringKey: "ZC Portal",
              color: AppColors.white,
            ),
          ],
        ),
      ),
    ),);
  }

  void startTimer() {
    Timer(const Duration(milliseconds: Variables.int2500), () {
      navigateUser(); //It will redirect  after 2.5 seconds
    });
  }

  void navigateUser() async {
    var isLoggedInStatus = await UserCurrentStatus.updateTokenStatus();

    //Un-comment this below line to enforce the app to log out:
    //isLoggedInStatus = 1==2;
    //debugPrint(isLoggedInStatus.toString());
    if (isLoggedInStatus) {
      var isVerified = await UserCurrentStatus.getIsVerified();

      //  ignore: use_build_context_synchronously
      if (!context.mounted) {
        return;
      }
      if (isVerified) {
        ProviderHelperFunctions.readCurrentProviderState(
          currentOperation: Variables.accountProvider,
        );
        ProviderHelperFunctions.readCurrentProviderState(
          currentOperation: Variables.persistTabViewProvider,
        );

        ProviderHelperFunctions.accountProvider
            .updateAuthMode(AuthMode.authorized);
        ProviderHelperFunctions.persistState.updateIsHidden(false);

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const DeleteMe()//const PersistTabView(),
          ),
        );
      } else {
        //if the user didn't verify the phone/email contacts then the user should complete the authentication process again:
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ),
        );
      }
    } else {
      //  ignore: use_build_context_synchronously
      if (!context.mounted) {
        return;
      }
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>  const LogInScreen(),
            ),
      );
    }
  }
}
