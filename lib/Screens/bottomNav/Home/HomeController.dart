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

  Future getApiData(HomeController controller) async {
    await ApiUtilsForAll.getgethomecats(controller);
    await ApiUtilsForAll.gethomeproducts(controller);
    await ApiUtilsForAll.getwhatstrading(controller);
    await ApiUtilsForAll.gethomeserives(controller);
    await ApiUtilsForAll.gethomebanner(controller);
    await ApiUtilsForAll.getmostrecentlisting(controller);
    await ApiUtilsForAll.getAllCites(controller: controller);
  }

  var isOpenIndustry = false.obs;
  var loaddata = false.obs;

  var listofIndustry = [].obs;
  var currentlistofIndustryIndex = 0.obs;
  var listofIndustryHint = 'Select City'.obs;
}
