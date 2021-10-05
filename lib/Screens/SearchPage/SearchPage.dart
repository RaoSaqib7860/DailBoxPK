import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingdDetails.dart';
import 'package:dail_box/Screens/SearchDetail/SearchDetails.dart';
import 'package:dail_box/Screens/SearchPage/SearchController.dart';
import 'package:dail_box/Screens/bottomNav/Home/HomeController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final serchController = Get.put(SearchController());
  HomeController controller = Get.find<HomeController>();
  bool showalert = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
          child: Scaffold(
        appBar: appBarGlobal('Search'.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.030),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: height * 0.058,
                    color: blueColor,
                    margin: EdgeInsets.only(top: 3, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.020),
                    child: Icon(
                      CupertinoIcons.location_solid,
                      color: Colors.white,
                    ),
                  ),
                  Obx(
                    () => Container(
                      height: height * 0.058,
                      width: width * 0.3,
                      margin: EdgeInsets.only(top: 3, bottom: 10),
                      color: blueColor,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.020),
                      child: Theme(
                          data: new ThemeData(
                              canvasColor: blueColor,
                              primaryColor: Colors.black,
                              accentColor: Colors.black,
                              hintColor: Colors.black),
                          child: DropdownButton<String>(
                            items: controller.listofIndustry.map((value) {
                              return DropdownMenuItem<String>(
                                value: '$value',
                                child: Text(
                                  '${value['city']}',
                                ),
                                onTap: () {
                                  controller.currentlistofIndustryIndex.value =
                                      controller.listofIndustry.indexOf(value);
                                  controller.listofIndustryHint.value =
                                      value['city'];
                                },
                              );
                            }).toList(),
                            hint: Text(
                              controller.listofIndustryHint.value.tr,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                            underline: Container(
                              color: Colors.transparent,
                            ),
                            isDense: false,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                            isExpanded: true,
                            onChanged: (_) {},
                          )),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 3, bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          height: height * 0.058,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.grey[100],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400]!,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: serchController.searchCon,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign:
                                findLanguageController.isEnglishLocale.value
                                    ? TextAlign.left
                                    : TextAlign.right,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            enabled: true,
                            onChanged: (value) async {
                              if (value.length < 1) {
                                serchController.listofSearch.value = [];
                              } else {
                                await ApiUtilsForAll.getsearchhome(
                                    serchController);
                              }
                              setState(() {});
                            },
                            decoration:
                                findLanguageController.isEnglishLocale.value
                                    ? InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: greyColor,
                                          size: 22,
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 10,
                                            bottom: 11,
                                            top: 5,
                                            right: 10),
                                        hintStyle: TextStyle(
                                            color: greyColor, fontSize: 12),
                                        hintText: "Search here".tr)
                                    : InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.search,
                                          color: greyColor,
                                          size: 22,
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 10,
                                            bottom: 11,
                                            top: 5,
                                            right: 0),
                                        hintStyle: TextStyle(
                                            color: greyColor, fontSize: 12),
                                        hintText: "Search here".tr),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Obx(
                () => serchController.listofSearch.isEmpty
                    ? SizedBox()
                    : ListView.builder(
                        itemBuilder: (c, i) {
                          Map map = serchController.listofSearch[i];
                          return InkWell(
                            onTap: () {
                              if (map.containsKey('pname')) {
                                Get.to(SearchDetails(
                                  buisinessId: serchController.listofSearch[i]
                                      ['id'],
                                  fromApi: 'product',
                                  b_ID: serchController.listofSearch[i]['b_id'],
                                  name: serchController.listofSearch[i]
                                      ['pname'],
                                ));
                              } else if (map.containsKey('s_name')) {
                                Get.to(SearchDetails(
                                  buisinessId: serchController.listofSearch[i]
                                      ['id'],
                                  fromApi: 'service',
                                  b_ID: serchController.listofSearch[i]['b_id'],
                                  name: serchController.listofSearch[i]
                                      ['s_name'],
                                ));
                              } else {
                                Get.to(RecentListingsDetails(
                                  id: serchController.listofSearch[i]['id'],
                                  businessId: serchController.listofSearch[i]
                                      ['business_id'],
                                  name: serchController.listofSearch[i]
                                      ['business_name'],
                                ));
                              }
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text(
                                        map.containsKey('s_name')
                                            ? '${serchController.listofSearch[i]['s_name']}'
                                            : map.containsKey('pname')
                                                ? '${serchController.listofSearch[i]['pname']}'
                                                : '${serchController.listofSearch[i]['business_name']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          map.containsKey('s_name')
                                              ? '${serchController.listofSearch[i]['business_name']}'
                                              : map.containsKey('pname')
                                                  ? '${serchController.listofSearch[i]['business_name']}'
                                                  : '${serchController.listofSearch[i]['business_name']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: greyColor,
                                              fontSize: 11),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // subtitle: Text(
                                  //   map.containsKey('s_name')
                                  //       ? '${serchController.listofSearch[i]['s_details']}'
                                  //       : map.containsKey('business_name')
                                  //           ? '${serchController.listofSearch[i]['business_description']}'
                                  //           : '${serchController.listofSearch[i]['p_details']}',
                                  //   style: TextStyle(fontSize: 10),
                                  // ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 15,
                                  ),
                                ),
                                Container(
                                  height: 0.5,
                                  width: width,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: serchController.listofSearch.length,
                      ),
              ))
            ],
          ),
        ),
      ));
    });
  }
}
