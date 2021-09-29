import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/Screens/bottomNav/Home/HomeController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';
import 'BuisnessRegistration.dart';

class BROne extends StatefulWidget {
  final height;
  final width;

  const BROne({Key? key, this.height, this.width}) : super(key: key);

  @override
  _BROneState createState() => _BROneState();
}

class _BROneState extends State<BROne> {
  var controller = Get.find<BuisnessRegistrationController>();
  HomeController homecontroller = Get.put(HomeController());

  @override
  void initState() {
    controller.listofCity.value = homecontroller.listofIndustry;
    ApiUtilsForAll.getgetpackges();
    ApiUtilsForAll.getgetmainindurty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = widget.height;
    var width = widget.width;
    return Obx(
      () => Column(
        crossAxisAlignment: findLanguageController.isEnglishLocale.value? CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: height * 0.020,
          ),
          Text(
            'Packages'.tr,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: height * 0.008,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3),
                  //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            height: height * 0.060,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: IgnorePointer(
              ignoring: isEditBusiness ? true : false,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<dynamic>(
                    items: controller.listofPackage.map((value) {
                      return DropdownMenuItem<String>(
                        value: '$value',
                        child: Text('${value['package_name']}'),
                        onTap: () {
                          controller.currentPackageIndex.value =
                              controller.listofPackage.indexOf(value);
                          controller.packageHint.value = value['package_name'];
                        },
                      );
                    }).toList(),
                    hint: Text(
                      controller.packageHint.value,
                      style: TextStyle(fontSize: 14),
                    ),
                    onChanged: (_) {},
                    isExpanded: true),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          Text(
            'Business Industry'.tr,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: height * 0.008,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3),
                  //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            height: height * 0.060,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                  items: controller.listofIndustry.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('${value['industry_name']}'),
                      onTap: () {
                        controller.currentlistofIndustryIndex.value =
                            controller.listofIndustry.indexOf(value);
                        controller.listofIndustryHint.value =
                            value['industry_name'];
                        ApiUtilsForAll.getgetMainCatapp(value['id']);
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.listofIndustryHint.value,
                    style: TextStyle(fontSize: 14),
                  ),
                  onChanged: (_) {},
                  isExpanded: true),
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3),
                  //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            height: height * 0.060,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                  items: controller.listofCat.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('${value['main_cat_name']}'),
                      onTap: () {
                        if (!controller.listselectedofSubname
                            .contains('${value['main_cat_name']}')) {
                          controller.currentlistofCatIndex.value =
                              controller.listofCat.indexOf(value);
                          controller.listofCatHint.value =
                              value['main_cat_name'];
                          ApiUtilsForAll.getgetMainSubCatapp(value['id']);
                          controller.listselectedofSubCatids
                              .add({'industry_cat': '${value['id']}'});
                          controller.listselectedofSubname
                              .add('${value['main_cat_name']}');
                        }
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.listofCatHint.value,
                    style: TextStyle(fontSize: 14),
                  ),
                  onChanged: (_) {},
                  isExpanded: true),
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            width: width,
            child: Wrap(
              children: controller.listselectedofSubname.map((element) {
                int index = controller.listselectedofSubname.indexOf(element);
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.010, vertical: 3),
                      child: Text('$element'),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Align(
                      child: InkWell(
                        child: Icon(
                          Icons.delete,
                          size: 20,
                          color: Colors.red.withOpacity(0.5),
                        ),
                        onTap: () {
                          controller.listselectedofSubCatids.removeAt(index);
                          controller.listselectedofSubname.removeAt(index);
                        },
                      ),
                      alignment: Alignment.topRight,
                    )
                  ],
                );
              }).toList(),
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3),
                  //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            height: height * 0.060,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                  items: controller.listofCity.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('${value['city']}'),
                      onTap: () {
                        controller.currentlistofCityIndex.value =
                            controller.listofCity.indexOf(value);
                        controller.listofCityHint.value = value['city'];
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.listofCityHint.value,
                    style: TextStyle(fontSize: 14),
                  ),
                  onChanged: (_) {},
                  isExpanded: true),
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Business Name*'.tr,

            enable: isEditBusiness ? false : true,
            controller: controller.businessName,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Business Details'.tr,
            controller: controller.businessDiscription,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          // TextFromFieldsCustom(
          //   hint: 'Contact Person',
          // ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            controller: controller.businessEmail,
            hint: 'Business email'.tr,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          Text('Business Cell Number*'.tr),
          SizedBox(
            height: height * 0.010,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/images/flagPK.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text('+92'),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFromFieldsCustom(
                  controller: controller.businessPhone,
                  hint: '3451234567'.tr,
                  isNumber: true,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            controller: controller.businessLandline,
            hint: 'Landline number'.tr,
            isNumber: true,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          Text(
            'Physical Location/Virtual*'.tr,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3),
                  //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            height: height * 0.060,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                  items: controller.listofSV.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('$value'),
                      onTap: () {
                        controller.currentSVIndex.value =
                            controller.listofSV.indexOf(value);
                        controller.SVHint.value = value;
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.SVHint.value,
                    style: TextStyle(fontSize: 14),
                  ),
                  onChanged: (_) {},
                  isExpanded: true),
            ),
          ),
          SizedBox(
            height: height * 0.030,
          ),
          FadeInUpBig(
            child: InkWell(
              onTap: () {
                if (controller.listofCityHint.value != 'Select City') {
                  if (controller.packageHint.value != 'Select Package') {
                    if (controller.listofIndustryHint.value !=
                        'Select Industry*') {
                      if (controller.businessName.text.trim().isNotEmpty) {
                        if (controller.businessPhone.text.trim().isNotEmpty) {
                          if (controller.SVHint.value !=
                              'Physical Location/Virtual*'.tr) {
                            controller.currentIndex.value = 2;
                            scrollController.animateTo(
                              scrollController.position.minScrollExtent,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            );
                          } else {
                            snackBarSuccess(
                                'Select Physical Location or Virtual first'.tr);
                          }
                        } else {
                          snackBarSuccess('Add cell number first'.tr);
                        }
                      } else {
                        snackBarSuccess('Add business name first'.tr);
                      }
                    } else {
                      snackBarSuccess('Select Industry first'.tr);
                    }
                  } else {
                    snackBarSuccess('Select package first'.tr);
                  }
                } else {
                  snackBarSuccess('Select City first'.tr);
                }
              },
              child: Container(
                height: height * 0.070,
                width: width,
                child: Center(
                  child: Text(
                    'NEXT'.tr,
                    style: TextStyle(color: Colors.white, letterSpacing: 0.5),
                  ),
                ),
                decoration: BoxDecoration(color: blueColor),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.030,
          ),
        ],
      ),
    );
  }
}
