import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ApiUtisAllFiles.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistration.dart';
import 'package:dail_box/Screens/bottomNav/Home/HomeController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'AddProductController.dart';

class AddProduct extends StatefulWidget {
  final String? id;
  final String? buisinessID;
  final String? ProductID;
  final Map? mapData;

  const AddProduct(
      {Key? key,
      this.id,
      this.buisinessID,
      this.ProductID,
      this.mapData = const {}})
      : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final controller = Get.put(AddProductController());
  HomeController homecontroller = Get.find<HomeController>();

  @override
  void initState() {
    if (widget.mapData!.isNotEmpty) {
      printlog('${widget.mapData}');
      printlog('${widget.buisinessID}');
      printlog('${widget.ProductID}');
      controller.pNameCon.text = widget.mapData!['pname'];
      controller.pPriceCon.text = widget.mapData!['pprice'];
      controller.pDetailsCon.text = widget.mapData!['p_details'];
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
        appBar: appBarGlobal(widget.mapData!.isNotEmpty
            ? 'Update Product'.tr
            : 'Add Product'.tr),
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
                              height: height * 0.060,
                              width: width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.030),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<dynamic>(
                                    items:
                                        controller.listofBuisness.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: '$value',
                                        child:
                                            Text('${value['business_name']}'),
                                        onTap: () {
                                          controller
                                                  .buisnessIDforProduct.value =
                                              controller.listofBuisness
                                                  .indexOf(value);
                                          controller.selectBusinessHint.value =
                                              value['business_name'];
                                        },
                                      );
                                    }).toList(),
                                    hint: Text(
                                      controller.selectBusinessHint.value,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    onChanged: (_) {},
                                    isExpanded: true),
                              ),
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
                            ),
                            SizedBox(
                              height: height * 0.030,
                            ),
                            TextFromFieldsCustom(
                              controller: controller.pNameCon,
                              hint: 'Product Name'.tr,
                            ),
                            SizedBox(
                              height: height * 0.030,
                            ),
                            TextFromFieldsCustom(
                              controller: controller.pPriceCon,
                              hint: 'Product Price'.tr,
                              isNumber: true,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.030),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<dynamic>(
                                    items: controller.listofCity.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: '$value',
                                        child: Text('${value['city']}'),
                                        onTap: () {
                                          controller.currentlistofCityIndex
                                                  .value =
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
                              controller: controller.pDetailsCon,
                              hint: 'Product Details'.tr,
                            ),
                            SizedBox(
                              height: height * 0.030,
                            ),
                            Text(
                              
                              'Add up to 3 Images'.tr,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            widget.mapData!.isNotEmpty
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.displayBottomSheet(
                                                tag: '1');
                                          },
                                          child: Container(
                                            child: Container(
                                              height: height * 0.150,
                                              child: Card(
                                                color: Colors.blueGrey[100],
                                                child: !controller.isf1.value
                                                    ? CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            '${widget.mapData!['pimage1']}',
                                                        placeholder:
                                                            (context, url) =>
                                                                ShimerEffect(
                                                          child: SizedBox(
                                                            height:
                                                                double.infinity,
                                                            width:
                                                                double.infinity,
                                                          ),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.network(
                                                                'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                                      )
                                                    : Image.file(
                                                        controller.f1.value,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.displayBottomSheet(
                                                tag: '2');
                                          },
                                          child: Container(
                                            child: Container(
                                              height: height * 0.150,
                                              child: Card(
                                                color: Colors.blueGrey[100],
                                                child: !controller.isf2.value
                                                    ? CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            '${widget.mapData!['pimage2']}',
                                                        placeholder:
                                                            (context, url) =>
                                                                ShimerEffect(
                                                          child: SizedBox(
                                                            height:
                                                                double.infinity,
                                                            width:
                                                                double.infinity,
                                                          ),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.network(
                                                                'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                                      )
                                                    : Image.file(
                                                        controller.f2.value,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.displayBottomSheet(
                                                tag: '3');
                                          },
                                          child: Container(
                                            child: Container(
                                              height: height * 0.150,
                                              child: Card(
                                                color: Colors.blueGrey[100],
                                                child: !controller.isf3.value
                                                    ? CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            '${widget.mapData!['pimage3']}',
                                                        placeholder:
                                                            (context, url) =>
                                                                ShimerEffect(
                                                          child: SizedBox(
                                                            height:
                                                                double.infinity,
                                                            width:
                                                                double.infinity,
                                                          ),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.network(
                                                                'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                                      )
                                                    : Image.file(
                                                        controller.f3.value,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.displayBottomSheet(
                                                tag: '1');
                                          },
                                          child: Container(
                                            child: Container(
                                              height: height * 0.150,
                                              child: Card(
                                                color: Colors.blueGrey[100],
                                                child: controller.isf1.value
                                                    ? Image.file(
                                                        controller.f1.value,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.displayBottomSheet(
                                                tag: '2');
                                          },
                                          child: Container(
                                            child: Container(
                                              height: height * 0.150,
                                              child: Card(
                                                color: Colors.blueGrey[100],
                                                child: controller.isf2.value
                                                    ? Image.file(
                                                        controller.f2.value,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.displayBottomSheet(
                                                tag: '3');
                                          },
                                          child: Container(
                                            child: Container(
                                              height: height * 0.150,
                                              child: Card(
                                                color: Colors.blueGrey[100],
                                                child: controller.isf3.value
                                                    ? Image.file(
                                                        controller.f3.value,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                            SizedBox(
                              child: SizedBox(
                                height: height * 0.030,
                              ),
                            ),
                            FadeInUpBig(
                              child: InkWell(
                                onTap: () {
                                  if (controller.listofCityHint.value !=
                                      'Select City') {
                                    if (controller.selectBusinessHint.value !=
                                        'Select Business'.tr) {
                                      if (controller.pNameCon.text.isNotEmpty) {
                                        if (controller
                                            .pPriceCon.text.isNotEmpty) {
                                          if (controller
                                              .pDetailsCon.text.isNotEmpty) {
                                            if (widget.mapData!.isNotEmpty) {
                                              controller.loading.value = true;
                                              ApiUtilsAllFiles.getupdateProduct(
                                                id: controller.listofBuisness[
                                                    controller
                                                        .buisnessIDforProduct
                                                        .value]['business_id'],
                                                controller: controller,
                                                product_id: widget.ProductID,
                                                img1:
                                                    '${widget.mapData!['pimage1']}',
                                                img2:
                                                    '${widget.mapData!['pimage2']}',
                                                img3:
                                                    '${widget.mapData!['pimage3']}',
                                              );
                                            } else {
                                              if (controller.isf1.value) {
                                                controller.loading.value = true;
                                                ApiUtilsAllFiles.gethomeproducts(
                                                    controller,
                                                    controller.listofBuisness[
                                                        controller
                                                            .buisnessIDforProduct
                                                            .value]['business_id']);
                                              } else {
                                                snackBarFailer(
                                                    'Please upload minimum 1 image(fist box)'
                                                        .tr);
                                              }
                                            }
                                          } else {
                                            snackBarFailer(
                                                'Please enter Product details'
                                                    .tr);
                                          }
                                        } else {
                                          snackBarFailer(
                                              'Please enter Price!'.tr);
                                        }
                                      } else {
                                        snackBarFailer(
                                            'Please enter Product Name!'.tr);
                                      }
                                    } else {
                                      snackBarFailer(
                                          'Please select Business first'.tr);
                                    }
                                  } else {
                                    snackBarFailer(
                                        'Please select city first'.tr);
                                  }
                                },
                                child: Container(
                                  height: height * 0.070,
                                  width: width,
                                  child: Center(
                                    child: Text(
                                      widget.mapData!.isNotEmpty
                                          ? 'Update'.tr
                                          : 'Add Product'.tr,
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
                    ),
                  )
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
