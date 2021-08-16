import 'package:dail_box/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

main() async {
  await GetStorage.init();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dial Box',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      defaultTransition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 700),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
      ),
      home: Splash(),
    );
  }
}
