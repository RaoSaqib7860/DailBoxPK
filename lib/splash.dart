import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'AppUtils.dart/LocationData.dart';
import 'Screens/HomeScreen/home_screen.dart';
import 'Screens/SignIn/sign_in.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    gpsService(context);
    getLocation();
    getStorage();
    super.initState();
  }

  getStorage() async {
    GetStorage storage = GetStorage();
    printlog('userId = ${storage.read('userId')}');
    if (await storage.read('userId') != null) {
      Future.delayed(Duration(seconds: 5), () {
        Get.offAll(HomeScreen());
      });
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAll(SignIn());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/logo.gif',
              ),
            )
          ],
        ),
      ),
    );
  }
}
