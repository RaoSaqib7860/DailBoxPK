import 'dart:convert';
import 'dart:io';
import 'package:dail_box/Screens/AddProduct.dart/AddProductController.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/Screens/Profile/EditPost/EditPostController.dart';
import 'package:dail_box/Screens/Profile/profile.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/ChatBoxController.dart';
import 'package:dail_box/Screens/bottomNav/Home/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
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
      'city':
          '${controller.listofCity[controller.currentlistofCityIndex.value]['city']}',
      'pimage1': await MultipartFile.fromFile(controller.f1.value.path,
          filename: basename(controller.f1.value.path)),
      'pimage2': !controller.isf2.value
          ? ''
          : await MultipartFile.fromFile(controller.f2.value.path,
              filename: basename(controller.f2.value.path)),
      'pimage3': !controller.isf3.value
          ? ''
          : await MultipartFile.fromFile(controller.f3.value.path,
              filename: basename(controller.f3.value.path)),
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
        snackBarSuccess('${data['message']}');
        callHome();
      } else {}
    } catch (e) {}
  }

  static Future getupdateProduct({
    AddProductController? controller,
    String? id,
    String? product_id,
    String? img1,
    String? img2,
    String? img3,
  }) async {
    GetStorage storage = GetStorage();
    printlog('id is = $id');
    printlog('id is = ${storage.read('userId')}');
    FormData formData = FormData.fromMap({
      'b_id': id,
      'pname': controller!.pNameCon.text,
      'pprice': controller.pPriceCon.text,
      'p_details': controller.pDetailsCon.text,
      'userid': storage.read('userId'),
      'city':
          '${controller.listofCity[controller.currentlistofCityIndex.value]['city']}',
      'pimage1': !controller.isf1.value
          ? '$img1'
          : await MultipartFile.fromFile(controller.f1.value.path,
              filename: basename(controller.f1.value.path)),
      'pimage2': !controller.isf2.value
          ? '$img2'
          : await MultipartFile.fromFile(controller.f2.value.path,
              filename: basename(controller.f2.value.path)),
      'pimage3': !controller.isf3.value
          ? '$img3'
          : await MultipartFile.fromFile(controller.f3.value.path,
              filename: basename(controller.f3.value.path)),
      'product_id': '$product_id'
    });
    try {
      var responce = await Dio().post(
          '$baseUrl${ApiUtilsForAll.updateProduct}$secretCodeString',
          data: formData);
      var data = responce.data;
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data["result"] == "success") {
        Navigator.of(navigatorKey.currentContext!).pop();
        Navigator.of(navigatorKey.currentContext!).pop();
        snackBarSuccess('${data['message']}'.tr);
        callHome();
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
      'cell_number': '+92${controller.businessPhone.text}',
      'landline_number': controller.businessLandline.text,
      'whatsapp_number': controller.businessWhatsApp.text,
      'p_v_store': controller.listofSV[controller.currentSVIndex.value],
      'business_address': controller.businessAddress.text,
      'city':
          '${controller.listofCity[controller.currentlistofCityIndex.value]['city']}',
      'area': controller.businessArea.text,
      'web_url': controller.businessWebsiteUrl.text,
      'timings':
          'Mon:${controller.mon.value == 'Select time'.tr ? '' : controller.mon.value}\nTus:${controller.tue.value == 'Select time'.tr ? '' : controller.tue.value}\nWed:${controller.wed.value == 'Select time'.tr ? '' : controller.wed.value}\nThr:${controller.thus.value == 'Select time'.tr ? '' : controller.thus.value}\nFri:${controller.fri.value == 'Select time'.tr ? '' : controller.fri.value}\nSat:${controller.sat.value == 'Select time'.tr ? '' : controller.sat.value}\nSun:${controller.sun.value == 'Select time'.tr ? '' : controller.sun.value}',
      //'year_established': controller.Date.value,
      'num_employees': '',
      'facebook': controller.businessFb.text,
      'insta': controller.businessInsta.text,
      'youtube': controller.businessNoOfYoutube.text,
      'twitter': controller.businessTwitter.text,
      'service_areas': controller.businessServiceArea.text,
      'industry': controller.listofIndustry.isEmpty
          ? ''
          : controller
                  .listofIndustry[controller.currentlistofIndustryIndex.value]
              ['id'],
      'industry_cat': jsonEncode(controller.listselectedofSubCatids),
      'industry_sub_cat': controller.listofSubCat.isNotEmpty
          ? controller.listofSubCat[controller.currentlistofSubCatIndex.value]
              ['id']
          : '',
      'keywords': controller.listOfKeyWord.isEmpty
          ? ''
          : controller.listOfKeyWord
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .toString(),
      'delivery_available': controller.listOfDeliveryAvailable.isEmpty
          ? ''
          : controller.listOfDeliveryAvailable[
              controller.currentListOfDeliveryAvailableIndex.value],
      'booking': controller.listOfBooking.isEmpty
          ? ''
          : controller
              .listOfBooking[controller.currentlistOfBookingIndex.value],
      'pick_up': controller.pick_upHint.value == 'Take Away/Pick up'
          ? ''
          : controller.listpick_up[controller.currentpick_upIndex.value],
      'by_appointment': controller.by_appointmentHint.value == 'By Appointment'
          ? ''
          : controller
              .listby_appointment[controller.currentby_appointmentIndex.value],
      'hear_about': controller
          .listofHearAbout[controller.currentlistofHearAboutIndex.value],
      'business_description': controller.businessDiscription.text,
      'agent_id': controller.agentId.text.trim(),
      'payment_mod': controller.cashController.text
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
        Navigator.of(navigatorKey.currentContext!).pop();
        Navigator.of(navigatorKey.currentContext!).pop();
        snackBarSuccess(
            'Your listing has been sent for review. You will be notified once approved & online!'
                .tr);
        callHome();
      } else {}
    } catch (e) {}
  }

  static Future geteditBusiness(
      BuisnessRegistrationController controller) async {
    GetStorage storage = GetStorage();
    printlog('id is = ${storage.read('userId')}');

    printlog(
        '${controller.listOfDeliveryAvailable[controller.currentListOfDeliveryAvailableIndex.value]}');
    printlog(
        '${controller.listOfBooking[controller.currentlistOfBookingIndex.value]}');
    printlog('${controller.listpick_up[controller.currentpick_upIndex.value]}');
    printlog(
        '${controller.listby_appointment[controller.currentby_appointmentIndex.value]}');

    FormData formData = FormData.fromMap({
      'image': !controller.isf1.value
          ? '${controller.listing_image.value}'
          : await MultipartFile.fromFile(controller.f1.value.path,
              filename: basename(controller.f1.value.path)),
      'package_id':
          '${controller.listofPackage[controller.currentPackageIndex.value]['id']}',
      'user_id': storage.read('userId'),
      'business_name': controller.businessName.text,
      'business_email': controller.businessEmail.text,
      'cell_number': '+92${controller.businessPhone.text}',
      'landline_number': controller.businessLandline.text,
      'whatsapp_number': controller.businessWhatsApp.text,
      'p_v_store': controller.listofSV[controller.currentSVIndex.value],
      'business_address': controller.businessAddress.text,
      'city':
          '${controller.listofCity[controller.currentlistofCityIndex.value]['city']}',
      'area': controller.businessArea.text,
      'web_url': controller.businessWebsiteUrl.text,
      'timings':
          'Mon:${controller.mon.value == 'Select time' ? '' : controller.mon.value}\nTus:${controller.tue.value == 'Select time' ? '' : controller.tue.value}\nWed:${controller.wed.value == 'Select time' ? '' : controller.wed.value}\nThr:${controller.thus.value == 'Select time' ? '' : controller.thus.value}\nFri:${controller.fri.value == 'Select time' ? '' : controller.fri.value}\nSat:${controller.sat.value == 'Select time' ? '' : controller.sat.value}\nSun:${controller.sun.value == 'Select time' ? '' : controller.sun.value}',
      //  'year_established': controller.Date.value,
      'num_employees': controller.listofEmployee.isEmpty
          ? ''
          : controller
              .listofEmployee[controller.currentlistofEmployeeIndex.value],
      'facebook': controller.businessFb.text,
      'insta': controller.businessInsta.text,
      'youtube': controller.businessNoOfYoutube.text,
      'twitter': controller.businessTwitter.text,
      'service_areas': controller.businessServiceArea.text,
      'industry': controller.listofIndustry.isEmpty
          ? ''
          : controller
                  .listofIndustry[controller.currentlistofIndustryIndex.value]
              ['id'],
      'industry_cat': jsonEncode(controller.listselectedofSubCatids),
      'industry_sub_cat': controller.listofSubCat.isNotEmpty
          ? controller.listofSubCat[controller.currentlistofSubCatIndex.value]
              ['id']
          : '',
      'keywords': controller.listOfKeyWord.isEmpty
          ? ''
          : controller.listOfKeyWord
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .toString(),
      'delivery_available': controller.listOfDeliveryAvailable.isEmpty
          ? ''
          : controller.listOfDeliveryAvailable[
              controller.currentListOfDeliveryAvailableIndex.value],
      'booking': controller.listOfBooking.isEmpty
          ? ''
          : controller
              .listOfBooking[controller.currentlistOfBookingIndex.value],
      'pick_up': controller.pick_upHint.value == 'Take Away/Pick up'
          ? ''
          : controller.listpick_up[controller.currentpick_upIndex.value],
      'by_appointment': controller.by_appointmentHint.value == 'By Appointment'
          ? ''
          : controller
              .listby_appointment[controller.currentby_appointmentIndex.value],
      'hear_about': '${controller.herarAbout}',
      'business_description': controller.businessDiscription.text,
      'agent_id': '${controller.agentID}',
      'payment_mod': controller.cashController.text,
      'business_id': controller.business_id.value
    });
    printlog('calling api');
    try {
      var responce = await Dio().post(
          '$baseUrl${ApiUtilsForAll.editBusiness}$secretCodeString',
          data: formData);
      var data = responce.data;
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      //controller.loading.value = false;
      if (data["result"] == "success") {
        Navigator.of(navigatorKey.currentContext!).pop();
        Navigator.of(navigatorKey.currentContext!).pop();
        snackBarSuccess(data['message']);
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
        'business_id': '0',
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
        'business_id': '0',
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
        storage.write('profile_image', '${data['data']}');
        snackBarSuccess(data['message']);
        caltoHome();
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
