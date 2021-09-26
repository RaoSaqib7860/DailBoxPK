import 'dart:async';

import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:get/get.dart';

class MessageDetailsController extends GetxController {
  var listofDealssms = [].obs;
  var loadData = false.obs;

  Timer? timer;

  callBackgroundSms(String id, String businessID) {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      ApiUtils.getgetChatOneToOne(id, businessID);
    });
  }
}
