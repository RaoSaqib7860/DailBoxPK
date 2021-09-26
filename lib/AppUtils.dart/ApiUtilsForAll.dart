import 'dart:convert';
import 'package:dail_box/Screens/AddNewBuisness/AddnewBuisenessController.dart';
import 'package:dail_box/Screens/AddProduct.dart/AddProductController.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/Screens/FAQs/FAQsController.dart';
import 'package:dail_box/Screens/IndustryDetails/IndustryDetailsController.dart';
import 'package:dail_box/Screens/IndustryDetails/IndustrySubDetails/IndustrySubDetailsController.dart';
import 'package:dail_box/Screens/Profile/ProfileController.dart';
import 'package:dail_box/Screens/Profile/ViewAllLike/ViewAllLikeController.dart';
import 'package:dail_box/Screens/Profile/ViewComments/ViewCommentController.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingsController.dart';
import 'package:dail_box/Screens/SearchDetail/SearchDetailsController.dart';
import 'package:dail_box/Screens/SearchPage/SearchController.dart';
import 'package:dail_box/Screens/SignIn/sign_in.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/ChatBoxController.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/Comment/CommentPageController.dart';
import 'package:dail_box/Screens/bottomNav/Home/HomeController.dart';
import 'package:dail_box/Screens/bottomNav/Home/home.dart';
import 'package:dail_box/Screens/bottomNav/Listings/ListingsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../Screens/AddProduct.dart/AddProductController.dart';
import '../Screens/IndustryDetails/IndustryDetailsController.dart';
import '../Screens/RecentListingDetails/RecentListingsController.dart';
import '../Screens/SearchPage/SearchController.dart';
import '../Screens/bottomNav/Home/HomeController.dart';
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
  static final String editBusiness = '/editBusiness';
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
  static final String getAllLikeform = '/getAllLikeform';
  static final String getAllCommentsform = '/getAllCommentsform';
  static final String likeDiscussionform = '/likeDiscussionform';
  static final String dislikeDiscussionform = '/dislikeDiscussionform';
  static final String postCommentform = '/postCommentform';
  static final String getCities = '/getCities';
  static final String getbusinesslistbysubidcity =
      '/getbusinesslistbysubidcity';
  static final String getbusinesssort = '/getbusinesssort';
  static final String reportListing = '/reportListing';
  static final String postFAQ = '/postFAQ';
  static final String updateServices = '/updateServices';
  static final String updateProduct = '/updateProduct';
  static final String productRemove = '/productRemove';
  static final String serviceRemove = '/serviceRemove';
  static final String checkuser = '/checkuser';

  GetStorage storage = GetStorage();

  static Future getcheckuser() async {
    var url = Uri.parse('$baseUrl$checkuser$secretCodeString');
    GetStorage storage = GetStorage();
    try {
      var responce =
          await http.post(url, body: {'userid': '${storage.read('userId')}'});
      var data = jsonDecode(responce.body);
      printlog('getcheckuser is = ${data['data']}');
      printlog('data is = ${responce.statusCode}');
      if (data['data'] == null) {
        storage.erase();
        timer!.cancel();
        snackBarFailer(
            'Your account has been suspended . Please contact customer support');
        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(SignIn());
        });
      }
    } catch (e) {}
  }

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
    HomeController homecontroller = Get.find<HomeController>();
    try {
      var responce = await http.post(url, body: {
        'search': controller.searchCon.text,
        'city': homecontroller.listofIndustryHint.value == 'Select City'
            ? ''
            : '${homecontroller.listofIndustry[homecontroller.currentlistofIndustryIndex.value]['city']}'
      });
      var data = jsonDecode(responce.body);
      printlog('getgethomecats is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofSearch.value = [];
        List list = data['data'];
        controller.listofSearch.addAll(list[0]['products'] ?? []);
        controller.listofSearch.addAll(list[0]['services'] ?? []);
        controller.listofSearch.addAll(list[0]['listing'] ?? []);
        printlog('listofSearch = ${controller.listofSearch}');
      } else {
        controller.listofSearch.value = [];
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
    print('listing is = $id');
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

  //https://dialboxx.pk/Alphaapis/getlisting?code=DAILBOXX-03448567673
  static Future getAPigetlisting(
      {RecentListnigsController? controller, String? id}) async {
    var url = Uri.parse('$baseUrl$getlisting$secretCodeString');
    print('listing is = $id');
    try {
      var responce = await http.post(url, body: {'listingid': id});
      var data = jsonDecode(responce.body);
      printlog('getgetlistingservices data  is = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofallSubCat.value = data['data'] ?? [];
      } else {
        controller!.listofallSubCat.clear();
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
        'city':
            '${controller.listofCity[controller.currentlistofCityIndex.value]['city']}',
        'userid': storage.read('userId'),
        's_cost': controller.sPriceCon.text,
        's_details': controller.sDetailsCon.text,
      });
      var data = jsonDecode(responce.body);
      printlog('listing product services data  is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        Navigator.of(navigatorKey.currentContext!).pop();
        callHome();
        snackBarSuccess('Service has been added Successfully');
      } else {
        snackBarFailer(data['message']);
      }
    } catch (e) {}
  }

  static Future getupdateServices(
      AddProductController controller, String id, String serviceID) async {
    GetStorage storage = GetStorage();
    var url = Uri.parse('$baseUrl$updateServices$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'b_id': id,
        's_name': controller.sNameCon.text,
        'city':
            '${controller.listofCity[controller.currentlistofCityIndex.value]['city']}',
        'userid': storage.read('userId'),
        's_cost': controller.sPriceCon.text,
        's_details': controller.sDetailsCon.text,
        'service_id': serviceID
      });
      var data = jsonDecode(responce.body);
      printlog('listing product services data  is = $data');
      printlog('data is = ${responce.statusCode}');
      controller.loading.value = false;
      if (data['result'] == 'success') {
        Navigator.of(navigatorKey.currentContext!).pop();
        Navigator.of(navigatorKey.currentContext!).pop();
        callHome();
        snackBarSuccess('Service has been Updated Successfully');
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

  static Future getgetpackges({int? currentPackage}) async {
    var url = Uri.parse('$baseUrl$getpackges$secretCodeString');
    var controller = Get.find<BuisnessRegistrationController>();
    try {
      var responce = await http.get(url);
      var data = jsonDecode(responce.body);
      printlog('getgetpackges list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller.listofPackage.value = data['data'];
        controller.currentPackageIndex.value = controller.currentPackage.value;
        controller.packageHint.value = controller
            .listofPackage[controller.currentPackage.value]['package_name'];
      } else {}
    } catch (e) {}
  }

  static Future getgetpackgesForAddBusiness(
      {AddNewBusinessController? controller}) async {
    var url = Uri.parse('$baseUrl$getpackges$secretCodeString');
    try {
      var responce = await http.get(url);
      var data = jsonDecode(responce.body);
      printlog('getgetpackges list is  = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.loading.value = true;
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
        'to_msg': from_msg,
        'listing_id': '$bussinies_id',
        'from_msg': to_msg,
        'massages': massages,
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

//http://dailboxx.websitescare.com/Alphaapis/getAllLikeform?code=DAILBOXX-03448567673
// http://dailboxx.websitescare.com/Alphaapis/getAllCommentsform?code=DAILBOXX-03448567673

  static Future getgetAllLikeform(
      {String? form_id, ViewAllLikeController? controller}) async {
    var url = Uri.parse('$baseUrl$getAllLikeform$secretCodeString');
    try {
      var responce = await http.post(url, body: {'form_id': form_id});
      var data = jsonDecode(responce.body);
      printlog('getgetlistingrating list is  = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.isloading.value = true;
      if (data['result'] == 'success') {
        controller.listoflike.value = data['data'] ?? [];
      }
    } catch (e) {}
  }

  static Future getgetAllCommentsform(
      {String? form_id, ViewCommentsController? controller}) async {
    var url = Uri.parse('$baseUrl$getAllCommentsform$secretCodeString');
    try {
      var responce = await http.post(url, body: {'form_id': form_id});
      var data = jsonDecode(responce.body);
      printlog('getgetAllCommentsform list is  = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.isloading.value = true;
      if (data['result'] == 'success') {
        controller.listofComment.value = data['data'] ?? [];
      }
    } catch (e) {}
  }

  static Future getgetAllCommentsforms(
      {String? form_id, CommentPageController? controller}) async {
    var url = Uri.parse('$baseUrl$getAllCommentsform$secretCodeString');
    try {
      var responce = await http.post(url, body: {'form_id': form_id});
      var data = jsonDecode(responce.body);
      printlog('getgetAllCommentsform list is  = $data');
      printlog('data is = ${responce.statusCode}');
      controller!.isloading.value = false;
      controller.isloading.value = true;
      if (data['result'] == 'success') {
        controller.listofComment.value = data['data'] ?? [];
      }
    } catch (e) {}
  }

  static Future getlikeDiscussionform(
      {String? form_id,
      ChatBoxController? controller,
      int? index,
      bool? isLike = true}) async {
    GetStorage storage = GetStorage();
    printlog('main id =$form_id');
    var url = Uri.parse(
        '$baseUrl${isLike! ? likeDiscussionform : dislikeDiscussionform}$secretCodeString');
    try {
      var responce = await http.post(url,
          body: {'user_id': storage.read('userId'), 'form_id': form_id});
      var data = jsonDecode(responce.body);
      printlog('getlike list is  = $data');
      printlog('data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        if (isLike) {
          controller!.listofChatBox[index!]['islike'] = 'true';
          int total =
              int.parse('${controller.listofChatBox[index]['total_likes']}');
          controller.listofChatBox[index]['total_likes'] = '${total + 1}';
        } else {
          controller!.listofChatBox[index!]['islike'] = 'false';
          int total =
              int.parse('${controller.listofChatBox[index]['total_likes']}');
          controller.listofChatBox[index]['total_likes'] = '${total - 1}';
        }
        print('object');
      }
    } catch (e) {}
  }

  static Future getpostCommentform({String? form_id, String? text}) async {
    var url = Uri.parse('$baseUrl$postCommentform$secretCodeString');
    GetStorage storage = GetStorage();
    try {
      var responce = await http.post(url, body: {
        'form_id': form_id,
        'user_id': storage.read('userId'),
        'comments': '$text'
      });
      var data = jsonDecode(responce.body);
      printlog('getgetAllCommentsform list is  = $data');
      printlog('data is = ${responce.statusCode}');
    } catch (e) {}
  }

  static Future getAllCites({HomeController? controller}) async {
    print('getAllCites call now');
    var url = Uri.parse('$baseUrl$getCities$secretCodeString');
    try {
      var responce = await http.get(url);
      var data = jsonDecode(responce.body);
      printlog('getAllCites list is  = $data');
      printlog('getAllCites data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofIndustry.value = data['data'];
      }
    } catch (e) {}
  }

  //http://dailboxx.websitescare.com/Alphaapis/getbusinesslistbysubidcity?code=DAILBOXX-03448567673
  static Future getgetbusinesslistbysubidcity(
      {IndustrySubDetailsController? controller,
      String? sub_cat_id,
      String? city}) async {
    GetStorage storage = GetStorage();
    print('getAllCites call now');
    var url = Uri.parse('$baseUrl$getbusinesslistbysubidcity$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'sub_cat_id': '$sub_cat_id',
        'city': '$city',
        'user_id': storage.read('userId')
      });
      var data = jsonDecode(responce.body);
      printlog('getAllCites list is  = $data');
      printlog('getAllCites data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofListings.value = data['data'] ?? [];
      } else {
        controller!.listofListings.value = [];
      }
    } catch (e) {}
  }

  static Future getgetbusinesssort(
      {IndustrySubDetailsController? controller,
      String? sub_cat_id,
      String? sort,
      String? city}) async {
    GetStorage storage = GetStorage();
    print('getAllCites call now');
    var url = Uri.parse('$baseUrl$getbusinesssort$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'sub_cat_id': '$sub_cat_id',
        'sort': '$sort',
        'city': '$city',
        'user_id': storage.read('userId')
      });
      var data = jsonDecode(responce.body);
      printlog('getAllCites list is  = $data');
      printlog('getAllCites data is = ${responce.statusCode}');
      if (data['result'] == 'success') {
        controller!.listofListings.value = data['data'] ?? [];
      } else {
        controller!.listofListings.value = [];
      }
    } catch (e) {}
  }

  static Future reportlistings(
      {String? post_id, String? report_comments, String? user_id}) async {
    print('getAllCites call now');
    var url = Uri.parse('$baseUrl$reportListing$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'report_comments': '$report_comments',
        'post_id': '$post_id',
        'user_id': '$user_id'
      });
      var data = jsonDecode(responce.body);
      printlog('report is  = $data');
      printlog('report data is = ${responce.statusCode}');
      snackBarSuccess('Report has been submitted');
    } catch (e) {}
  }

  static Future getpostFAQ(
      {String? b_id, String? faqs_id, FAQsController? controller}) async {
    print('getAllCites call now');
    var url = Uri.parse('$baseUrl$postFAQ$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'faqs_id': faqs_id,
        'b_id': '$b_id',
      });
      var data = jsonDecode(responce.body);
      printlog('report is  = $data');
      printlog('report data is = ${responce.statusCode}');
      controller!.loading.value = false;
      if (data['result'] == 'success') {
        snackBarSuccess('${data['message']}');
      }
    } catch (e) {}
  }

  static Future getproductRemove(
      {String? b_id, SearchDetailsController? controller}) async {
    print('getAllCites call now');
    var url = Uri.parse('$baseUrl$productRemove$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        'p_id': b_id,
      });
      var data = jsonDecode(responce.body);
      printlog('report is  = $data');
      printlog('report data is = ${responce.statusCode}');
      controller!.loading.value = false;
      if (data['result'] == 'success') {
        Get.back();
        Get.back();
        snackBarSuccess('${data['message']}');
        callHome();
      }
    } catch (e) {}
  }

  static Future getserviceRemove(
      {String? b_id, SearchDetailsController? controller}) async {
    print('getAllCites call now');
    var url = Uri.parse('$baseUrl$serviceRemove$secretCodeString');
    try {
      var responce = await http.post(url, body: {
        's_id': b_id,
      });
      var data = jsonDecode(responce.body);
      printlog('report is  = $data');
      printlog('report data is = ${responce.statusCode}');
      controller!.loading.value = false;
      if (data['result'] == 'success') {
        Get.back();
        Get.back();
        snackBarSuccess('${data['message']}');
        callHome();
      }
    } catch (e) {}
  }
}
