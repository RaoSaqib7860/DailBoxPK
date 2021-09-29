import 'package:dail_box/Screens/bottomNav/ChatBox/chatbox.dart';
import 'package:dail_box/Screens/bottomNav/Gourment/goernment.dart';
import 'package:dail_box/Screens/bottomNav/Home/home.dart';
import 'package:dail_box/Screens/bottomNav/Listings/listings.dart';
import 'package:dail_box/Screens/bottomNav/Message/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:get/get.dart';

import 'APiUtilsForAuth.dart';

class BottomSheetCustom extends StatefulWidget {
  const BottomSheetCustom({Key? key}) : super(key: key);

  @override
  _BottomSheetCustomState createState() => _BottomSheetCustomState();
}

class _BottomSheetCustomState extends State<BottomSheetCustom> {
  PersistentTabController? _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      onItemSelected: (v) {
        if (v == 3 && isopenMessage) {
          ApiUtils.getgetAllMyMessages();
        }
      },
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      Home(),
      ChatBox(),
      Listings(),
      Messages(),
      Government(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home".tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bubble_left_bubble_right_fill),
        title: ("Discussion".tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list_alt),
        title: ("Listings".tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      //chat_bubble_text
      PersistentBottomNavBarItem(
        icon:
            // Stack(
            //   children: <Widget>[
            //     Icon(CupertinoIcons.chat_bubble_text),
            //     Positioned(
            //       // draw a red marble
            //       top: 0.0,
            //       right: 0.0,
            //       child: new Icon(Icons.brightness_1,
            //           size: 10.0, color: Colors.redAccent),
            //     ),
            //   ],
            // ),
            Icon(CupertinoIcons.chat_bubble_text),
        title: ("Message".tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_balance),
        title: ("Government".tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
