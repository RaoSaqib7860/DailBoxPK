import 'dart:convert';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/Screens/ContactUs/ContactUsController.dart';
import 'package:dail_box/Screens/CreatePassword/CreatePasswordController.dart';
import 'package:dail_box/Screens/ForgotPassword/ForgotPasswordController.dart';
import 'package:dail_box/Screens/MessageDetails/MessageDetailsController.dart';
import 'package:dail_box/Screens/OtpCodeVarification/PhoneVarificationController.dart';
import 'package:dail_box/Screens/OtpCodeVarification/phone_verification.dart';
import 'package:dail_box/Screens/SignIn/SignInController.dart';
import 'package:dail_box/Screens/SignUp/SignUpController.dart';
import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/Screens/CreatePassword/create_password.dart';
import 'package:dail_box/Screens/SignIn/sign_in.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/ChatBoxController.dart';
import 'package:dail_box/Screens/bottomNav/Gourment/GovernmentController.dart';
import 'package:dail_box/Screens/bottomNav/Message/MessageController.dart';
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
  static final String contactUs = '/contactUs';
  static final String getgovdept = '/getgovdept';
  static final String getDiscussionform = '/getDiscussionform';
  static final String totalCommentform = '/totalCommentform';
  static final String totalLikeform = '/totalLikeform';
  static final String postDiscussionform = '/postDiscussionform';
  static final String getmainindurty = '/getmainindurty';
  static final String getMainCatapp = '/getMainCatapp';
  static final String getmybusinesslist = '/getmybusinesslist';
  static final String getAllMyMessages = '/getAllMyMessages';
  static final String getChatOneToOne = '/getChatOneToOne';
  static final String getChatOneToOneSave = '/getChatOneToOneSave';

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
        storage.write('profile_image', '${data['data']['profile_image']}');
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
        body: {'email': controller.emailCon.text},
      );
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        snackBarSuccess(data['message']);
        Future.delayed(Duration(seconds: 2), () {
          Get.to(CreatePassword());
        });
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getverifyotp({CreatePasswordController? controller}) async {
    //http://dailboxx.websitescare.com/Alphaapis/forgetpassword?code=DAILBOXX-03448567673
    CreatePasswordController c = Get.find<CreatePasswordController>();
    ForgotPasswordController c2 = Get.find<ForgotPasswordController>();
    var url = Uri.parse('$baseUrl$verifyotp$secretCodeString');
    print('${c2.emailCon.text}${c.otpCon.text}${c.p1Con.text}');
    try {
      var responce = await http.post(
        url,
        body: {
          'userinfo': c2.emailCon.text,
          'userotp': c.otpCon.text,
          'password': c.p1Con.text
        },
      );
      c.loading.value = false;
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.loading.value = false;
      if (data['result'] == 'success') {
        snackBarSuccess(data['message']);
        Get.offAll(SignIn());
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getcontactUs({ContactUsController? controller}) async {
    var url = Uri.parse('$baseUrl$contactUs$secretCodeString');
    try {
      var responce = await http.post(
        url,
        body: {
          'completename': controller!.nameCon.text,
          'email': controller.emailCon.text,
          'phone': controller.phoneCon.text,
          'message': controller.messageCon.text,
        },
      );
      controller.loading.value = false;
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        snackBarSuccess(data['message']);
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getgetgovdept({GovernmentController? controller}) async {
    var url = Uri.parse('$baseUrl$getgovdept$secretCodeString');
    try {
      var responce = await http.get(
        url,
      );
      var data = jsonDecode(responce.body);
      printlog('getgetgovdept is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listGovernment.value = data['data'];
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getgetDiscussionform({ChatBoxController? controller}) async {
    //http://dailboxx.websitescare.com/Alphaapis/getDiscussionform?code=DAILBOXX-03448567673
    var url = Uri.parse('$baseUrl$getDiscussionform$secretCodeString');
    try {
      var responce = await http.get(
        url,
      );
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofChatBox.clear();
        controller.listofChatBox.value = data['data'] ?? [];
        controller.loadmainList.value = true;
        print('list data = ${controller.listofChatBox}');
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future<List> gettotalCommentform(
      {ChatBoxController? controller, String? id}) async {
    //http://dailboxx.websitescare.com/Alphaapis/totalCommentform?code=DAILBOXX-03448567673
    List list = [];
    var url = Uri.parse('$baseUrl$totalCommentform$secretCodeString');
    try {
      var responce = await http.post(url, body: {'form_id': id!});
      var data = jsonDecode(responce.body);
      printlog('comment data is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        list = data['data'];
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
    return list;
  }

  static Future<List> gettotalLikeform(
      {ChatBoxController? controller, String? id}) async {
    List list = [];
    var url = Uri.parse('$baseUrl$totalLikeform$secretCodeString');
    try {
      var responce = await http.post(url, body: {'form_id': id!});
      var data = jsonDecode(responce.body);
      printlog('like data is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        list = data['data'];
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
    return list;
  }

  static Future getgetpackges() async {
    var url = Uri.parse('$baseUrl$getmainindurty$secretCodeString');
    var controller = Get.find<ChatBoxController>();
    try {
      var responce = await http.get(url);
      var data = jsonDecode(responce.body);
      printlog('getgetmainindurty list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofIndustry.value = data['data'];
        controller.listofIndustrytwo.value = data['data'];
      } else {}
    } catch (e) {}
  }

  static Future getgetMainCatapp(String id) async {
    printlog('main id =$id');
    var url = Uri.parse('$baseUrl$getMainCatapp$secretCodeString');
    var controller = Get.find<ChatBoxController>();
    try {
      var responce = await http.post(url, body: {'main_id': id});
      var data = jsonDecode(responce.body);
      printlog('getgetMainCatapp list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofCat.value = data['data'];
      } else {}
    } catch (e) {}
  }

  static Future getgetMainCatapptwo(String id) async {
    printlog('main id =$id');
    var url = Uri.parse('$baseUrl$getMainCatapp$secretCodeString');
    var controller = Get.find<ChatBoxController>();
    try {
      var responce = await http.post(url, body: {'main_id': id});
      var data = jsonDecode(responce.body);
      printlog('getgetMainCatapp list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofCattwo.value = data['data'];
      } else {}
    } catch (e) {}
  }

  static Future getgetmybusinesslist() async {
    var url = Uri.parse('$baseUrl$getmybusinesslist$secretCodeString');
    var controller = Get.find<ChatBoxController>();
    GetStorage storage = GetStorage();
    try {
      var responce =
          await http.post(url, body: {'userid': storage.read('userId')});
      var data = jsonDecode(responce.body);
      printlog('getgetmybusinesslist list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofbuisness.value = data['data'];
      } else {}
    } catch (e) {}
  }

  static Future getgetAllMyMessages() async {
    var url = Uri.parse('$baseUrl$getAllMyMessages$secretCodeString');
    var controller = Get.find<MessageController>();
    GetStorage storage = GetStorage();
    try {
      var responce =
          await http.post(url, body: {'userid': storage.read('userId')});
      var data = jsonDecode(responce.body);
      printlog('getgetAllMyMessages list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofMessages.value = data['data'];
        controller.loadmessage.value = true;
      } else {
        controller.loadmessage.value = true;
      }
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/getChatOneToOne?code=DAILBOXX-03448567673

  static Future getgetChatOneToOne(String incommingId) async {
    var url = Uri.parse('$baseUrl$getChatOneToOne$secretCodeString');
    var controller = Get.find<MessageDetailsController>();
    GetStorage storage = GetStorage();
    try {
      var responce = await http.post(url,
          body: {'userid': storage.read('userId'), 'incoming_id': incommingId});
      var data = jsonDecode(responce.body);
      printlog('getgetChatOneToOne list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofDealssms.value = data['data'];
        controller.loadData.value = true;
      } else {
        controller.loadData.value = true;
      }
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/totalLikeform?code=DAILBOXX-03448567673

  static Future getgetChatOneToOneSave(
      {String? incommingId, String? message}) async {
    var url = Uri.parse('$baseUrl$getChatOneToOneSave$secretCodeString');
    GetStorage storage = GetStorage();
    try {
      var responce = await http.post(url, body: {
        'userid': storage.read('userId'),
        'incoming_id': incommingId,
        'message': message
      });
      var data = jsonDecode(responce.body);
      printlog('getgetChatOneToOne list is  = $data');
      printlog('data is = ${responce.statusCode}');
    } catch (e) {}
  }
}
