import 'dart:convert';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/Screens/ContactUs/ContactUsController.dart';
import 'package:dail_box/Screens/CreatePassword/CreatePasswordController.dart';
import 'package:dail_box/Screens/ForgotPassword/ForgotPasswordController.dart';
import 'package:dail_box/Screens/MessageDetails/MessageDetailsController.dart';
import 'package:dail_box/Screens/OtpCodeVarification/PhoneVarificationController.dart';
import 'package:dail_box/Screens/OtpCodeVarification/phone_verification.dart';
import 'package:dail_box/Screens/Profile/AnotherProfileController.dart';
import 'package:dail_box/Screens/Profile/EditProfileController.dart';
import 'package:dail_box/Screens/Profile/ProfileController.dart';
import 'package:dail_box/Screens/Profile/profile.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingsController.dart';
import 'package:dail_box/Screens/SearchDetail/SearchDetailsController.dart';
import 'package:dail_box/Screens/SignIn/SignInController.dart';
import 'package:dail_box/Screens/SignUp/SignUpController.dart';
import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/Screens/CreatePassword/create_password.dart';
import 'package:dail_box/Screens/SignIn/sign_in.dart';
import 'package:dail_box/Screens/ViewAllRating/ViewAllRatingsController.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/ChatBoxController.dart';
import 'package:dail_box/Screens/bottomNav/Gourment/GovernmentController.dart';
import 'package:dail_box/Screens/bottomNav/Message/MessageController.dart';
import 'package:dail_box/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'BaseUtils.dart';
import 'SnackBarUtils.dart';

String firebaseToken = 'empty';

class ApiUtils {
  static final String regsiter = '/regsiter';
  static final String login = '/login';
  static final String sociallogin = '/sociallogin';
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
  static final String myProfileImage = '/myProfileImage';
  static final String editMyProfile = '/editMyProfile';
  static final String getproduct = '/getproduct';
  static final String giveproductrate = '/giveproductrate';
  static final String getproductallreview = '/getproductallreview';
  static final String getservice = '/getservice';
  static final String getserviceallreview = '/getserviceallreview';
  static final String giveservicerate = '/giveservicerate';
  static final String myActivity = '/myActivity';
  static final String sortDiscussionform = '/sortDiscussionform';
  static final String searchDiscussionform = '/searchDiscussionform';
  static final String getFAQ = '/getFAQ';
  static final String removeFAQ = '/removeFAQ';
  static final String updateFAQ = '/updateFAQ';
  static final String getbussniesname = '/getbussniesname';
  static final String getlistingallrating = '/getlistingallrating';
  static final String userprofile = '/getuserprofiledetails';
  static final String userActivity = '/userActivity';
  static final String getUserbusinesslist = '/getUserbusinesslist';
  static final String userAccomplishments = '/userAccomplishments';
  static final String userAccomplishmentsEdit = '/userAccomplishmentsEdit';
  static final String userAccomplishmentsRemove = '/userAccomplishmentsRemove';
  static final String userSkills = '/userSkills';
  static final String userSkillsEdit = '/userSkillsEdit';
  static final String userSkillsRemove = '/userSkillsRemove';
  static final String userVolunteering = '/userVolunteering';
  static final String userVolunteeringEdit = '/userVolunteeringEdit';
  static final String userVolunteeringRemove = '/userVolunteeringRemove';
  static final String userEducation = '/userEducation';
  static final String userEducationEdit = '/userVolunteeringEdit';
  static final String userEducationRemove = '/userEducationRemove';
  static final String userExperience = '/userExperience';
  static final String userExperienceEdit = '/userExperienceEdit';
  static final String userExperienceRemove = '/userExperienceRemove';
  static final String reportListing = '/reportListing';
  static final String forgetpasswordmobile = '/forgetpasswordmobile';
  static final String checkmynumber = '/checkmynumber';
  static final String editMySocialProfile = '/editMySocialProfile';
  static final String logout = '/logout';

  static Future loginApi(SignInController controller) async {
    //http://dailboxx.websitescare.com/Alphaapis/login?code=DAILBOXX-03448567673
    var url = Uri.parse('$baseUrl$login$secretCodeString');
    printlog('$firebaseToken');
    printlog('$device_type');
    try {
      var responce = await http.post(
        url,
        body: {
          'userinfo': controller.emailCon.text.trim(),
          'password': controller.passwordCon.text.trim(),
          'device_token': firebaseToken,
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
        storage.write('social', 'false');
        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(HomeScreen());
        });
      } else {
        if (data['message'] == 'Please verify your account'.tr) {
          snackBarFailer(data['message']);
          Future.delayed(Duration(seconds: 2), () {
            Get.to(PhoneVerification(
              email: controller.emailCon.text,
            ));
          });
        } else {
          snackBarFailer(data['message']);
        }
      }
    } catch (e) {}
  }

  static Future socialloginApi(
      {SignInController? controller, Map? mapData}) async {
    //http://dailboxx.websitescare.com/Alphaapis/login?code=DAILBOXX-03448567673
    var url = Uri.parse('$baseUrl$sociallogin$secretCodeString');
    try {
      var responce = await http.post(
        url,
        body: mapData,
      );
      var data = jsonDecode(responce.body);
      printlog('socialloginApi is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.loading.value = false;
      if (data['result'] == 'success') {
        GetStorage storage = GetStorage();
        Map mapdata = data;
        if (mapdata.containsKey('userId')) {
          printlog('user id is = ${'${data['userId']}'}');
          storage.write('userId', '${data['userId']}');
        } else {
          printlog('user id is = ${'${data['data']['userId']}'}');
          storage.write('userId', '${data['data']['userId']}');
        }
        snackBarSuccess(data['message']);
        storage.write('email', '${data['data']['email']}');
        storage.write('name', '${data['data']['name']}');
        storage.write('f_name', '${data['data']['f_name']}');
        storage.write('l_name', '${data['data']['l_name']}');
        storage.write('profile_image', '${data['data']['profile_image']}');
        storage.write('social', 'true');
        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(HomeScreen());
        });
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future socialloginApis(
      {SignUpController? controller, Map? mapData}) async {
    //http://dailboxx.websitescare.com/Alphaapis/login?code=DAILBOXX-03448567673
    var url = Uri.parse('$baseUrl$sociallogin$secretCodeString');
    try {
      var responce = await http.post(
        url,
        body: mapData,
      );
      var data = jsonDecode(responce.body);
      printlog('socialloginApi is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.loading.value = false;
      if (data['result'] == 'success') {
        GetStorage storage = GetStorage();
        Map mapdata = data;
        if (mapdata.containsKey('userId')) {
          printlog('user id is = ${'${data['userId']}'}');
          storage.write('userId', '${data['userId']}');
        } else {
          printlog('user id is = ${'${data['data']['userId']}'}');
          storage.write('userId', '${data['data']['userId']}');
        }
        snackBarSuccess(data['message']);
        storage.write('email', '${data['data']['email']}');
        storage.write('name', '${data['data']['name']}');
        storage.write('f_name', '${data['data']['f_name']}');
        storage.write('l_name', '${data['data']['l_name']}');
        storage.write('profile_image', '${data['data']['profile_image']}');
        storage.write('social', 'true');
        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(HomeScreen());
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
          'f_name': controller.fNameCon.text.trim(),
          'l_name': controller.lNameCon.text.trim(),
          'email': controller.emailCon.text.isEmpty
              ? '${controller.phoneCon.text}@dialboxx.pk'
              : controller.emailCon.text.trim(),
          'mobile': controller.phoneCon.text.trim(),
          'password': controller.passwordCon.text.trim(),
        },
      );
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        snackBarSuccess(data['message']);
        Future.delayed(Duration(seconds: 2), () {
          Get.to(PhoneVerification(
            email: controller.phoneCon.text,
          ));
        });
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future verifyotpApi(
      PhoneVarificationController controller, String userinfo) async {
    var url = Uri.parse('$baseUrl$verifyotpphone$secretCodeString');
    try {
      var responce = await http.post(
        url,
        body: {'userinfo': userinfo, 'userotp': controller.codeCon.text},
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
    var url = Uri.parse(
        '$baseUrl${controller.emailCon.text.isEmail ? forgetpassword : forgetpasswordmobile}$secretCodeString');
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
          Get.to(CreatePassword(
            fromPhone: controller.emailCon.text.isEmail ? false : true,
          ));
        });
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

//https://dialboxx.pk/Alphaapis/verifyotpphone?code=DAILBOXX-03448567673
  static Future getverifyotp(
      {CreatePasswordController? controller, bool? fromPhone}) async {
    //http://dailboxx.websitescare.com/Alphaapis/forgetpassword?code=DAILBOXX-03448567673
    CreatePasswordController c = Get.find<CreatePasswordController>();
    ForgotPasswordController c2 = Get.find<ForgotPasswordController>();
    var url = Uri.parse(
        '$baseUrl${fromPhone! ? verifyotpphone : verifyotp}$secretCodeString');
    print('${c2.emailCon.text}${c.otpCon.text}${c.p1Con.text}');
    try {
      var responce = await http.post(
        url,
        body: {
          'userinfo': c2.emailCon.text.trim(),
          'userotp': c.otpCon.text.trim(),
          'password': c.p1Con.text.trim()
        },
      );
      c.loading.value = false;
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.loading.value = false;
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
      controller!.loading.value = true;
    } catch (e) {}
  }

  static Future getgetDiscussionform({ChatBoxController? controller}) async {
    var url = Uri.parse('$baseUrl$getDiscussionform$secretCodeString');
    GetStorage storage = GetStorage();
    try {
      var responce =
          await http.post(url, body: {'user_id': storage.read('userId')});
      var data = jsonDecode(responce.body);
      printlog('getgetDiscussionform data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.loadmainList.value = true;
      if (data['result'] == 'success') {
        controller.listofChatBox.value = [];
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

  static Future getgetAllMyMessages({bool? isLoad = true}) async {
    var url = Uri.parse('$baseUrl$getAllMyMessages$secretCodeString');
    var controller = Get.find<MessageController>();
    GetStorage storage = GetStorage();
    print('${storage.read('userId')}');
    try {
      var responce =
          await http.post(url, body: {'userid': storage.read('userId')});
      var data = jsonDecode(responce.body);
      printlog('getgetAllMyMessages list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (isLoad!) {
        controller.load.value = true;
      }
      if (data['result'] == 'success') {
        controller.listofMessages.value = data['data'];
        controller.loadmessage.value = true;
      } else {
        controller.listofMessages.value = [];
        controller.loadmessage.value = true;
      }
      if (isLoad) {
        Future.delayed(Duration(milliseconds: 30), () {
          controller.load.value = false;
        });
      }
    } catch (e) {}
  }

  static Future<List> getgetAllMyMessagesunseen({String? post_id}) async {
    var url = Uri.parse('$baseUrl$getAllMyMessages$secretCodeString');
    List value = [];
    GetStorage storage = GetStorage();
    print('${storage.read('userId')}');
    try {
      var responce = await http.post(url,
          body: {'userid': storage.read('userId'), 'post_id': post_id});
      var data = jsonDecode(responce.body);
      printlog('getgetAllMyMessagesunseen list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        value = data['data'];
      } else {
        value = [];
      }
    } catch (e) {}
    return value;
  }

  //http://dailboxx.websitescare.com/Alphaapis/getChatOneToOne?code=DAILBOXX-03448567673

  static Future getgetChatOneToOne(
      String incommingId, String businessID, String randomId) async {
    var url = Uri.parse('$baseUrl$getChatOneToOne$secretCodeString');
    var controller = Get.find<MessageDetailsController>();
    GetStorage storage = GetStorage();
    try {
      var responce = await http.post(url, body: {
        'userid': storage.read('userId'),
        'incoming_id': incommingId,
        'post_id': "$businessID",
        'random_id': '$randomId'
      });
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
      {String? incommingId,
      String? message,
      String? post_id,
      String? random_id}) async {
    var url = Uri.parse('$baseUrl$getChatOneToOneSave$secretCodeString');
    GetStorage storage = GetStorage();
    try {
      var responce = await http.post(url, body: {
        'userid': storage.read('userId'),
        'incoming_id': '$incommingId',
        'message': message,
        'post_id': '$post_id',
        'random_id': '$random_id'
      });
      var data = jsonDecode(responce.body);
      printlog('getgetChatOneToOne list is  = $data');
      printlog('data is = ${responce.statusCode}');
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/myActivity?code=DAILBOXX-03448567673
  static Future getgetDiscussionformprofile(
      {ProfileController? controller}) async {
    var url = Uri.parse('$baseUrl$myActivity$secretCodeString');
    GetStorage storage = GetStorage();
    try {
      var responce =
          await http.post(url, body: {'user_id': storage.read('userId')});
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.loadmainList.value = true;
      if (data['result'] == 'success') {
        controller.listofChatBox.clear();
        controller.listofChatBox.value = data['data'] ?? [];
        print('list data = ${controller.listofChatBox}');
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  //  //http://dailboxx.websitescare.com/Alphaapis/editMyProfile?code=DAILBOXX-03448567673

  static Future geteditMyProfile({EditProfileController? controller}) async {
    var url = Uri.parse('$baseUrl$editMyProfile$secretCodeString');
    GetStorage storage = GetStorage();
    print('call api${storage.read('email')}');
    try {
      var responce = await http.post(url, body: {
        'userId': storage.read('userId'),
        'mobile': controller!.phoneCon.text,
        'password': controller.p2Con.text,
        'email': storage.read('email') ?? '',
      });
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        storage.write('mobile', '${controller.phoneCon.text}');
        Navigator.of(navigatorKey.currentContext!).pop();
        callProfile();
        snackBarSuccess('${data['message']}');
      } else {
        snackBarFailer('${data['message']}');
      }
    } catch (e) {}
  }

  static Future geteditMySocialProfile(
      {EditProfileController? controller}) async {
    var url = Uri.parse('$baseUrl$editMySocialProfile$secretCodeString');
    GetStorage storage = GetStorage();
    print('call api${storage.read('email')} ${controller!.phoneCon.text}');
    try {
      var responce = await http.post(url, body: {
        'userId': storage.read('userId'),
        'mobile': controller.phoneCon.text,
        'email': storage.read('email') ?? '',
      });
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        storage.write('mobile', '${controller.phoneCon.text}');
        Navigator.of(navigatorKey.currentContext!).pop();
        callProfile();
        snackBarSuccess('${data['message']}');
      } else {
        snackBarFailer('${data['message']}');
      }
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/getproduct?code=DAILBOXX-03448567673

  static Future getgetproduct(
      {SearchDetailsController? controller, String? id}) async {
    var url = Uri.parse('$baseUrl$getproduct$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'productid': id,
      });
      var data = jsonDecode(responce.body);
      printlog('getgetproduct data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.listofData.value = data['data'] ?? [];
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/giveproductrate?code=DAILBOXX-03448567673

  static Future getgiveproductrate(
      {String? product_id,
      String? product_rating,
      String? product_review}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$giveproductrate$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'product_id': '$product_id',
        'user_id': storage.read('userId'),
        'product_rating': '$product_rating',
        'product_review': '$product_review',
      });
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        snackBarSuccess(data['message']);
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

//http://dailboxx.websitescare.com/Alphaapis/getproductallreview?code=DAILBOXX-03448567673
  static Future getgetproductallreview(
      {SearchDetailsController? controller, String? id}) async {
    var url = Uri.parse('$baseUrl$getproductallreview$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'productid': id,
      });
      var data = jsonDecode(responce.body);
      printlog('getgetproductallreview is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.listofReview.value = data['data'] ?? [];
    } catch (e) {}
  }

//http://dailboxx.websitescare.com/Alphaapis/getservice?code=DAILBOXX-03448567673

  static Future getgetservice(
      {SearchDetailsController? controller, String? id}) async {
    var url = Uri.parse('$baseUrl$getservice$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'serviceid': id,
      });
      var data = jsonDecode(responce.body);
      printlog('getgetservice is = $data');
      printlog('data is = ${responce.statusCode}');
      // controller!.listofData.value = data['data'] ?? [];
      controller!.listofForService.value = data['data'] ?? [];
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/getserviceallreview?code=DAILBOXX-03448567673

  static Future getgetserviceallreview(
      {SearchDetailsController? controller, String? id}) async {
    var url = Uri.parse('$baseUrl$getserviceallreview$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'serviceid': id,
      });
      var data = jsonDecode(responce.body);
      printlog('getgetserviceallreview is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.listofReview.value = data['data'] ?? [];
    } catch (e) {}
  }

//http://dailboxx.websitescare.com/Alphaapis/giveservicerate?code=DAILBOXX-03448567673
  static Future getgiveservicerate(
      {String? product_id,
      String? product_rating,
      String? product_review}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$giveservicerate$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'service_id': '$product_id',
        'user_id': storage.read('userId'),
        'service_rating': '$product_rating',
        'service_review': '$product_review',
      });
      var data = jsonDecode(responce.body);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        snackBarSuccess(data['message']);
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getsortDiscussionform(
      {String? main_cat_id,
      String? sub_cat_id,
      ChatBoxController? controller}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$sortDiscussionform$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'main_cat_id': '$main_cat_id',
        'user_id': storage.read('userId'),
        'sub_cat_id': '$sub_cat_id',
      });
      var data = jsonDecode(responce.body);
      printlog('getsortDiscussionform is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofChatBox.clear();
        controller.listofChatBox.value = data['data'] ?? [];
      } else {
        controller!.listofChatBox.value = [];
      }
      controller.loadmainList.value = true;
    } catch (e) {}
  }

  static Future getsearchDiscussionform(
      {ChatBoxController? controller, String? search}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$searchDiscussionform$secretCodeString');
    print('search keyword = $search');
    try {
      var responce = await http.post(url, body: {
        'search': '$search',
        'user_id': storage.read('userId'),
      });
      var data = jsonDecode(responce.body);
      printlog('getsearchDiscussionform is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofChatBox.value = [];
        controller.listofChatBox.value = data['data'] ?? [];
      } else {
        controller!.listofChatBox.value = [];
      }
      controller.loadmainList.value = true;
    } catch (e) {}
  }

  static Future getgetFAQ(
      {RecentListnigsController? controller, String? id}) async {
    var url = Uri.parse('$baseUrl$getFAQ$secretCodeString');
    print('id is = $id');
    try {
      var responce = await http.post(url, body: {
        'b_id': id,
      });
      var data = jsonDecode(responce.body);
      printlog('getgetFAQ is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofFaq.value = data['data'];
      }
    } catch (e) {}
  }

  static Future getremoveFAQ({
    RecentListnigsController? controller,
    String? b_id,
    String? faq_id,
    int? index,
  }) async {
    var url = Uri.parse('$baseUrl$removeFAQ$secretCodeString');
    try {
      var responce =
          await http.post(url, body: {'b_id': b_id, 'faq_id': faq_id});
      var data = jsonDecode(responce.body);
      printlog('getgetFAQ is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofFaq.removeAt(index!);
      }
    } catch (e) {}
  }

  static Future getupdateFAQ({
    RecentListnigsController? controller,
    String? b_id,
    List? faq_id,
    int? index,
  }) async {
    var url = Uri.parse('$baseUrl$updateFAQ$secretCodeString');
    try {
      var responce = await http
          .post(url, body: {'faqs_id': jsonEncode(b_id), 'b_id': b_id});
      var data = jsonDecode(responce.body);
      printlog('getgetFAQ is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {}
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/getbussniesname?code=DAILBOXX-03448567673
  static Future getgetbussniesname({
    SearchDetailsController? controller,
    String? b_id,
  }) async {
    print('b_id = $b_id');
    var url = Uri.parse('$baseUrl$getbussniesname$secretCodeString');
    try {
      var responce = await http.post(url, body: {'b_id': b_id});
      var data = jsonDecode(responce.body);
      printlog('getgetbussniesname is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.nameofBuiseness.value = data['data'][0]['business_name'];
        controller.userId.value = data['data'][0]['user_id'];
        controller.listAllData.value = data['data'];
      }
    } catch (e) {}
  }

//http://dailboxx.websitescare.com/Alphaapis/getlistingallrating?code=DAILBOXX-03448567673
  static Future getgetlistingallrating({
    ViewAllRatingsController? controller,
    String? b_id,
  }) async {
    print('b_id = $b_id');
    var url = Uri.parse('$baseUrl$getlistingallrating$secretCodeString');
    try {
      var responce = await http.post(url, body: {'listingallrate': b_id});
      var data = jsonDecode(responce.body);
      printlog('getgetlistingallrating is = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.isloadings.value = true;
      if (data['result'] == 'success') {
        controller.listofAllRatings.value = data['data'];
      }
    } catch (e) {}
  }

  static Future getuserprofile({
    AnotherProfileController? controller,
    String? user_id,
  }) async {
    print('b_id = $user_id');
    var url = Uri.parse('$baseUrl$userprofile$secretCodeString');
    try {
      var responce = await http.post(url, body: {'user_id': user_id});
      var data = jsonDecode(responce.body);
      printlog('getuserprofile is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.profileData.value = data['data'];
      }
    } catch (e) {}
  }

  static Future getmyuserprofile({
    ProfileController? controller,
    String? user_id,
  }) async {
    print('b_id = $user_id');
    var url = Uri.parse('$baseUrl$userprofile$secretCodeString');
    try {
      var responce = await http.post(url, body: {'user_id': user_id});
      var data = jsonDecode(responce.body);
      printlog('getuserprofile is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.profileData.value = data['data'];
        controller.experience.value = data['data']['experience'] ?? [];
        controller.listofAccomplishment.value =
            data['data']['accomplishments'] ?? [];
        controller.Skills.value = data['data']['skills'] ?? [];
        controller.experience.value = data['data']['experience'] ?? [];
        controller.education.value = data['data']['education'] ?? [];
        controller.userVolunteering.value = data['data']['volunteering'] ?? [];
      }
    } catch (e) {}
  }

  static Future getuserActivity({
    AnotherProfileController? controller,
    String? user_id,
  }) async {
    print('b_id = $user_id');
    var url = Uri.parse('$baseUrl$userActivity$secretCodeString');
    try {
      var responce = await http.post(url, body: {'user_id': user_id});
      var data = jsonDecode(responce.body);
      printlog('userActivity is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.userActivity.value = data['data'] ?? [];
      }
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/getUserbusinesslist?code=DAILBOXX-03448567673
  static Future getgetUserbusinesslist({
    AnotherProfileController? controller,
    String? user_id,
  }) async {
    print('b_id = $user_id');
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$getUserbusinesslist$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'user_id': '${storage.read('userId')}',
        'post_id': '$user_id'
      });
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofListings.value = data['data'] ?? [];
      }
    } catch (e) {}
  }

  static Future getuserAccomplishments({
    ProfileController? controller,
    String? detail,
  }) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userAccomplishments$secretCodeString');
    try {
      var responce = await http.post(url,
          body: {'user_id': '${storage.read('userId')}', 'details': '$detail'});
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofAccomplishment
            .add({'details': '$detail', 'id': '$data'});
      }
    } catch (e) {}
  }

  static Future getuserAccomplishmentsEdit(
      {ProfileController? controller,
      String? detail,
      String? id,
      int? index}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userAccomplishmentsEdit$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'user_id': '${storage.read('userId')}',
        'details': '$detail',
        'accomplishments_id': '$id'
      });
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofAccomplishment[index!] = {
          'details': '$detail',
          'id': '$id'
        };
      }
    } catch (e) {}
  }

  static Future getuserAccomplishmentsRemove({
    ProfileController? controller,
    String? id,
  }) async {
    var url = Uri.parse('$baseUrl$userAccomplishmentsRemove$secretCodeString');
    try {
      var responce = await http.post(url, body: {'accomplishments_id': '$id'});
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
    } catch (e) {}
  }

  static Future getuserSkills({
    ProfileController? controller,
    String? detail,
  }) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userSkills$secretCodeString');
    try {
      var responce = await http.post(url,
          body: {'user_id': '${storage.read('userId')}', 'skills': '$detail'});
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.Skills.add({'skills': '$detail', 'id': '$data'});
      }
    } catch (e) {}
  }

  static Future getuserSkillsEdit(
      {ProfileController? controller,
      String? detail,
      String? id,
      int? index}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userSkillsEdit$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'user_id': '${storage.read('userId')}',
        'skills': '$detail',
        'skl_id': '$id'
      });
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.Skills[index!] = {'skills': '$detail', 'id': '$id'};
      }
    } catch (e) {}
  }

  static Future getuserSkillsRemove({
    ProfileController? controller,
    String? id,
  }) async {
    var url = Uri.parse('$baseUrl$userSkillsRemove$secretCodeString');
    try {
      var responce = await http.post(url, body: {'skl_id': '$id'});
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
    } catch (e) {}
  }

  static Future getuserVolunteering({
    ProfileController? controller,
    String? detail,
  }) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userVolunteering$secretCodeString');
    try {
      var responce = await http.post(url,
          body: {'user_id': '${storage.read('userId')}', 'details': '$detail'});
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.userVolunteering.add({'details': '$detail', 'id': '$data'});
      }
    } catch (e) {}
  }

  static Future getuserVolunteeringEdit(
      {ProfileController? controller,
      String? detail,
      String? id,
      int? index}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userVolunteeringEdit$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'user_id': '${storage.read('userId')}',
        'details': '$detail',
        'vlt_id': '$id'
      });
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.userVolunteering[index!] = {
          'details': '$detail',
          'id': '$id'
        };
      }
    } catch (e) {}
  }

  static Future getuserVolunteeringRemove({
    ProfileController? controller,
    String? id,
  }) async {
    var url = Uri.parse('$baseUrl$userVolunteeringRemove$secretCodeString');
    try {
      var responce = await http.post(url, body: {'vlt_id': '$id'});
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
    } catch (e) {}
  }

  static Future getuserExperience(
      {ProfileController? controller,
      String? school_name,
      String? degree_type,
      String? start_end}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userExperience$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'user_id': '${storage.read('userId')}',
        'position': '$school_name',
        'company_name': '$degree_type',
        'time_duration': '$start_end'
      });
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.experience.add({
          "id": "${data['data']}",
          "position": '$school_name',
          "company_name": '$degree_type',
          "time_duration": '$start_end'
        });
      }
    } catch (e) {}
  }

  static Future getuserExperienceEdit(
      {ProfileController? controller,
      String? school_name,
      String? degree_type,
      String? start_end,
      String? id,
      int? index}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userExperienceEdit$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'user_id': '${storage.read('userId')}',
        'position': '$school_name',
        'company_name': '$degree_type',
        'time_duration': '$start_end',
        'exp_id': '$id'
      });
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.experience[index!] = {
          "id": "$id",
          "position": '$school_name',
          "company_name": '$degree_type',
          "time_duration": '$start_end'
        };
      }
    } catch (e) {}
  }

  static Future getuserExperienceRemove({
    ProfileController? controller,
    String? id,
  }) async {
    var url = Uri.parse('$baseUrl$userExperienceRemove$secretCodeString');
    try {
      var responce = await http.post(url, body: {'exp_id': '$id'});
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
    } catch (e) {}
  }

  static Future getuserEducation(
      {ProfileController? controller,
      String? school_name,
      String? degree_type,
      String? start_end}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userEducation$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'user_id': '${storage.read('userId')}',
        'school_name': '$school_name',
        'degree_type': '$degree_type',
        'start_end': '$start_end'
      });
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.education.add({
          "id": "${data['data']}",
          "school_name": '$school_name',
          "degree_type": '$degree_type',
          "start_end": '$start_end'
        });
      }
    } catch (e) {}
  }

  static Future getuserEducationEdit(
      {ProfileController? controller,
      String? school_name,
      String? degree_type,
      String? start_end,
      String? id,
      int? index}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$userEducationEdit$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'user_id': '${storage.read('userId')}',
        'school_name': '$school_name',
        'degree_type': '$degree_type',
        'start_end': '$start_end',
        'exp_id': '$id'
      });
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.education[index!] = {
          "id": "$id",
          "school_name": '$school_name',
          "degree_type": '$degree_type',
          "start_end": '$start_end'
        };
      }
    } catch (e) {}
  }

  static Future getuserEducationRemove({
    ProfileController? controller,
    String? id,
  }) async {
    var url = Uri.parse('$baseUrl$userEducationRemove$secretCodeString');
    try {
      var responce = await http.post(url, body: {'edu_id': '$id'});
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
    } catch (e) {}
  }

  static Future getreportListing({String? b_id, String? message}) async {
    var url = Uri.parse('$baseUrl$reportListing$secretCodeString');
    GetStorage storage = GetStorage();
    try {
      var responce = await http.post(url, body: {
        'user_id': '${storage.read('userId')}',
        'b_id': '$b_id',
        'report_comments': '$message'
      });
      var data = jsonDecode(responce.body);
      printlog('getUserbusinesslist is = $data');
      printlog('data is = ${responce.statusCode}');
      snackBarSuccess('${data['message']}');
    } catch (e) {}
  }

//https://dialboxx.pk/Alphaapis/reportListing?code=DAILBOXX-03448567673

  static Future<bool> getcheckmynumber({String? number}) async {
    var url = Uri.parse('$baseUrl$checkmynumber$secretCodeString');
    bool? result;
    try {
      var responce = await http.post(url, body: {'mobile': '$number'});
      var data = jsonDecode(responce.body);
      printlog('getcheckmynumber is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        result = true;
      } else {
        snackBarFailer('${data['message']}');
        result = false;
      }
    } catch (e) {}
    return result!;
  }

  static Future getlogout() async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$logout$secretCodeString');
    print('userId = ${storage.read('userId')}');
    try {
      var responce =
          await http.post(url, body: {'userid': '${storage.read('userId')}'});
      var data = jsonDecode(responce.body);
      printlog('logout is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {}
    } catch (e) {}
  }
}
