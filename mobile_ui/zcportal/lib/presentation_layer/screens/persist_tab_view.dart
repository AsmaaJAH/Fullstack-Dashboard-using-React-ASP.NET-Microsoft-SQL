//-------------------------- Flutter Packages Imports ----------------------------------
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/provider_helper_functions.dart';
import 'package:zcportal/control_layer/managers/bottom_navigator_manager.dart';
import 'package:zcportal/data_layer/providers/screens_providers/persist_tab_provider.dart';
import 'package:zcportal/flavors_layer/delete_me.dart';
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
      DeleteMe(),
    ];
  } else {
    return const [
      DeleteMe(),
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
        activeIconWidget: Icon(
          Icons.info,
        ),
        inActiveIconWidget: Icon(
          Icons.info_outline,
        ),
      ).navigatorItem,
      PersistentBottomNavBarItem(
        icon: Center(
          child: CircleAvatar(
            radius: kScreenHeight * 0.05,
            child: Image.asset(
              AppImagesAssets.whiteLogo,
              height: kScreenHeight * 0.1,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      const BottomNavigatorManager(
        title: "SERVICES",
        activeIconWidget: Icon(Icons.dashboard_customize),
        inActiveIconWidget: Icon(Icons.dashboard_customize_outlined),
      ).navigatorItem,
      const BottomNavigatorManager(
        title: "HR REQUESTS",
        activeIconWidget: Icon(Icons.description_rounded),
        inActiveIconWidget: Icon(Icons.description_outlined),
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
          padding: const EdgeInsets.only(top: Variables.ten),
          items: navBarsItems,
          navBarHeight: kScreenHeight * 0.1,
          backgroundColor: AppColors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardAppears: true,
          decoration: NavBarDecoration(
            borderRadius: kScreenWidth > 500
                ? const BorderRadius.vertical(top: Radius.circular(35))
                : const BorderRadius.vertical(top: Radius.circular(25)),
            colorBehindNavBar: AppColors.white,
            boxShadow: <BoxShadow>[
              const BoxShadow(
                color: Color.fromARGB(140, 0, 10, 53),
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
