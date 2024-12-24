//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/provider_helper_functions.dart';
import 'package:zcportal/control_layer/managers/bottom_navigator_manager.dart';
import 'package:zcportal/data_layer/providers/screens_providers/persist_tab_provider.dart';
import 'package:zcportal/flavors_layer/delete_me.dart';



PersistentTabController kController =
    PersistentTabController(initialIndex: Variables.zeroInt);

List<Widget> _navScreens() {
  return [
   DeleteMe(),
    DeleteMe(),
    DeleteMe(),
    DeleteMe(),
    DeleteMe(),
  ];
  // ProviderHelperFunctions.readCurrentProviderState(
  //   currentOperation: Variables.accountProvider,
  // );
  // if (ProviderHelperFunctions.accountProvider.authMode == AuthMode.authorized) {
  //   return const [
  //     HomePageScreen(),
  //     DeleteMe(),
  //     DeleteMe(),
  //     DeleteMe(),
  //     DeleteMe(),
  //   ];
  // } else {
  //   return const [
  //     HomePageScreen(),
  //     LogInScreen(),
  //     LogInScreen(),
  //     LogInScreen(),
  //     LogInScreen(),
  //   ];
  // }
}

class PersistTabView extends StatefulWidget {
  const PersistTabView({super.key});

  @override
  State<PersistTabView> createState() => _PersistTabViewState();
}

class _PersistTabViewState extends State<PersistTabView> {
  late bool isAuth;
  @override
  void initState() {
    super.initState();
    // ProviderHelperFunctions.readCurrentProviderState(
    //   currentOperation: Variables.accountProvider,
    // );
    // isAuth =
    //     ProviderHelperFunctions.accountProvider.authMode == AuthMode.authorized;
  }

  // dynamic onGuestPress(BuildContext? context) {
  //   GuestModeFunctions.onPressNavTab();
  // }

  List<PersistentBottomNavBarItem> get navBarsItems {
    return [
      const BottomNavigatorManager(
        title: "Home",
        activeIconWidget: Icon(Icons.home_filled),
        inActiveIconWidget: Icon(Icons.home_outlined),
      ).navigatorItem,

      const BottomNavigatorManager(
        title: "Account",
        activeIconWidget: Icon(CupertinoIcons.person_fill),
        inActiveIconWidget: Icon(CupertinoIcons.person),
      ).navigatorItem,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Selector<PersistTabProviderState, bool>(
      selector: (_, provider) => provider.isHidden,
      builder: (context, isHidden, child) {
        return PersistentTabView(
          context,
          controller: kController,
          screens: _navScreens(),
          hideNavigationBar: isHidden,
          items: navBarsItems,
          navBarHeight: kScreenHeight * 0.1,
          confineInSafeArea: true,
          backgroundColor: AppColors.commonWhite,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            adjustScreenBottomPaddingOnCurve: true,
            borderRadius: BorderRadius.circular(Variables.zero),
            colorBehindNavBar: AppColors.commonWhite,
            boxShadow: <BoxShadow>[
              const BoxShadow(
                color: AppColors.blackBorder,
                blurRadius: Variables.five,
              ),
            ],
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: Variables.int200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: Variables.int200),
          ),
          navBarStyle: NavBarStyle.simple,
        );
      },
    );
  }
}
