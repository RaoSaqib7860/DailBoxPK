import 'package:dail_box/LocalizationFile/LanguageLocaleController.dart';
import 'package:dail_box/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LocalizationFile/TranslatiionFile.dart';

var findLanguageController = Get.find<LanguageLocalController>();
var engLocale = Locale('en', 'US');
var urduLocale = Locale('de', 'DE');

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var putLanguageController = Get.put(LanguageLocalController());
  var firstTimeLocale = preferences.getString('en');

  if (firstTimeLocale != null) {
    String? en = preferences.getString('en');
    String? dd = preferences.getString('dd');

    if (en == 'en' && dd == 'US') {
      putLanguageController.isEnglishLocale.value = true;
    } else {
      putLanguageController.isEnglishLocale.value = false;
    }
    runApp(MyApp(
      en: en,
      dd: dd,
    ));
  } else {
    runApp(MyApp());
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final String? en;
  final String? dd;

  const MyApp({Key? key, this.en = 'en', this.dd = 'US'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dialboxx'.tr,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      defaultTransition: Transition.cupertino,
      translations: TranslationFilePage(),
      locale: Locale(en!, dd),
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
