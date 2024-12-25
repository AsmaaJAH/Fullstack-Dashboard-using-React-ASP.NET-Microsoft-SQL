//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/provider_helper_functions.dart';
import 'package:zcportal/control_layer/managers/bottom_navigator_manager.dart';
import 'package:zcportal/data_layer/providers/screens_providers/persist_tab_provider.dart';
import 'package:zcportal/flavors_layer/delete_me.dart';
import 'package:zcportal/presentation_layer/screens/login_screen.dart';
import 'package:zcportal/translations/locale_keys.g.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


PersistentTabController kController =
    PersistentTabController(initialIndex: Variables.zeroInt);

List<Widget> _navScreens() {
  ProviderHelperFunctions.readCurrentProviderState(
    currentOperation: Variables.accountProvider,
  );
  if (ProviderHelperFunctions.accountProvider.authMode == AuthMode.authorized) {
    return const [
      DeleteMe(),
      DeleteMe(),
      DeleteMe(),
      DeleteMe(),

    ];
  } else {
    return const [
      DeleteMe(),
      DeleteMe(),
      DeleteMe(),
      DeleteMe(),
    ];
  }
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
    ProviderHelperFunctions.readCurrentProviderState(
      currentOperation: Variables.accountProvider,
    );
    isAuth =
        ProviderHelperFunctions.accountProvider.authMode == AuthMode.authorized;
  }


  List<PersistentBottomNavBarItem> get navBarsItems {
    return [
       const BottomNavigatorManager(
        title: "HOME",
        activeIconWidget: Icon(Icons.home_filled),
        inActiveIconWidget: Icon(Icons.home_outlined),
      ).navigatorItem,
      const BottomNavigatorManager(
        title: "INFO",
        activeIconWidget: const Icon(Icons.grid_view_rounded),
        inActiveIconWidget: const Icon(Icons.grid_view_outlined),
      ).navigatorItem,
     const BottomNavigatorManager(
        title: "SERVICES",
        activeIconWidget: const Icon(CupertinoIcons.heart_fill),
        inActiveIconWidget: const Icon(CupertinoIcons.heart),
      ).navigatorItem,
      const BottomNavigatorManager(
        title: "HR REQUEST",
        activeIconWidget: const Icon(CupertinoIcons.cart_fill),
        inActiveIconWidget: const Icon(CupertinoIcons.cart),
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
        
          items: navBarsItems,
          navBarHeight: kScreenHeight * 0.1,
          backgroundColor: AppColors.commonWhite,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(Variables.zero),
            colorBehindNavBar: AppColors.commonWhite,
            boxShadow: <BoxShadow>[
              const BoxShadow(
                color: AppColors.blackBorder,
                blurRadius: Variables.five,
              ),
            ],
          ),
          navBarStyle: NavBarStyle.simple,
        );
      },
    );
  }
}
