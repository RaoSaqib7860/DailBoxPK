import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePasswordController extends GetxController {
  TextEditingController p1Con = TextEditingController();
  TextEditingController p2Con = TextEditingController();
  TextEditingController otpCon = TextEditingController();

  var absecuretext = false.obs;
  var absecureotp = false.obs;
  var loading = false.obs;
}
