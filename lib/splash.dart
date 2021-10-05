import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/Screens/IntroScreen/IntroScrenns.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'AppUtils.dart/LocationData.dart';
import 'Screens/HomeScreen/home_screen.dart';
import 'Screens/SignIn/sign_in.dart';
import 'main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('$message');
        // Navigator.pushNamed(context, '/message',
        //     arguments: MessageArguments(message, true));
      }
    });
    print('Start notification requestPermission now');
    Future.delayed(Duration(milliseconds: 10), () async {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      print('Now requesting fcm token ');
      String? token = await FirebaseMessaging.instance.getToken();
      firebaseToken = '$token';
      print('fcm token is outer = $token');
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission now');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }
      await messaging.getNotificationSettings();
    });
    print('Start fcm now');
    // Future.delayed(Duration(seconds: 3), () async {
    printlog('Now requesting fcm token ');
    //   String? token = await FirebaseMessaging.instance.getToken().then((value){
    //     printlog('fcm token is = $value');
    //   });
    //   firebaseToken = '$token';
    //   printlog('fcm token is = $token');
    // });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                'channel.id',
                'channel.name',
                'channel.description',
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Navigator.pushNamed(context, '/message',
      //     arguments: MessageArguments(message, true));
    });
    gpsService(context);
    getStorage();
    super.initState();
  }

  getStorage() async {
    GetStorage storage = GetStorage();
    printlog('userId = ${storage.read('userId')}');
    if (await storage.read('userId') != null) {
      Future.delayed(Duration(seconds: 2), () {
        Get.offAll(HomeScreen());
      });
    } else {
      if (await storage.read('isFirst') == null) {
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAll(IntroScreens());
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAll(SignIn());
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: ZoomIn(
                duration: Duration(seconds: 1),
                child: SvgPicture.asset(
                  'assets/svg/db main.svg',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
