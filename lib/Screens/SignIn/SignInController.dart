import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  var obsecure = false.obs;
  var loading = false.obs;
}
