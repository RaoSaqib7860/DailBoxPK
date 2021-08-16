import 'dart:async';

import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  var listofMessages = [].obs;
  var loadmessage = false.obs;

  Timer? timer;
  callBackgroundSms() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      ApiUtils.getgetAllMyMessages();
    });
  }
}
