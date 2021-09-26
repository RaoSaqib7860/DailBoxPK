import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/AddProduct.dart/AddProductController.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistration.dart';
import 'package:dail_box/Screens/bottomNav/Home/HomeController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AddService extends StatefulWidget {
  final Map? mapData;

  const AddService({Key? key, this.mapData = const {}}) : super(key: key);

  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final controller = Get.put(AddProductController());
  HomeController homecontroller = Get.find<HomeController>();

  @override
  void initState() {
    printlog('Data for update = ${widget.mapData}');
    if (widget.mapData!.isNotEmpty) {
      controller.sNameCon.text = widget.mapData!['s_name'];
      controller.sDetailsCon.text = widget.mapData!['s_details'];
      controller.sPriceCon.text = widget.mapData!['s_cost'];
    }
    controller.listofCity.value = homecontroller.listofIndustry;
    getApiData();
    super.initState();
  }

  getApiData() async {
    List list = await ApiUtilsForAll.getgetmybusinesslist();
    controller.listofBuisness.value = list;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
          child: Scaffold(
        appBar: appBarGlobal('Add Service'.tr),
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.020,
                  ),
                  Expanded(
                      child: Obx(
                    () => SingleChildScrollView(
                      child: Column(
                        children: [
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
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.030),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<dynamic>(
                                  items: controller.listofBuisness.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: '$value',
                                      child: Text('${value['business_name']}'),
                                      onTap: () {
                                        controller.buisnessIDforservice.value =
                                            controller.listofBuisness
                                                .indexOf(value);
                                        controller.selectserviceHint.value =
                                            value['business_name'];
                                      },
                                    );
                                  }).toList(),
                                  hint: Text(
                                    controller.selectserviceHint.value,
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
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.030),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<dynamic>(
                                  items: controller.listofCity.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: '$value',
                                      child: Text('${value['city']}'),
                                      onTap: () {
                                        controller
                                                .currentlistofCityIndex.value =
                                            controller.listofCity
                                                .indexOf(value);
                                        controller.listofCityHint.value =
                                            value['city'];
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
                            height: height * 0.030,
                          ),
                          TextFromFieldsCustom(
                            controller: controller.sNameCon,
                            hint: 'Service Name'.tr,
                          ),
                          SizedBox(
                            height: height * 0.030,
                          ),
                          TextFromFieldsCustom(
                            controller: controller.sPriceCon,
                            hint: 'Service Starting Cost'.tr,
                            isNumber: true,
                          ),
                          SizedBox(
                            height: height * 0.030,
                          ),
                          TextFromFieldsCustom(
                            controller: controller.sDetailsCon,
                            hint: 'Service Details'.tr,
                          ),
                          SizedBox(
                            height: height * 0.030,
                          ),
                          FadeInUpBig(
                            child: InkWell(
                              onTap: () async {
                                if (controller.selectserviceHint.value !=
                                    'Select Business'.tr) {
                                  if (controller.sNameCon.text.isNotEmpty) {
                                    if (controller.sPriceCon.text.isNotEmpty) {
                                      if (controller
                                          .sDetailsCon.text.isNotEmpty) {
                                        controller.loading.value = true;
                                        if (widget.mapData!.isNotEmpty) {
                                          ApiUtilsForAll.getupdateServices(
                                              controller,
                                              controller.listofBuisness[
                                                  controller
                                                      .buisnessIDforservice
                                                      .value]['business_id'],
                                              '${widget.mapData!['id']}');
                                        } else {
                                          ApiUtilsForAll.getaddservice(
                                              controller,
                                              controller.listofBuisness[
                                                  controller
                                                      .buisnessIDforservice
                                                      .value]['business_id']);
                                        }
                                      } else {
                                        snackBarFailer(
                                            'Please select product details first');
                                      }
                                    } else {
                                      snackBarFailer(
                                          'Please select product price first');
                                    }
                                  } else {
                                    snackBarFailer(
                                        'Please select product name first');
                                  }
                                } else {
                                  snackBarFailer('Please select service first');
                                }
                              },
                              child: Container(
                                height: height * 0.070,
                                width: width,
                                child: Center(
                                  child: Text(
                                    widget.mapData!.isNotEmpty
                                        ? 'Update Service'.tr
                                        : 'Add Service'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                                decoration: BoxDecoration(color: blueColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Obx(() => controller.loading.value == true
                ? InkWell(
                    onTap: () {
                      controller.loading.value = false;
                    },
                    child: Container(
                      height: height,
                      width: width,
                      child: Center(
                        child: SpinKitPulse(
                          color: Colors.white,
                          size: 80.0,
                        ),
                      ),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    ),
                  )
                : SizedBox())
          ],
        ),
      ));
    });
  }
}
