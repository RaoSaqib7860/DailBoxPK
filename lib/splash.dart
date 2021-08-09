import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/board.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'AppUtils.dart/LocationData.dart';
import 'Screens/HomeScreen/home_screen.dart';

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
        Get.to(HomeScreen());
      });
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Get.to(BoardScreen());
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
              child: Image.asset('assets/images/logo.gif'),
            )
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   color: blueColor.withOpacity(0.8),
            // ),
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Image(
            //         image: AssetImage('assets/icons/logo.png'),
            //       ),
            //       SizedBox(
            //         height: 25,
            //       ),
            //       Text(
            //         'Jo bhi Jab bhi',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 30,
            //             fontStyle: FontStyle.italic,
            //             wordSpacing: 5),
            //       ),
            //       Text(
            //         'Jahan bhi',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 25,
            //             fontStyle: FontStyle.italic,
            //             wordSpacing: 5),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
