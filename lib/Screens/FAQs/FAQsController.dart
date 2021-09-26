import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQsController extends GetxController {
  var buisnessIDforProduct = 100.obs;
  var listofBuisness = [].obs;
  var selectBusinessHint = 'Select Business'.tr.obs;
  var selectBusinessid = 0.obs;
  var qusAnsMap = [].obs;

  var loading = false.obs;

  TextEditingController QusCon = TextEditingController();
  TextEditingController AnsCon = TextEditingController();
}
