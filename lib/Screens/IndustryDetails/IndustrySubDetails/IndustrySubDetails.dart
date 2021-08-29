import 'package:cached_network_image/cached_network_image.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingdDetails.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'IndustrySubDetailsController.dart';

class IndustrySubDetails extends StatefulWidget {
  final String? subId;
  final String? name;

  const IndustrySubDetails({Key? key, this.name = 'My Listings', this.subId})
      : super(key: key);

  @override
  _IndustrySubDetailsState createState() => _IndustrySubDetailsState();
}

class _IndustrySubDetailsState extends State<IndustrySubDetails> {
  final controller = Get.put(IndustrySubDetailsController());
  List list = ['Filter'.tr, 'Verified'.tr, 'Open Now'.tr, 'Top Rated'.tr];
  GetStorage storage = GetStorage();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 0), () {
      controller.listofListings.clear();
      controller.isLoadinglist.value = false;
    });
    ApiUtilsForAll.getgetmybusinesslistforListingss(
        controller: controller, subid: widget.subId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.name!,
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
              TextFormField(
                // controller: serchController.searchCon,
                cursorColor: Colors.black,
                // onChanged: (value) {
                //   if (value.length > 3) {
                //     ApiUtilsForAll.getsearchhome(serchController);
                //   } else {
                //     serchController.listofSearch.value = [];
                //   }
                // },
                decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: greyColor,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintStyle: TextStyle(color: greyColor, fontSize: 12),
                    hintText: "Search here".tr),
              ),
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
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'RMS Pack & Movers Service'.tr,
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
                                                    "https://dailboxx.websitescare.com/upload/listing/${controller.listofListings[i]['listing_image']}",
                                                placeholder: (context, url) =>
                                                    SpinKitWave(
                                                  color: Colors.blue,
                                                  size: 12.0,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
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
                                              storage.read('userId') ==
                                                      '${controller.listofListings[i]['user_posted_id']}'
                                                  ? SizedBox()
                                                  : Row(
                                                      children: [
                                                        InkWell(
                                                          child: Container(
                                                            height:
                                                                height * 0.040,
                                                            width:
                                                                width * 0.220,
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
                                                          onTap: () {
                                                            launchURL(
                                                                "tel://${controller.listofListings[0]['cell_number']}");
                                                          },
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.020,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            sendMessage(
                                                                controller:
                                                                    controller,
                                                                index: i);
                                                          },
                                                          child: Container(
                                                            height:
                                                                height * 0.040,
                                                            width:
                                                                width * 0.220,
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
                                                        ),
                                                      ],
                                                    )
                                            ],
                                          )),
                                          storage.read('userId') ==
                                                  '${controller.listofListings[i]['user_posted_id']}'
                                              ? SizedBox()
                                              : '${controller.listofListings[i]['islike']}' ==
                                                      'false'
                                                  ? InkWell(
                                                      onTap: () async {
                                                        await ApiUtilsForAll
                                                            .getlike(
                                                                id:
                                                                    '${controller.listofListings[i]['business_id']}',
                                                                controller:
                                                                    controller,
                                                                index: i);
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .suit_heart,
                                                        color: Colors.black38,
                                                      ),
                                                    )
                                                  : InkWell(
                                                      onTap: () async {
                                                        await ApiUtilsForAll
                                                            .getlike(
                                                                id:
                                                                    '${controller.listofListings[i]['business_id']}',
                                                                controller:
                                                                    controller,
                                                                index: i,
                                                                isLike: false);
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .suit_heart_fill,
                                                        color: blueColor,
                                                      ),
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
      ),
    );
  }

  sendMessage({IndustrySubDetailsController? controller, int? index}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController textCon = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width / 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: height / 2.50,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    'Send Message'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
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
                        cursorColor: Colors.black,
                        maxLines: 6,
                        keyboardType: TextInputType.text,
                        controller: textCon,
                        textInputAction: TextInputAction.done,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle:
                                TextStyle(color: greyColor, fontSize: 12),
                            hintText: "Enter message here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (textCon.text.isNotEmpty) {
                          ApiUtilsForAll.getmessage(
                              bussinies_id: controller!.listofListings[index!]
                                  ['business_id'],
                              from_msg: storage.read('userId'),
                              to_msg: controller.listofListings[index]
                                  ['user_posted_id'],
                              massages: textCon.text);
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                          snackBarFailer('Please type message to receiver');
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            'SEND'.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        });
  }
}

class LikeButton extends StatefulWidget {
  final String? buisinessId;

  const LikeButton({Key? key, this.buisinessId}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isresult = false;

  @override
  void initState() {
    getAPiData();
    super.initState();
  }

  getAPiData() {
    ApiUtilsForAll.getlike(id: widget.buisinessId);
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.suit_heart,
      color: Colors.black38,
    );
  }
}
