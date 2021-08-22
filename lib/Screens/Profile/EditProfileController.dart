import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditProfileController extends GetxController {
  TextEditingController p1Con = TextEditingController();
  TextEditingController p2Con = TextEditingController();
  TextEditingController phoneCon = TextEditingController();

  var absecuretextOne = false.obs;
  var absecuretextTwo = false.obs;
  var absecurephone = false.obs;
  var loading = false.obs;
}
