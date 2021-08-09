import 'dart:convert';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/Screens/ForgotPassword/ForgotPasswordController.dart';
import 'package:dail_box/Screens/OtpCodeVarification/PhoneVarificationController.dart';
import 'package:dail_box/Screens/OtpCodeVarification/phone_verification.dart';
import 'package:dail_box/Screens/SignIn/SignInController.dart';
import 'package:dail_box/Screens/SignUp/SignUpController.dart';
import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/login/create_password.dart';
import 'package:dail_box/Screens/SignIn/sign_in.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'BaseUtils.dart';
import 'SnackBarUtils.dart';
 
class ApiUtils {

  static final String regsiter = '/regsiter';
  static final String login = '/login';
  static final String verifyotp = '/verifyotp';
  static final String verifyotpphone = '/verifyotpphone';
  static final String forgetpassword = '/forgetpassword';

  static Future loginApi(SignInController controller) async {
    //http://dailboxx.websitescare.com/Alphaapis/login?code=DAILBOXX-03448567673
    var url = Uri.parse('$baseUrl$login$secretCodeString');
    try {
      var responce = await http.post(
        url,
        body: {
          'userinfo': controller.emailCon.text,
          'password': controller.passwordCon.text,
          'device_token': '123456',
          'device_type': device_type
        },
      );
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        printlog('${data['data']['userId']}');
        GetStorage storage = GetStorage();
        snackBarSuccess(data['message']);
        storage.write('userId', '${data['data']['userId']}');
        storage.write('email', '${data['data']['email']}');
        storage.write('device_token', '${data['data']['device_token']}');
        storage.write('mobile', '${data['data']['mobile']}');
        storage.write('name', '${data['data']['name']}');
        storage.write('f_name', '${data['data']['f_name']}');
        storage.write('l_name', '${data['data']['l_name']}');
        Future.delayed(Duration(seconds: 2), () {
          Get.to(HomeScreen());
        });
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future signUpApi(SignUpController controller) async {
    var url = Uri.parse('$baseUrl$regsiter$secretCodeString');
    try {
      var responce = await http.post(
        url,
        body: {
          'f_name': controller.fNameCon.text,
          'l_name': controller.lNameCon.text,
          'email': controller.emailCon.text,
          'mobile': controller.phoneCon.text,
          'password': controller.phoneCon.text,
        },
      );
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        snackBarSuccess(data['message']);
        Future.delayed(Duration(seconds: 2), () {
          Get.to(PhoneVerification());
        });
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future verifyotpApi(PhoneVarificationController controller) async {
    SignUpController c = Get.find();
    var url = Uri.parse('$baseUrl$verifyotpphone$secretCodeString');
    try {
      var responce = await http.post(
        url,
        body: {'userinfo': c.phoneCon.text, 'userotp': controller.codeCon.text},
      );
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        snackBarSuccess(data['message']);
        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(SignIn());
        });
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future forgetpasswordApi(ForgotPasswordController controller) async {
    //http://dailboxx.websitescare.com/Alphaapis/forgetpassword?code=DAILBOXX-03448567673
    var url = Uri.parse('$baseUrl$forgetpassword$secretCodeString');
    try {
      var responce = await http.post(
        url,
        body: {'userinfo': controller.emailCon.text},
      );
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        snackBarSuccess(data['message']);
        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(CreatePassword());
        });
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }
}
