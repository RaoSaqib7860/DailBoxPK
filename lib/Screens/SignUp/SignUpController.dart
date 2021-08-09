import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController fNameCon = TextEditingController();
  TextEditingController lNameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController confirmPasswordCon = TextEditingController();

  var obsecurefirst = true.obs;
  var obsecuresecond = true.obs;
  var loading = false.obs;
}
