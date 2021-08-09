import 'package:get/get.dart';

snackBarFailer(String message) {
  Get.snackbar('Alert', message, barBlur: 15.0);
}
snackBarSuccess(String message) {
  Get.snackbar('Success', message, barBlur: 15.0);
}
