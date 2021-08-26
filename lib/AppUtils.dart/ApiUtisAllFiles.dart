import 'dart:io';
import 'package:dail_box/Screens/AddProduct.dart/AddProductController.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/Screens/Profile/EditPost/EditPostController.dart';
import 'package:dail_box/Screens/Profile/EditProfileController.dart';
import 'package:dail_box/Screens/Profile/profile.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/ChatBoxController.dart';
import 'package:dail_box/Screens/bottomNav/Home/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import '../main.dart';
import 'APiUtilsForAuth.dart';
import 'ApiUtilsForAll.dart';
import 'BaseUtils.dart';
import 'LogsUtils.dart';
import 'SnackBarUtils.dart';

class ApiUtilsAllFiles extends ChangeNotifier {
  static Future gethomeproducts(
      AddProductController controller, String id) async {
    GetStorage storage = GetStorage();
    printlog('id is = $id');
    printlog('id is = ${storage.read('userId')}');
    FormData formData = FormData.fromMap({
      'b_id': id,
      'pname': controller.pNameCon.text,
      'pprice': controller.pPriceCon.text,
      'p_details': controller.pDetailsCon.text,
      'userid': storage.read('userId'),
      'pimage1': await MultipartFile.fromFile(controller.f1.value.path,
          filename: basename(controller.f1.value.path)),
      'pimage2': await MultipartFile.fromFile(controller.f2.value.path,
          filename: basename(controller.f2.value.path)),
      'pimage3': await MultipartFile.fromFile(controller.f2.value.path,
          filename: basename(controller.f2.value.path)),
    });
    try {
      var responce = await Dio().post(
          '$baseUrl${ApiUtilsForAll.addproduct}$secretCodeString',
          data: formData);
      var data = responce.data;
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data["result"] == "success") {
        Navigator.of(navigatorKey.currentContext!).pop();
        callHome();
        snackBarSuccess('Your product has been submitted for approval');
      } else {}
    } catch (e) {}
  }

  static Future getaddListing(BuisnessRegistrationController controller) async {
    GetStorage storage = GetStorage();
    printlog('id is = ${storage.read('userId')}');
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(controller.f1.value.path,
          filename: basename(controller.f1.value.path)),
      'package_id':
          '${controller.listofPackage[controller.currentPackageIndex.value]['id']}',
      'user_id': storage.read('userId'),
      'business_name': controller.businessName.text,
      'business_email': controller.businessEmail.text,
      'cell_number': controller.businessPhone.text,
      'landline_number': controller.businessLandline.text,
      'whatsapp_number': controller.businessWhatsApp.text,
      'p_v_store': controller.listofSV[controller.currentSVIndex.value],
      'business_address': controller.businessAddress.text,
      'city': controller.businessCity.text,
      'area': controller.businessArea.text,
      'web_url': controller.businessWebsiteUrl.text,
      'timings':
          'Mon:${controller.mon.value}\nus:${controller.tue.value}\nWed:${controller.wed.value}\nThr:${controller.thus.value}\nFri:${controller.fri.value}\nSat:${controller.sat.value}\nSun:${controller.sun.value}',
      'year_established': controller.Date.value,
      'num_employees': controller.businessNoOfEmployess.text,
      'facebook': controller.businessFb.text,
      'insta': controller.businessInsta.text,
      'youtube': controller.businessNoOfYoutube.text,
      'twitter': controller.businessTwitter.text,
      'service_areas': controller.businessServiceArea.text,
      'industry': controller
          .listofIndustry[controller.currentlistofIndustryIndex.value]['id'],
      'industry_cat':
          controller.listofCat[controller.currentlistofCatIndex.value]['id'],
      'industry_sub_cat': controller.listofSubCat.isNotEmpty
          ? controller.listofSubCat[controller.currentlistofSubCatIndex.value]
              ['id']
          : '',
      'keywords': controller.listOfKeyWord
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .toString(),
      'delivery_available': controller.listOfDeliveryAvailable[
          controller.currentListOfDeliveryAvailableIndex.value],
      'booking':
          controller.listOfBooking[controller.currentlistOfBookingIndex.value],
      'pick_up': controller.listpick_up[controller.currentpick_upIndex.value],
      'by_appointment': controller
          .listby_appointment[controller.currentby_appointmentIndex.value],
      'hear_about': controller.hearAboutController.text,
      'business_description': controller.businessDiscription.text,
      'agent_id': '22',
      'payment_mod': 'Cash'
    });
    printlog('calling api');
    try {
      var responce = await Dio().post(
          '$baseUrl${ApiUtilsForAll.addlisting}$secretCodeString',
          data: formData);
      var data = responce.data;
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      //controller.loading.value = false;
      if (data["result"] == "success") {
        snackBarSuccess('Your product has been submitted for approval');
        Navigator.of(navigatorKey.currentContext!).pop();
        Navigator.of(navigatorKey.currentContext!).pop();
        callHome();
      } else {}
    } catch (e) {}
  }

  static Future getpostDiscussionform(ChatBoxController controller) async {
    GetStorage storage = GetStorage();
    FormData formData;
    if (controller.isf1.value) {
      print('in image now');
      formData = FormData.fromMap({
        'business_id': controller
                .listofbuisness[controller.currentlistofbuisnessIndex.value]
            ['business_id'],
        'industry_id': controller.listofIndustrytwo[
            controller.currentlistofIndustryIndextwo.value]['id'],
        'industry_main_cat_id': controller
            .listofCattwo[controller.currentlistofCatIndextwo.value]['id'],
        'user_id': storage.read('userId'),
        'discussionform_text': controller.writeCommentCon.value.text,
        'fourm_image': await MultipartFile.fromFile(controller.f1.value.path,
            filename: basename(controller.f1.value.path)),
      });
    } else {
      formData = FormData.fromMap({
        'business_id': controller
                .listofbuisness[controller.currentlistofbuisnessIndex.value]
            ['business_id'],
        'industry_id': controller.listofIndustrytwo[
            controller.currentlistofIndustryIndextwo.value]['id'],
        'industry_main_cat_id': controller
            .listofCattwo[controller.currentlistofCatIndextwo.value]['id'],
        'user_id': storage.read('userId'),
        'discussionform_text': controller.writeCommentCon.value.text,
        'fourm_image': ''
      });
    }
    try {
      var responce = await Dio().post(
          '$baseUrl${ApiUtils.postDiscussionform}$secretCodeString',
          data: formData);
      var data = responce.data;
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      controller.loading.value = false;
      if (data["result"] == "success") {
        snackBarSuccess(data['message']);
      } else {
        snackBarSuccess('${data['message']}');
      }
    } catch (e) {}
  }

  static Future getmyProfileImage(File f1) async {
    GetStorage storage = GetStorage();
    FormData formData;
    formData = FormData.fromMap({
      'user_id': storage.read('userId'),
      'profile_image':
          await MultipartFile.fromFile(f1.path, filename: basename(f1.path)),
    });
    try {
      var responce = await Dio().post(
          '$baseUrl${ApiUtils.myProfileImage}$secretCodeString',
          data: formData);
      var data = responce.data;
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data["result"] == "success") {
        storage.write('profile_image', '/upload/profile/${data['data']}');
        snackBarSuccess(data['message']);
      } else {
        snackBarSuccess('${data['message']}');
      }
    } catch (e) {}
  }

  static Future getupdateDiscussionform(
      {Map? map, EditPostController? controller}) async {
    print('${controller!.textCon.text}');
    FormData formData;
    GetStorage storage = GetStorage();
    if (controller.isf1.value) {
      print('in image');
      formData = FormData.fromMap({
        'business_id': '${map!['business_id']}',
        'industry_id': '${map['industry_id']}',
        'industry_main_cat_id': '${map['industry_main_cat_id']}',
        'user_id': storage.read('userId'),
        'discussionform_text': controller.textCon.text,
        'fourm_image': await MultipartFile.fromFile(controller.f1.value.path,
            filename: basename(controller.f1.value.path)),
        'form_id': '${map['form_id']}',
        'image_url': ''
      });
    } else {
      formData = FormData.fromMap({
        'business_id': '${map!['business_id']}',
        'industry_id': '${map['industry_id']}',
        'industry_main_cat_id': '${map['industry_main_cat_id']}',
        'user_id': storage.read('userId'),
        'discussionform_text': controller.textCon.text,
        'fourm_image': '',
        'form_id': '${map['form_id']}',
        'image_url': '${map['fourm_image'] ?? ''}'
      });
    }
    try {
      var responce = await Dio().post(
          '$baseUrl${ApiUtilsForAll.updateDiscussionform}$secretCodeString',
          data: formData);
      var data = responce.data;
      printlog('getupdateDiscussionform list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        Navigator.of(navigatorKey.currentContext!).pop();
        callProfile();
      }
    } catch (e) {}
  }
}
