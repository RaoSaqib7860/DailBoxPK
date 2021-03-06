import 'package:dail_box/AppUtils.dart/BottomSheet.dart';
import 'package:dail_box/Screens/AddNewBuisness/AddNewBuisness.dart';
import 'package:dail_box/Screens/AddProduct.dart/AddProduct.dart';
import 'package:dail_box/Screens/AddService/AddService.dart';
import 'package:dail_box/Screens/FAQs/FAQs.dart';
import 'package:dail_box/Screens/SignIn/sign_in.dart';
import 'package:dail_box/Screens/bottomNav/Home/home.dart';
import 'package:dail_box/drawerScreens/advertise.dart';
import 'package:dail_box/Screens/ContactUs/contact_us.dart';
import 'package:dail_box/drawerScreens/notification.dart';
import 'package:dail_box/Screens/Profile/profile.dart';
import 'package:dail_box/drawerScreens/setting.dart';
import 'package:dail_box/menu_page.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  static List<MenuItem> mainMenu = [
    MenuItem(title: 'Add New Business', icon: CupertinoIcons.add, index: 7),
    MenuItem(title: 'Profile', icon: Icons.person_outline, index: 0),
    MenuItem(
        title: 'Add Product', icon: Icons.my_library_add_outlined, index: 5),
    MenuItem(title: 'Add Service', icon: Icons.build, index: 6),
    MenuItem(
        title: 'Add FAQs',
        icon: CupertinoIcons.question_circle_fill,
        index: 3),
    // MenuItem(
    //     title: 'Notifications'.tr, icon: Icons.notifications_none, index: 1),
    MenuItem(title: 'Advertise', icon: Icons.business, index: 2),
    MenuItem(title: 'Customer care', icon: Icons.child_care, index: 4),
    MenuItem(title: 'Settings', icon: CupertinoIcons.settings, index: 8),
    MenuItem(title: 'Logout', icon: Icons.logout, index: 9, iscolor: true),
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
        slideWidth: MediaQuery.of(context).size.width * .45,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeIn,
      ),
    );
  }

  void _updatePage(index) {
    // Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index);
    switch (index) {
      case 0:
        Get.to(Profile());
        break;
      case 1:
        Get.to(Notifications());
        break;
      case 2:
        Get.to(Advertise());
        break;
      case 3:
        Get.to(FAQs());
        break;
      case 4:
        Get.to(ContactUs());
        break;
      case 5:
        Get.to(AddProduct());
        break;
      case 6:
        Get.to(AddService());
        break;
      case 7:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddNewBuiseness()));
        break;
      case 8:
        Get.to(Settings());
        break;
      case 9:
        GetStorage storage = GetStorage();
        storage.erase();
        timer!.cancel();
        Get.offAll(SignIn());
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
          // if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
          //   //ZoomDrawer.of(context).toggle();
          // }
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
