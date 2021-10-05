import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/AddProduct.dart/AddProduct.dart';
import 'package:dail_box/Screens/AddService/AddService.dart';
import 'package:dail_box/Screens/ImagePreview/ImagePreview.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingdDetails.dart';
import 'package:dail_box/Screens/SearchDetail/SearchDetailsController.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SearchDetails extends StatefulWidget {
  final String? buisinessId;
  final String? fromApi;
  final String? name;
  final String? b_ID;
  final Map? userId;

  const SearchDetails({
    Key? key,
    this.buisinessId,
    this.fromApi,
    this.name,
    this.b_ID,
    this.userId,
  }) : super(key: key);

  @override
  _SearchDetailsState createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  final controller = Get.put(SearchDetailsController());
  GetStorage storage = GetStorage();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      controller.loadData.value = false;
      await ApiUtils.getgetbussniesname(
          controller: controller, b_id: widget.b_ID);
      if (widget.fromApi == 'product') {
        await ApiUtils.getgetproduct(
            controller: controller, id: widget.buisinessId);
        await ApiUtils.getgetproductallreview(
            controller: controller, id: widget.buisinessId);
        controller.loadData.value = true;
      } else if (widget.fromApi == 'service') {
        await ApiUtils.getgetservice(
            controller: controller, id: widget.buisinessId);
        await ApiUtils.getgetserviceallreview(
            controller: controller, id: widget.buisinessId);
        controller.loadData.value = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (s, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            widget.fromApi == 'service'
                ? 'Service Details'.tr
                : 'Product Details'.tr,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          actions: [
            Obx(() => storage.read('userId') != controller.userId.value
                ? SizedBox()
                : Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (widget.fromApi == 'service') {
                            Get.to(AddService(
                              mapData: controller.listofForService[0],
                            ));
                          } else {
                            Get.to(AddProduct(
                              mapData: controller.listofData[0],
                              buisinessID: widget.buisinessId,
                              ProductID: widget.buisinessId,
                            ));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Center(child: Text('Update')),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          controller.loading.value = true;
                          if (widget.fromApi == 'service') {
                            ApiUtilsForAll.getserviceRemove(
                                controller: controller,
                                b_id:
                                    '${controller.listofForService[0]['id']}');
                          } else {
                            ApiUtilsForAll.getproductRemove(
                                controller: controller,
                                b_id: '${controller.listofData[0]['id']}');
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ))
          ],
          centerTitle: true,
          backgroundColor: blueColor,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Text(
                                '${controller.nameofBuiseness}',
                                overflow: TextOverflow.ellipsis,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: blueColor,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${widget.name}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => !controller.loadData.value
                          ? SizedBox(
                              height: height,
                              width: width,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: blueColor,
                                ),
                              ),
                            )
                          : widget.fromApi == 'service'
                              ? SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: findLanguageController
                                            .isEnglishLocale.value
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: height * 0.020,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${controller.listofForService[0]['s_name']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          storage.read('userId') ==
                                                  '${controller.listofForService[0]['user_id']}'
                                              ? SizedBox()
                                              : InkWell(
                                                  onTap: () {
                                                    ratingDailog(
                                                        productId:
                                                            widget.buisinessId);
                                                  },
                                                  child: Container(
                                                    height: height * 0.040,
                                                    width: width * 0.350,
                                                    child: Center(
                                                      child: Text(
                                                        'Rate Service'.tr,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: blueColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${controller.listofForService[0]['rating'] ?? 0.0}',
                                            style: TextStyle(
                                                fontSize: 12, color: blueColor),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                          Row(
                                            children: [1, 2, 3, 4, 5].map((e) {
                                              int value = double.parse(
                                                      '${controller.listofForService[0]['rating'] ?? '0.0'}')
                                                  .toInt();
                                              return value >= e
                                                  ? InkWell(
                                                      child: Icon(
                                                        Icons.star,
                                                        size: 16,
                                                        color:
                                                            Colors.yellow[700],
                                                      ),
                                                    )
                                                  : InkWell(
                                                      child: Icon(
                                                        Icons.star_border,
                                                        size: 16,
                                                        color:
                                                            Colors.yellow[700],
                                                      ),
                                                    );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                          Text(
                                            'reviews'.tr +
                                                ' ${controller.listofForService[0]['total_review']}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black26),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      Text(
                                        '${controller.listofForService[0]['s_details']}',
                                        style: TextStyle(
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      Text(
                                        findLanguageController
                                                .isEnglishLocale.value
                                            ? 'Starting Cost : ${controller.listofForService[0]['s_cost']} RS/-'
                                            : ' ${controller.listofForService[0]['s_cost']} ' +
                                                'RS/-' +
                                                ':' +
                                                'Starting Cost'.tr,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: blueColor),
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      findLanguageController
                                              .isEnglishLocale.value
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'City :'.tr,
                                                  style: TextStyle(
                                                      color: blueColor),
                                                ),
                                                Expanded(
                                                  child: Text(controller
                                                          .listofForService
                                                          .isEmpty
                                                      ? ''
                                                      : ' ${controller.listofForService[0]['service_cities']}'),
                                                )
                                              ],
                                            )
                                          : Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(controller.listofForService
                                                        .isEmpty
                                                    ? ''
                                                    : ' ${controller.listofForService[0]['service_cities']} :'),
                                                Text(
                                                  'City :'
                                                      .tr
                                                      .replaceAll(':', ''),
                                                  style: TextStyle(
                                                      color: blueColor),
                                                ),
                                              ],
                                            ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Get.to(RecentListingsDetails(
                                          //   id: controller
                                          //       .listofmostrecentlisting[
                                          //   i]['id'],
                                          //   businessId: controller
                                          //       .listofmostrecentlisting[
                                          //   i]['business_id'],
                                          //   name: controller
                                          //       .listofmostrecentlisting[
                                          //   i]['business_name'],
                                          // ));
                                          printlog(
                                              '${controller.listAllData[0]['id']}');
                                          printlog(
                                              '${controller.listAllData[0]['business_id']}');
                                          printlog('${widget.name}');
                                          Get.to(() => RecentListingsDetails(
                                                id: controller.listAllData[0]
                                                    ['id'],
                                                businessId:
                                                    controller.listAllData[0]
                                                        ['business_id'],
                                                name: controller.listAllData[0]
                                                    ['business_name'],
                                              ));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              findLanguageController
                                                      .isEnglishLocale.value
                                                  ? MainAxisAlignment.start
                                                  : MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Center(
                                                child: Text(
                                                  'View Business'.tr,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  color: blueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.020,
                                      ),
                                      Text(
                                        'Rating & Reviews'.tr,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: controller.listofReview
                                            .map((element) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CircularProfileAvatar(
                                                  '${element['user_profile']}',
                                                  elevation: 2,
                                                  radius: 20,
                                                ),
                                                SizedBox(
                                                  width: width * 0.040,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '${element['user_name']}',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Row(
                                                        children: [
                                                          1,
                                                          2,
                                                          3,
                                                          4,
                                                          5
                                                        ].map((e) {
                                                          int value = int.parse(
                                                              '${element['service_rating'] ?? '0'}');
                                                          return value >= e
                                                              ? InkWell(
                                                                  child: Icon(
                                                                    Icons.star,
                                                                    size: 16,
                                                                    color: Colors
                                                                            .yellow[
                                                                        700],
                                                                  ),
                                                                )
                                                              : InkWell(
                                                                  child: Icon(
                                                                    Icons
                                                                        .star_border,
                                                                    size: 16,
                                                                    color: Colors
                                                                            .yellow[
                                                                        700],
                                                                  ),
                                                                );
                                                        }).toList(),
                                                      ),
                                                      Text(
                                                        '${element['service_rview']}',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ],
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: height * 0.040,
                                      ),
                                    ],
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: findLanguageController
                                            .isEnglishLocale.value
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: height * 0.020,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(ImagePreview(
                                            listofImage: [
                                              '${controller.listofData[0]['pimage1']}',
                                              '${controller.listofData[0]['pimage2']}',
                                              '${controller.listofData[0]['pimage3']}'
                                            ],
                                          ));
                                        },
                                        child: Container(
                                          height: height * 0.3,
                                          width: width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: blueColor),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: CachedNetworkImage(
                                              height: double.infinity,
                                              width: width * 0.360,
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  '${controller.listofData[0]['pimage1']}',
                                              placeholder: (context, url) =>
                                                  ShimerEffect(
                                                child: SizedBox(
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                ),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Image.network(
                                                      'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.020,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(ImagePreview(
                                                listofImage: [
                                                  '${controller.listofData[0]['pimage1']}',
                                                  '${controller.listofData[0]['pimage2']}',
                                                  '${controller.listofData[0]['pimage3']}'
                                                ],
                                              ));
                                            },
                                            child: Container(
                                              height: height * 0.1,
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: blueColor),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  height: double.infinity,
                                                  width: width * 0.360,
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      '${controller.listofData[0]['pimage2']}',
                                                  placeholder: (context, url) =>
                                                      ShimerEffect(
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                    ),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.network(
                                                          'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.030,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(ImagePreview(
                                                listofImage: [
                                                  '${controller.listofData[0]['pimage1']}',
                                                  '${controller.listofData[0]['pimage2']}',
                                                  '${controller.listofData[0]['pimage3']}'
                                                ],
                                              ));
                                            },
                                            child: Container(
                                              height: height * 0.1,
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: blueColor),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  height: double.infinity,
                                                  width: width * 0.360,
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      '${controller.listofData[0]['pimage3']}',
                                                  placeholder: (context, url) =>
                                                      ShimerEffect(
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                    ),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.network(
                                                          'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.020,
                                      ),
                                      SizedBox(
                                        height: height * 0.020,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${controller.listofData[0]['pname']}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          storage.read('userId') ==
                                                  '${controller.listofData[0]['user_id']}'
                                              ? SizedBox()
                                              : InkWell(
                                                  onTap: () {
                                                    ratingDailog(
                                                        productId:
                                                            widget.buisinessId);
                                                  },
                                                  child: Container(
                                                    height:
                                                        findLanguageController
                                                                .isEnglishLocale
                                                                .value
                                                            ? height * 0.040
                                                            : height * 0.055,
                                                    width: width * 0.350,
                                                    child: Center(
                                                      child: Text(
                                                        'Rate Product'.tr,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: blueColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${controller.listofData[0]['rating'] ?? 0.0}',
                                            style: TextStyle(
                                                fontSize: 12, color: blueColor),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                          Row(
                                            children: [1, 2, 3, 4, 5].map((e) {
                                              int value = double.parse(
                                                      '${controller.listofData[0]['rating'] ?? '0.0'}')
                                                  .toInt();
                                              return value >= e
                                                  ? InkWell(
                                                      child: Icon(
                                                        Icons.star,
                                                        size: 16,
                                                        color:
                                                            Colors.yellow[700],
                                                      ),
                                                    )
                                                  : InkWell(
                                                      child: Icon(
                                                        Icons.star_border,
                                                        size: 16,
                                                        color:
                                                            Colors.yellow[700],
                                                      ),
                                                    );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                          Text(
                                            'reviews'.tr+' ${controller.listofData[0]['total_review']}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black26),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      Text(
                                        '${controller.listofData[0]['p_details']}',
                                        style: TextStyle(
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      Text(
                                        findLanguageController
                                                .isEnglishLocale.value
                                            ? 'Price : ${controller.listofData[0]['pprice']} Rs/-'
                                            : 'Price'.tr +
                                                ': Rs/-' +
                                                ' : ${controller.listofData[0]['pprice']} ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: blueColor),
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      findLanguageController
                                              .isEnglishLocale.value
                                          ? Row(
                                              children: [
                                                Text(
                                                  'City :'.tr,
                                                  style: TextStyle(
                                                      color: blueColor),
                                                ),
                                                Text(controller
                                                        .listofData.isEmpty
                                                    ? ''
                                                    : ' ${controller.listofData[0]['product_cities']}')
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(controller
                                                        .listofData.isEmpty
                                                    ? ''
                                                    : ' ${controller.listofData[0]['product_cities']} :'),
                                                Text(
                                                  'City :'
                                                      .tr
                                                      .replaceAll(':', ''),
                                                  style: TextStyle(
                                                      color: blueColor),
                                                ),
                                              ],
                                            ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          printlog(
                                              '${controller.listAllData[0]['id']}');
                                          printlog(
                                              '${controller.listAllData[0]['business_id']}');
                                          printlog('${widget.name}');
                                          Get.to(() => RecentListingsDetails(
                                                id: controller.listAllData[0]
                                                    ['id'],
                                                businessId:
                                                    controller.listAllData[0]
                                                        ['business_id'],
                                                name: controller.listAllData[0]
                                                    ['business_name'],
                                              ));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              findLanguageController
                                                      .isEnglishLocale.value
                                                  ? MainAxisAlignment.start
                                                  : MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              child: Center(
                                                child: Text(
                                                  'View Business'.tr,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  color: blueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              padding: EdgeInsets.all(10),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.020,
                                      ),
                                      Text(
                                        'Rate and Reviews'.tr,
                                        textAlign: findLanguageController
                                                .isEnglishLocale.value
                                            ? TextAlign.left
                                            : TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: controller.listofReview
                                            .map((element) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CircularProfileAvatar(
                                                  '${element['user_profile']}',
                                                  elevation: 2,
                                                  radius: 20,
                                                ),
                                                SizedBox(
                                                  width: width * 0.040,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '${element['user_name']}',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Row(
                                                        children: [
                                                          1,
                                                          2,
                                                          3,
                                                          4,
                                                          5
                                                        ].map((e) {
                                                          int value = int.parse(
                                                              '${element['product_rating'] ?? '0'}');
                                                          return value >= e
                                                              ? InkWell(
                                                                  child: Icon(
                                                                    Icons.star,
                                                                    size: 16,
                                                                    color: Colors
                                                                            .yellow[
                                                                        700],
                                                                  ),
                                                                )
                                                              : InkWell(
                                                                  child: Icon(
                                                                    Icons
                                                                        .star_border,
                                                                    size: 16,
                                                                    color: Colors
                                                                            .yellow[
                                                                        700],
                                                                  ),
                                                                );
                                                        }).toList(),
                                                      ),
                                                      Text(
                                                        '${element['product_rview']}',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ],
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: height * 0.040,
                                      ),
                                    ],
                                  ),
                                  physics: BouncingScrollPhysics(),
                                ),
                    ),
                  ],
                ),
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

  ratingDailog({String? productId}) {
    int rating = 0;
    var height = Get.height;
    var width = Get.width;
    List list = [1, 2, 3, 4, 5];
    List listofCheck = [false, false, false, false, false];
    TextEditingController tecCon = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return FlipInX(
              child: Dialog(
                insetPadding:
                    EdgeInsets.only(left: width / 20, right: width / 20),
                child: Container(
                  height: height / 2.2,
                  width: width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 30,
                      ),
                      Center(
                          child: Text(
                        'Rate your experience'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      )),
                      SizedBox(
                        height: height / 50,
                      ),
                      Row(
                        children: list.map((e) {
                          int index = list.indexOf(e);
                          return listofCheck[index] == false
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 50, right: width / 50),
                                  child: InkWell(
                                    onTap: () {
                                      for (var i = 0;
                                          i < listofCheck.length;
                                          i++) {
                                        setState(() {
                                          listofCheck[i] = false;
                                        });
                                      }
                                      for (var i = 0; i < index + 1; i++) {
                                        setState(() {
                                          listofCheck[i] = true;
                                        });
                                      }
                                      rating = index + 1;
                                    },
                                    child: Container(
                                      child: Image.asset(
                                        'assets/images/star.png',
                                        color: Colors.black26,
                                      ),
                                      height: height / 20,
                                      width: width / 10,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 50, right: width / 50),
                                  child: InkWell(
                                    onTap: () {
                                      for (var i = 0;
                                          i < listofCheck.length;
                                          i++) {
                                        setState(() {
                                          listofCheck[i] = false;
                                        });
                                      }
                                      for (var i = 0; i < index + 1; i++) {
                                        setState(() {
                                          listofCheck[i] = true;
                                        });
                                      }
                                      rating = index + 1;
                                    },
                                    child: Container(
                                      child: Image.asset(
                                        'assets/images/star.png',
                                        color: Colors.yellow[700],
                                      ),
                                      height: height / 20,
                                      width: width / 10,
                                    ),
                                  ),
                                );
                        }).toList(),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: width / 20, right: width / 20),
                          child: GenaricTextField(
                            botomwidth: height / 50,
                            line: 5,
                            topwidth: height / 50,
                            controller: tecCon,
                          )),
                      SizedBox(
                        height: height / 40,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (listofCheck.contains(true)) {
                                if (tecCon.text.isNotEmpty) {
                                  if (widget.fromApi == 'product') {
                                    Navigator.of(context).pop();
                                    ApiUtils.getgiveproductrate(
                                            product_id: productId,
                                            product_rating: '$rating',
                                            product_review: tecCon.text)
                                        .then((value) {
                                      ApiUtils.getgetproduct(
                                          controller: controller,
                                          id: widget.buisinessId);
                                      ApiUtils.getgetproductallreview(
                                          controller: controller,
                                          id: widget.buisinessId);
                                    });
                                  } else {
                                    Navigator.of(context).pop();
                                    ApiUtils.getgiveservicerate(
                                            product_id: productId,
                                            product_rating: '$rating',
                                            product_review: tecCon.text)
                                        .then((value) {
                                      ApiUtils.getgetservice(
                                          controller: controller,
                                          id: widget.buisinessId);
                                      ApiUtils.getgetserviceallreview(
                                          controller: controller,
                                          id: widget.buisinessId);
                                    });
                                  }
                                } else {
                                  Navigator.of(context).pop();
                                  snackBarFailer('Please enter review!'.tr);
                                }
                              } else {
                                Navigator.of(context).pop();
                                snackBarFailer('Please select rating!'.tr);
                              }
                            },
                            child: Container(
                              height: height * 0.045,
                              width: width * 0.3,
                              child: Center(
                                child: Text(
                                  'Rate'.tr,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class GenaricTextField extends StatefulWidget {
  final TextEditingController? controller;
  final int? line;
  final double? topwidth;
  final double? botomwidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  final bool? isnumber;
  final double? borderraduius;

  GenaricTextField(
      {Key? key,
      @required this.controller,
      @required this.line,
      @required this.topwidth,
      @required this.botomwidth,
      this.prefixIcon,
      this.hint,
      this.borderraduius = 30,
      this.isnumber,
      this.suffixIcon})
      : super(key: key);

  @override
  _GenaricTextFieldState createState() => _GenaricTextFieldState();
}

class _GenaricTextFieldState extends State<GenaricTextField> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.line,
      textInputAction: TextInputAction.done,
      keyboardType: widget.isnumber == true ? TextInputType.number : null,
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(fontSize: 10),
          border: InputBorder.none,
          focusColor: Colors.black26,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(widget.borderraduius!)),
          contentPadding: EdgeInsets.only(
              left: width / 20,
              right: width / 20,
              top: widget.topwidth!,
              bottom: widget.botomwidth!),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.circular(widget.borderraduius!)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.circular(widget.borderraduius!))),
      style: TextStyle(color: Colors.black, fontSize: 14),
    );
  }
}
