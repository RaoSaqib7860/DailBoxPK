import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

CustomDailog({String? title, String? subtile}) {
  Get.defaultDialog(
      title: title!,
      middleText: subtile!,
      middleTextStyle: TextStyle(fontSize: 12),);
}
