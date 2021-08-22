import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List listofMostPopular = [1, 2, 3, 4, 5, 6, 7, 8].obs;
  List listofMostPopularServices = [1, 2, 3, 4, 5, 6, 7, 8].obs;
  List listofwhatstrading = [1, 2, 3, 4, 5, 6, 7, 8].obs;
  List listofmostrecentlisting = [1, 2, 3, 4, 5, 6, 7, 8].obs;
  List listgethomecats = [1, 2, 3, 4, 5, 6, 7, 8].obs;
  List listofhomebanner = [1, 2, 3].obs;

  getApiData(HomeController controller) {
    ApiUtilsForAll.getgethomecats(controller);
    ApiUtilsForAll.gethomeproducts(controller);
    ApiUtilsForAll.getwhatstrading(controller);
    ApiUtilsForAll.gethomeserives(controller);
    ApiUtilsForAll.gethomebanner(controller);
    ApiUtilsForAll.getmostrecentlisting(controller);
  }

  var isOpenIndustry = false.obs;
}
