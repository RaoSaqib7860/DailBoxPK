import 'package:cached_network_image/cached_network_image.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingdDetails.dart';
import 'package:dail_box/Screens/bottomNav/Listings/ListingsController.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Listings extends StatefulWidget {
  final String? user_id;
  final String? name;

  const Listings({Key? key, this.user_id = '-1', this.name = 'My Listings'})
      : super(key: key);

  @override
  _ListingsState createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  final controller = Get.put(ListingsController());
  List list = ['Filter', 'Verified', 'Open Now', 'Top Rated'];
  GetStorage storage = GetStorage();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 0), () {
      controller.listofListings.clear();
      controller.isLoadinglist.value = false;
    });
    ApiUtilsForAll.getgetmybusinesslistforListings(
        controller: controller,
        id: widget.user_id == '-1' ? storage.read('userId') : widget.user_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.name!.tr,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        elevation: 0,
        backgroundColor: blueColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.030),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.030,
            ),
            Container(
              height: 1,
              width: width,
              color: Colors.black12,
            ),
            Obx(
              () => Expanded(
                  child: !controller.isLoadinglist.value
                      ? ListView.builder(
                          itemBuilder: (c, i) {
                            return ShimerEffect(
                              child: Container(
                                height: height * 0.2,
                                width: width,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black12,
                                            width: 1))),
                                child: Row(
                                  children: [
                                    Container(
                                      height: height * 0.150,
                                      width: width * 0.300,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.5, color: blueColor),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(2),
                                        child: Image.asset(
                                          'assets/images/nature.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.020,
                                    ),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                         findLanguageController.isEnglishLocale.value? CrossAxisAlignment.start: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'RMS Pack & Movers Service'.tr,
                                         // textAlign: findLanguageController.isEnglishLocale.value? TextAlign.left:TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'blue area islamabad'.tr,
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black26),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '4.0',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black26),
                                            ),
                                            SizedBox(
                                              width: width * 0.010,
                                            ),
                                            Row(
                                              children:
                                                  [1, 2, 3, 4, 5].map((e) {
                                                return InkWell(
                                                  child: Icon(
                                                    Icons.star,
                                                    size: 16,
                                                    color: Colors.yellow[700],
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                            Text(
                                              '125 reviews'.tr,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black26),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.010,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: height * 0.040,
                                              width: width * 0.220,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.call,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Call'.tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: blueColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.020,
                                            ),
                                            Container(
                                              height: height * 0.040,
                                              width: width * 0.220,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.messenger_outline,
                                                    color: blueColor,
                                                    size: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Message'.tr,
                                                    style: TextStyle(
                                                        color: blueColor,
                                                        fontSize: 10),
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: blueColor)),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                    Icon(
                                      CupertinoIcons.suit_heart,
                                      color: Colors.black38,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        )
                      : controller.listofListings.isEmpty
                          ? Center(
                              child: Text('Empty'.tr),
                            )
                          : ListView.builder(
                              itemBuilder: (c, i) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(RecentListingsDetails(
                                      id: controller.listofListings[i]['id'],
                                      businessId: controller.listofListings[i]
                                          ['business_id'],
                                      name: controller.listofListings[i]
                                          ['business_name'],
                                    ));
                                  },
                                  child: Container(
                                    height: height * 0.2,
                                    width: width,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black12,
                                                width: 1))),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height * 0.150,
                                          width: width * 0.300,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.5,
                                                  color: blueColor),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            child: CachedNetworkImage(
                                              height: double.infinity,
                                              fit: BoxFit.fill,
                                              imageUrl:
                                                  "${controller.listofListings[i]['listing_image']}",
                                              placeholder: (context, url) =>
                                                  SpinKitWave(
                                                color: Colors.blue,
                                                size: 12.0,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.network(
                                                          'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.020,
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.listofListings[i]['business_name']}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${controller.listofListings[i]['area']} ${controller.listofListings[i]['city']} ${controller.listofListings[i]['business_address']}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black26),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              '${controller.listofListings[i]['business_description']}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black26),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${controller.listofListings[i]['rating'] ?? '0.0'}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black26),
                                                ),
                                                SizedBox(
                                                  width: width * 0.015,
                                                ),
                                                Row(
                                                  children: [1, 2, 3, 4, 5]
                                                      .map((e) {
                                                    int value = double.parse(
                                                            '${controller.listofListings[i]['rating'] ?? '0.0'}')
                                                        .toInt();
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
                                                SizedBox(
                                                  width: width * 0.015,
                                                ),
                                                Text(
                                                  '${controller.listofListings[i]['reviews']}' +
                                                      '  reviews',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black26),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.010,
                                            ),
                                            widget.user_id == '-1'
                                                ? SizedBox()
                                                : Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                            height * 0.040,
                                                        width: width * 0.220,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.call,
                                                              color: Colors
                                                                  .white,
                                                              size: 15,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'Call'.tr,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10),
                                                            )
                                                          ],
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: blueColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.020,
                                                      ),
                                                      Container(
                                                        height:
                                                            height * 0.040,
                                                        width: width * 0.220,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .messenger_outline,
                                                              color:
                                                                  blueColor,
                                                              size: 15,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'Message'.tr,
                                                              style: TextStyle(
                                                                  color:
                                                                      blueColor,
                                                                  fontSize:
                                                                      10),
                                                            )
                                                          ],
                                                        ),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                width: 1,
                                                                color:
                                                                    blueColor)),
                                                      ),
                                                    ],
                                                  )
                                          ],
                                        )),
                                        widget.user_id == '-1'
                                            ? SizedBox()
                                            : Icon(
                                                CupertinoIcons.suit_heart,
                                                color: Colors.black38,
                                              )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: controller.listofListings.length,
                            )),
            )
          ],
        ),
      ),
    );
  }
}
