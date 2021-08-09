import 'dart:convert';
import 'package:dail_box/Screens/AddProduct.dart/AddProductController.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/Screens/bottomNav/Home/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import '../main.dart';
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
      var data = jsonDecode(responce.data);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data["result"] == "success") {
        Navigator.of(navigatorKey.currentContext!).pop();
        Navigator.of(navigatorKey.currentContext!).pop();
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
      var data = jsonDecode(responce.data);
      printlog('data is = $data');
      printlog('data is = ${responce.statusCode}');
      //controller.loading.value = false;
      if (data["result"] == "success") {
        snackBarSuccess('Your product has been submitted for approval');
        Navigator.of(navigatorKey.currentContext!).pop();
        Navigator.of(navigatorKey.currentContext!).pop();
      } else {}
    } catch (e) {}
  }
}
