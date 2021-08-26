import 'dart:convert';
import 'package:dail_box/Screens/AddProduct.dart/AddProductController.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/Screens/IndustryDetails/IndustryDetailsController.dart';
import 'package:dail_box/Screens/IndustryDetails/IndustrySubDetails/IndustrySubDetailsController.dart';
import 'package:dail_box/Screens/Profile/EditPost/EditPostController.dart';
import 'package:dail_box/Screens/Profile/ProfileController.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingsController.dart';
import 'package:dail_box/Screens/SearchPage/SearchController.dart';
import 'package:dail_box/Screens/bottomNav/Home/HomeController.dart';
import 'package:dail_box/Screens/bottomNav/Home/home.dart';
import 'package:dail_box/Screens/bottomNav/Listings/ListingsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'BaseUtils.dart';
import 'LogsUtils.dart';
import 'SnackBarUtils.dart';

class ApiUtilsForAll {
  static final String homeproducts = '/homeproducts';
  static final String whatstrading = '/whatstrading';
  static final String mostrecentlisting = '/mostrecentlisting';
  static final String gethomecats = '/gethomecats';
  static final String homebanner = '/homebanner';
  static final String searchhome = '/searchhome';
  static final String getindustry = '/getindustry';
  static final String getlisting = '/getlisting';
  static final String getlistingproduct = '/getlistingproduct';
  static final String getlistingservices = '/getlistingservices';
  static final String givelistingrate = '/givelistingrate';
  static final String addproduct = '/addproduct';
  static final String addservice = '/addservice';
  static final String getmybusinesslist = '/getmybusinesslist';
  static final String getpackges = '/getpackges';
  static final String getmainindurty = '/getmainindurty';
  static final String getMainCatapp = '/getMainCatapp';
  static final String getMainSubCatapp = '/getMainSubCatapp';
  static final String addlisting = '/addlisting';
  static final String getmybusinesslistforListings = '/getmybusinesslist';
  static final String getbusinesslistbysubid = '/getbusinesslistbysubid';
  static final String like = '/like';
  static final String dislike = '/dislike';
  static final String message = '/message';
  static final String homeserives = '/homeserives';
  static final String getlistingrating = '/getlistingrating';
  static final String removeDiscussionform = '/removeDiscussionform';
  static final String updateDiscussionform = '/updateDiscussionform';
  static final String getlistingallrating = '/getlistingallrating';

  //static final String givelistingrate = '/givelistingrate';

  //http://dailboxx.websitescare.com/Alphaapis/getbusinesslistbysubid?code=DAILBOXX-03448567673
  GetStorage storage = GetStorage();

  static Future gethomeproducts(HomeController controller) async {
    var url = Uri.parse('$baseUrl$homeproducts$secretCodeString');
    try {
      var responce =
          await http.post(url, body: {'limit_a': '0', 'limit_b': '8'});
      var data = jsonDecode(responce.body);
      printlog('gethomeproducts is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofMostPopular.clear();
        controller.listofMostPopular = data['data'] ?? [];
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getwhatstrading(HomeController controller) async {
    var url = Uri.parse('$baseUrl$whatstrading$secretCodeString');
    try {
      var responce =
          await http.post(url, body: {'limit_a': '0', 'limit_b': '8'});
      var data = jsonDecode(responce.body);
      printlog('getwhatstrading is = ${data['data']}');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofwhatstrading.clear();
        controller.listofwhatstrading = data['data'];
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getmostrecentlisting(HomeController controller) async {
    var url = Uri.parse('$baseUrl$mostrecentlisting$secretCodeString');
    try {
      var responce =
          await http.post(url, body: {'limit_a': '0', 'limit_b': '8'});
      var data = jsonDecode(responce.body);
      printlog('getmostrecentlisting is = ${data['data']}');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofmostrecentlisting.clear();
        controller.listofmostrecentlisting = data['data'];
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getgethomecats(HomeController controller) async {
    var url = Uri.parse('$baseUrl$gethomecats$secretCodeString');
    try {
      var responce =
          await http.post(url, body: {'limit_a': '0', 'limit_b': '100'});
      var data = jsonDecode(responce.body);
      printlog('getgethomecats is = ${data['data']}');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listgethomecats.clear();
        controller.listgethomecats = data['data'];
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future gethomeserives(HomeController controller) async {
    var url = Uri.parse('$baseUrl$homeserives$secretCodeString');
    try {
      var responce =
          await http.post(url, body: {'limit_a': '0', 'limit_b': '100'});
      var data = jsonDecode(responce.body);
      printlog('gethomeserives is = ${data['data']}');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofMostPopularServices.clear();
        controller.listofMostPopularServices = data['data'];
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future gethomebanner(HomeController controller) async {
    var url = Uri.parse('$baseUrl$homebanner$secretCodeString');
    try {
      var responce =
          await http.post(url, body: {'limit_a': '0', 'limit_b': '8'});
      var data = jsonDecode(responce.body);
      printlog('gethomebanner is = ${data['data']}');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofhomebanner.clear();
        controller.listofhomebanner = data['data'];
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getsearchhome(SearchController controller) async {
    var url = Uri.parse('$baseUrl$searchhome$secretCodeString');
    try {
      var responce =
          await http.post(url, body: {'search': controller.searchCon.text});
      var data = jsonDecode(responce.body);
      printlog('getgethomecats is = ${data['data']}');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofSearch.clear();
        List list = data['data'];
        list.forEach((element) {
          controller.listofSearch.addAll(element);
        });
        printlog('listofSearch = ${controller.listofSearch}');
      } else {
        // snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getgetindustry(
      IndustryDetailsController controller, String id) async {
    var url = Uri.parse('$baseUrl$getindustry$secretCodeString');
    try {
      var responce = await http.post(url, body: {'industryid': id});
      var data = jsonDecode(responce.body);
      printlog('getgethomecats is = ${data['data']}');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofindustryDetails.clear();
        controller.listofindustryDetails = data['data'];
      } else {
        controller.listofindustryDetails.clear();
        // snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getgetlisting(
      RecentListnigsController controller, String id) async {
    var url = Uri.parse('$baseUrl$getlisting$secretCodeString');
    try {
      var responce = await http.post(url, body: {'lisrtingid': id});
      var data = jsonDecode(responce.body);
      printlog('getgetlisting data  is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofrecentListings.value = data['data'] ?? [];
        printlog('getgetlisting data is = ${controller.listofrecentListings}');
      } else {
        controller.listofrecentListings.clear();
        // snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getgetlistingproduct(
      RecentListnigsController controller, String id) async {
    var url = Uri.parse('$baseUrl$getlistingproduct$secretCodeString');
    try {
      var responce = await http.post(url, body: {'listingid': id});
      var data = jsonDecode(responce.body);
      printlog('getgetlistingproduct  is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listoflistingsProduct.value = data['data'] ?? [];
      } else {
        controller.listoflistingsProduct.clear();
        // snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getgetlistingservices(
      RecentListnigsController controller, String id) async {
    var url = Uri.parse('$baseUrl$getlistingservices$secretCodeString');
    try {
      var responce = await http.post(url, body: {'listingid': id});
      var data = jsonDecode(responce.body);
      printlog('getgetlistingservices data  is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofProductServices.value = data['data'] ?? [];
      } else {
        controller.listofProductServices.clear();
        // snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getgivelistingrate(
      {String? listing_id,
      String? business_name,
      String? rating_points,
      String? rating_review}) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$givelistingrate$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'listing_id': '$listing_id',
        'business_name': '$business_name',
        'user_id': storage.read('userId'),
        'rating_points': '$rating_points',
        'rating_review': "$rating_review"
      });
      var data = jsonDecode(responce.body);
      printlog('listing rate data  is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        snackBarSuccess('${data['message']}');
      } else {
        snackBarFailer('${data['message']}');
      }
    } catch (e) {}
  }

  static Future getaddservice(
      AddProductController controller, String id) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$addservice$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'b_id': id,
        's_name': controller.sNameCon.text,
        'userid': storage.read('userId'),
        's_cost': controller.sPriceCon.text,
        's_details': controller.sDetailsCon.text
      });
      var data = jsonDecode(responce.body);
      printlog('listing product services data  is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        Navigator.of(navigatorKey.currentContext!).pop();
        callHome();
        snackBarSuccess('Your Service has been submitted for approval');
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future<List> getgetmybusinesslist() async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$getmybusinesslist$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'userid': storage.read('userId'),
      });
      var data = jsonDecode(responce.body);
      printlog('buisness list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        List list = data['data'];
        return list;
      } else {
        return [];
        snackBarFailer(data['message']);
      }
    } catch (e) {}
    return [];
  }

  static Future getgetpackges() async {
    var url = Uri.parse('$baseUrl$getpackges$secretCodeString');
    var controller = Get.find<BuisnessRegistrationController>();
    try {
      var responce = await http.get(url);
      var data = jsonDecode(responce.body);
      printlog('getgetpackges list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofPackage.value = data['data'];
      } else {}
    } catch (e) {}
  }

  static Future getgetmainindurty() async {
    var url = Uri.parse('$baseUrl$getmainindurty$secretCodeString');
    var controller = Get.find<BuisnessRegistrationController>();
    try {
      var responce = await http.get(url);
      var data = jsonDecode(responce.body);
      printlog('getgetmainindurty list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofIndustry.value = data['data'];
      } else {}
    } catch (e) {}
  }

  static Future getgetMainCatapp(String id) async {
    printlog('main id =$id');
    var url = Uri.parse('$baseUrl$getMainCatapp$secretCodeString');
    var controller = Get.find<BuisnessRegistrationController>();
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

  static Future getgetMainSubCatapp(String id) async {
    printlog('main id =$id');
    var url = Uri.parse('$baseUrl$getMainSubCatapp$secretCodeString');
    var controller = Get.find<BuisnessRegistrationController>();
    try {
      var responce = await http.post(url, body: {'mainsub_sub_id': id});
      var data = jsonDecode(responce.body);
      printlog('getgetMainSubCatapp list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofSubCat.value = data['data'];
      } else {}
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/getmybusinesslist?code=DAILBOXX-03448567673

  static Future getgetmybusinesslistforListings(
      {String? id, ListingsController? controller}) async {
    GetStorage storage = GetStorage();
    printlog('main id =$id');
    var url = Uri.parse(
        '$baseUrl${storage.read('userId') == id ? getmybusinesslistforListings : getbusinesslistbysubid}$secretCodeString');
    try {
      var responce = await http.post(url,
          body: {storage.read('userId') == id ? 'userid' : 'sub_cat_id': id});
      var data = jsonDecode(responce.body);
      printlog('getgetmybusinesslistforListings list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofListings.value = data['data'];
        controller.isLoadinglist.value = true;
      } else {
        controller!.isLoadinglist.value = true;
      }
    } catch (e) {}
  }

//http://dailboxx.websitescare.com/Alphaapis/getbusinesslistbysubid?code=DAILBOXX-03448567673
  static Future getgetmybusinesslistforListingss({
    String? subid,
    IndustrySubDetailsController? controller,
  }) async {
    GetStorage storage = GetStorage();
    printlog('main id =$subid');
    var url = Uri.parse('$baseUrl$getbusinesslistbysubid$secretCodeString');
    try {
      var responce = await http.post(url, body: {'sub_cat_id': subid});
      var data = jsonDecode(responce.body);
      printlog('getgetmybusinesslistforListings list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofListings.value = data['data'];
        controller.isLoadinglist.value = true;
      } else {
        controller!.isLoadinglist.value = true;
      }
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/like?code=DAILBOXX-03448567673
  //http://dailboxx.websitescare.com/Alphaapis/dislike?code=DAILBOXX-03448567673
  static Future getlike(
      {String? id,
      IndustrySubDetailsController? controller,
      int? index,
      bool? isLike = true}) async {
    GetStorage storage = GetStorage();
    printlog('main id =$id');
    var url = Uri.parse('$baseUrl${isLike! ? like : dislike}$secretCodeString');
    try {
      var responce = await http
          .post(url, body: {'user_id': storage.read('userId'), 'post_id': id});
      var data = jsonDecode(responce.body);
      printlog('getlike list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        if (isLike) {
          controller!.listofListings[index!]['islike'] = 'true';
        } else {
          controller!.listofListings[index!]['islike'] = 'false';
        }
        print('object');
      }
    } catch (e) {}
  }

  static Future getmessage(
      {String? listing_id,
      String? to_msg,
      String? from_msg,
      String? massages,
      String? bussinies_id}) async {
    var url = Uri.parse('$baseUrl$message$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'to_msg': to_msg,
        'from_msg': from_msg,
        'massages': massages,
        'listing_id': bussinies_id
      });
      var data = jsonDecode(responce.body);
      printlog('getmessage list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        snackBarSuccess('${data['message']}');
      }
    } catch (e) {}
  }

  static Future getgetlistingrating(
      {String? id, RecentListnigsController? controller}) async {
    printlog('main id =$id');
    var url = Uri.parse('$baseUrl$getlistingrating$secretCodeString');
    try {
      var responce = await http.post(url, body: {'listingrate': id});
      var data = jsonDecode(responce.body);
      printlog('getgetlistingrating list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listgetlistingrating.value = data['data'];
      } else {}
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/removeDiscussionform?code=DAILBOXX-03448567673

  static Future getremoveDiscussionform({String? id, int? index}) async {
    final controller = Get.find<ProfileController>();
    var url = Uri.parse('$baseUrl$removeDiscussionform$secretCodeString');
    try {
      var responce = await http.post(url, body: {'form_id': id});
      var data = jsonDecode(responce.body);
      printlog('getgetlistingrating list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofChatBox.removeAt(index!);
      } else {}
    } catch (e) {}
  }

//http://dailboxx.websitescare.com/Alphaapis/getlistingallrating?code=DAILBOXX-03448567673
  static Future getgetlistingallrating({String? id, int? index}) async {
    final controller = Get.find<ProfileController>();
    var url = Uri.parse('$baseUrl$getlistingallrating$secretCodeString');
    try {
      var responce =
          await http.post(url, body: {'listingallrate': '', 'b_id': ''});
      var data = jsonDecode(responce.body);
      printlog('getgetlistingrating list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofChatBox.removeAt(index!);
      } else {}
    } catch (e) {}
  }
}
