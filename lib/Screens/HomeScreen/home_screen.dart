import 'package:dail_box/AppUtils.dart/BottomSheet.dart';
import 'package:dail_box/drawerScreens/advertise.dart';
import 'package:dail_box/drawerScreens/contact_us.dart';
import 'package:dail_box/drawerScreens/notification.dart';
import 'package:dail_box/drawerScreens/profile.dart';
import 'package:dail_box/drawerScreens/setting.dart';
import 'package:dail_box/menu_page.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static List<MenuItem> mainMenu = [
    MenuItem('Profile', Icons.person_outline, 0),
    MenuItem('Notifications', Icons.notifications_none, 1),
    MenuItem('Advertise', Icons.business, 2),
    MenuItem('How it works', Icons.build, 3),
    MenuItem('Customer care', Icons.child_care, 4),
    MenuItem('Share', Icons.share, 5),
    MenuItem('Rate us', Icons.thumb_up, 6),
    MenuItem('Corporate overview', Icons.business, 7),
    MenuItem('Settings', Icons.settings, 8),

//    MenuItem(tr("payment"), Icons.payment, 0),
//    MenuItem(tr("promos"), Icons.card_giftcard, 1),
  ];

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _drawerController = ZoomDrawerController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZoomDrawer(
        controller: _drawerController,
        menuScreen: MenuScreen(
          HomeScreen.mainMenu,
          callback: _updatePage,
          closeDrawer: _closeDrawer,
          current: _currentPage,
        ),
        mainScreen: MainScreen(),
        // backgroundColor: Colors.blue,
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        slideWidth:
            MediaQuery.of(context).size.width * (ZoomDrawer.isRTL() ? .45 : 0.65),
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeIn,
      ),
    );
  }

  void _updatePage(index) {
    // Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index);
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Notifications()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Advertise()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContactUs()));
        break;
      case 8:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
        break;
    }
    _drawerController.toggle!();
  }

  void _closeDrawer() {
    _drawerController.toggle!();
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ZoomDrawer.of(context).stateNotifier
  @override
  Widget build(BuildContext context) {
    final rtl = ZoomDrawer.isRTL();
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context)!.stateNotifier!,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        child: BottomSheetCustom(),
        onPanUpdate: (details) {
          if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
            //ZoomDrawer.of(context).toggle();
          }
        },
      ),
    );
  }
}

class MenuProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {
    if (index != currentPage) {
      _currentPage = index;
      notifyListeners();
    }
  }
}
