import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/Profile/AnotherProfileController.dart';
import 'package:dail_box/Screens/Profile/ProfileController.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/ChatBoxController.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'ViewAllLike/ViewAllLike.dart';
import 'ViewComments/ViewComments.dart';

callanotherProfile() {
  final controller = Get.find<ProfileController>();
  controller.loadmainList.value = false;
  // controller.callApiData(
  //     controller: controller, userId: AnotherProfile.newuserid);
}

class AnotherProfile extends StatefulWidget {
  static String newuserid = '';
  final String? userId;

  const AnotherProfile({Key? key, this.userId}) : super(key: key);

  @override
  _AnotherProfileState createState() => _AnotherProfileState();
}

class _AnotherProfileState extends State<AnotherProfile> {
  final controller = Get.put(AnotherProfileController());

  @override
  void initState() {
    AnotherProfile.newuserid = '${widget.userId}';
    print('${widget.userId}');
    getApiData();
    super.initState();
  }

  getApiData() async {
    await ApiUtils.getuserprofile(
        controller: controller, user_id: '${widget.userId}');
    await ApiUtils.getuserActivity(
        controller: controller, user_id: '${widget.userId}');
    await ApiUtils.getgetUserbusinesslist(
        controller: controller, user_id: '${widget.userId}');
    controller.loading.value = true;
  }

  int currentTab = 1;
  GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  'Profile'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: blueColor,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
              child: Obx(
            () => !controller.loading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: CircularProfileAvatar(
                                '${controller.profileData['profile_image']}',
                                borderColor: Colors.black,
                                borderWidth: 0.5,
                                elevation: 3,
                                radius: 50,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${controller.profileData['user_name']}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      InkWell(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: currentTab != 1
                                                        ? Colors.white
                                                        : blueColor,
                                                    border: Border.all(
                                                        color: currentTab != 1
                                                            ? Colors.black38
                                                            : blueColor)),
                                                padding: EdgeInsets.all(10),
                                                child: Icon(
                                                  CupertinoIcons
                                                      .rectangle_grid_2x2,
                                                  color: currentTab != 1
                                                      ? Colors.black45
                                                      : Colors.white,
                                                  size: 22,
                                                )),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Activities'.tr,
                                              style: TextStyle(
                                                  color: currentTab == 1
                                                      ? Colors.black
                                                      : Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                        onTap: () {
                                          setState(() {
                                            currentTab = 1;
                                          });
                                        },
                                      ),
                                      // InkWell(
                                      //   onTap: () {
                                      //     setState(() {
                                      //       currentTab = 2;
                                      //     });
                                      //   },
                                      //   child: Column(
                                      //     children: <Widget>[
                                      //       Container(
                                      //         decoration: BoxDecoration(
                                      //             shape: BoxShape.circle,
                                      //             color: currentTab == 2
                                      //                 ? blueColor
                                      //                 : Colors.white,
                                      //             border: Border.all(
                                      //                 color: greyColor)),
                                      //         padding: EdgeInsets.all(10),
                                      //         child: Container(
                                      //           child: Icon(
                                      //             Icons
                                      //                 .business_center_outlined,
                                      //             color: currentTab == 2
                                      //                 ? Colors.white
                                      //                 : Colors.black26,
                                      //           ),
                                      //           height: 20,
                                      //         ),
                                      //       ),
                                      //       SizedBox(
                                      //         height: 5,
                                      //       ),
                                      //       Text(
                                      //         'Business'.tr,
                                      //         style: TextStyle(
                                      //             color: Colors.black,
                                      //             fontSize: 10),
                                      //       )
                                      //     ],
                                      //   ),
                                      // ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            currentTab = 3;
                                          });
                                        },
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: currentTab == 3
                                                        ? blueColor
                                                        : Colors.white,
                                                    border: Border.all(
                                                        color: currentTab != 3
                                                            ? greyColor
                                                            : blueColor)),
                                                padding: EdgeInsets.all(10),
                                                child: Icon(
                                                  CupertinoIcons.person,
                                                  color: currentTab != 3
                                                      ? greyColor
                                                      : Colors.white,
                                                  size: 22,
                                                )),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Information'.tr,
                                              style: TextStyle(
                                                  color: currentTab == 3
                                                      ? Colors.black
                                                      : Colors.grey,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    thickness: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      currentTab == 3
                          ? SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.030,
                                    vertical: width * 0.030),
                                child: Column(
                                  crossAxisAlignment: findLanguageController
                                          .isEnglishLocale.value
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.end,
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Experience'.tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Text(
                                      getexperiance(),
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 11),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: width,
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Text(
                                      'Education'.tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Text(
                                      getEducation(),
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 11),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: width,
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),

                                    Row(
                                      mainAxisAlignment: findLanguageController
                                              .isEnglishLocale.value
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Skills'.tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Text(
                                      controller.profileData['skills'] == null
                                          ? ''
                                          : getskill(),
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 11),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: width,
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Text(
                                      'Volunteering'.tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Text(
                                      controller.profileData['volunteering'] ==
                                              null
                                          ? ''
                                          : getvolunteering(),
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 11),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: width,
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Text(
                                      'Accomplishments'.tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Text(
                                      controller.profileData[
                                                  'accomplishments'] ==
                                              null
                                          ? ''
                                          : getaccomplishments(),
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 11),
                                    ),
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: width,
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: height * 0.040,
                                    ),
                                    // Text(
                                    //   'Contact',
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 15),
                                    // ),
                                    // SizedBox(
                                    //   height: height * 0.010,
                                    // ),
                                    // Text(
                                    //   controller.profileData['email'] == null
                                    //       ? ''
                                    //       : '${controller.profileData['email'] ?? ''}\n${controller.profileData['mobile'] ?? ''}',
                                    //   style: TextStyle(
                                    //       color: Colors.black26, fontSize: 11),
                                    // ),
                                    // SizedBox(
                                    //   height: height * 0.010,
                                    // ),
                                    // Container(
                                    //   height: 0.5,
                                    //   width: width,
                                    //   color: Colors.black.withOpacity(0.2),
                                    // )
                                  ],
                                ),
                              ),
                            )
                          : currentTab == 2
                              ? Obx(() => controller.listofListings.isEmpty
                                  ? SliverToBoxAdapter(
                                      child: Center(
                                        child: Text('Empty'.tr),
                                      ),
                                    )
                                  : SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (context, int i) {
                                          // To convert this infinite list to a list with three items,
                                          // uncomment the following line:
                                          // if (index > 3) return null;
                                          return Container(
                                            height: height * 0.2,
                                            width: width,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.030),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors.black12,
                                                        width: 0.5))),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: height * 0.150,
                                                  width: width * 0.300,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: blueColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    child: CachedNetworkImage(
                                                      height: double.infinity,
                                                      fit: BoxFit.fill,
                                                      imageUrl:
                                                          "${controller.listofListings[i]['listing_image']}",
                                                      placeholder:
                                                          (context, url) =>
                                                              SpinKitWave(
                                                        color: Colors.blue,
                                                        size: 12.0,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
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
                                                      '${controller.listofListings[i]['user_name']}',
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Colors.black26),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      '${controller.listofListings[i]['business_description']}',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color:
                                                              Colors.black26),
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
                                                              color: Colors
                                                                  .black26),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.015,
                                                        ),
                                                        Row(
                                                          children: [
                                                            1,
                                                            2,
                                                            3,
                                                            4,
                                                            5
                                                          ].map((e) {
                                                            int value =
                                                                double.parse(
                                                                        '${controller.listofListings[i]['rating'] ?? '0.0'}')
                                                                    .toInt();
                                                            return value >= e
                                                                ? InkWell(
                                                                    child: Icon(
                                                                      Icons
                                                                          .star,
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
                                                              color: Colors
                                                                  .black26),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.010,
                                                    ),
                                                    // storage.read('userId') ==
                                                    //         '${controller.listofListings[i]['user_posted_id']}'
                                                    //     ? SizedBox()
                                                    //     : Row(
                                                    //         children: [
                                                    //           InkWell(
                                                    //             child: Container(
                                                    //               height: height *
                                                    //                   0.040,
                                                    //               width: width *
                                                    //                   0.220,
                                                    //               child: Row(
                                                    //                 mainAxisAlignment:
                                                    //                     MainAxisAlignment
                                                    //                         .center,
                                                    //                 crossAxisAlignment:
                                                    //                     CrossAxisAlignment
                                                    //                         .center,
                                                    //                 children: [
                                                    //                   Icon(
                                                    //                     Icons
                                                    //                         .call,
                                                    //                     color: Colors
                                                    //                         .white,
                                                    //                     size: 15,
                                                    //                   ),
                                                    //                   SizedBox(
                                                    //                     width: 5,
                                                    //                   ),
                                                    //                   Text(
                                                    //                     'Call',
                                                    //                     style: TextStyle(
                                                    //                         color: Colors
                                                    //                             .white,
                                                    //                         fontSize:
                                                    //                             10),
                                                    //                   )
                                                    //                 ],
                                                    //               ),
                                                    //               decoration:
                                                    //                   BoxDecoration(
                                                    //                 color:
                                                    //                     blueColor,
                                                    //                 borderRadius:
                                                    //                     BorderRadius
                                                    //                         .circular(
                                                    //                             5),
                                                    //               ),
                                                    //             ),
                                                    //             onTap: () {
                                                    //               // launchURL(
                                                    //               //     "tel://${controller.listofListings[0]['cell_number']}");
                                                    //             },
                                                    //           ),
                                                    //           SizedBox(
                                                    //             width:
                                                    //                 width * 0.020,
                                                    //           ),
                                                    //           InkWell(
                                                    //             onTap: () {
                                                    //               // sendMessage(
                                                    //               //     controller:
                                                    //               //     controller,
                                                    //               //     index: i);
                                                    //             },
                                                    //             child: Container(
                                                    //               height: height *
                                                    //                   0.040,
                                                    //               width: width *
                                                    //                   0.220,
                                                    //               child: Row(
                                                    //                 mainAxisAlignment:
                                                    //                     MainAxisAlignment
                                                    //                         .center,
                                                    //                 crossAxisAlignment:
                                                    //                     CrossAxisAlignment
                                                    //                         .center,
                                                    //                 children: [
                                                    //                   Icon(
                                                    //                     Icons
                                                    //                         .messenger_outline,
                                                    //                     color:
                                                    //                         blueColor,
                                                    //                     size: 15,
                                                    //                   ),
                                                    //                   SizedBox(
                                                    //                     width: 5,
                                                    //                   ),
                                                    //                   Text(
                                                    //                     'Message',
                                                    //                     style: TextStyle(
                                                    //                         color:
                                                    //                             blueColor,
                                                    //                         fontSize:
                                                    //                             10),
                                                    //                   )
                                                    //                 ],
                                                    //               ),
                                                    //               decoration: BoxDecoration(
                                                    //                   borderRadius:
                                                    //                       BorderRadius
                                                    //                           .circular(
                                                    //                               5),
                                                    //                   border: Border.all(
                                                    //                       width:
                                                    //                           1,
                                                    //                       color:
                                                    //                           blueColor)),
                                                    //             ),
                                                    //           ),
                                                    //         ],
                                                    //       )
                                                  ],
                                                )),
                                                // storage.read('userId') ==
                                                //         '${controller.listofListings[i]['user_posted_id']}'
                                                //     ? SizedBox()
                                                //     : '${controller.listofListings[i]['islike']}' ==
                                                //             'false'
                                                //         ? InkWell(
                                                //             onTap: () async {
                                                //               // await ApiUtilsForAll
                                                //               //     .getlike(
                                                //               //     id:
                                                //               //     '${controller.listofListings[i]['business_id']}',
                                                //               //     controller:
                                                //               //     controller,
                                                //               //     index: i);
                                                //               // setState(() {});
                                                //             },
                                                //             child: Icon(
                                                //               CupertinoIcons
                                                //                   .suit_heart,
                                                //               color:
                                                //                   Colors.black38,
                                                //             ),
                                                //           )
                                                //         : InkWell(
                                                //             onTap: () async {
                                                //               // await ApiUtilsForAll
                                                //               //     .getlike(
                                                //               //     id:
                                                //               //     '${controller.listofListings[i]['business_id']}',
                                                //               //     controller:
                                                //               //     controller,
                                                //               //     index: i,
                                                //               //     isLike: false);
                                                //               // setState(() {});
                                                //             },
                                                //             child: Icon(
                                                //               CupertinoIcons
                                                //                   .suit_heart_fill,
                                                //               color: blueColor,
                                                //             ),
                                                //           )
                                              ],
                                            ),
                                          );
                                        },
                                        // Or, uncomment the following line:
                                        childCount:
                                            controller.listofListings.length,
                                      ),
                                    ))
                              : controller.userActivity.isEmpty
                                  ? SliverToBoxAdapter(
                                      child: Container(
                                        height: height * 0.4,
                                        child: Center(
                                          child: Text('Empty'.tr),
                                        ),
                                      ),
                                    )
                                  : SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                          return Column(
                                            children: [
                                              ChatBoxItemForAnotherProfile(
                                                mapData: controller
                                                    .userActivity[index],
                                                index: index,
                                              ),
                                              Divider(
                                                thickness: 15,
                                              ),
                                            ],
                                          );
                                        },
                                        childCount:
                                            controller.userActivity.length,
                                      ),
                                    )
                    ],
                    physics: BouncingScrollPhysics(),
                  ),
          ))
        ],
      ),
    );
  }

  String getexperiance() {
    String data = '';
    List list = controller.profileData['experience'] ?? [];
    print('eeeeeeee===== $list');
    for (var i = 0; i < list.length; i++) {
      data = data +
          'Company Name : ${list[i]['position'] ?? ''}\n' +
          'Position : ${list[i]['company_name'] ?? ''}\n' +
          'Time Duration : ${list[i]['time_duration'] ?? ''}\n\n';
    }
    return data;
  }

  String getEducation() {
    String data = '';
    List list = controller.profileData['education'] ?? [];
    print('eeeeeeee===== $list');
    for (var i = 0; i < list.length; i++) {
      data = data +
          'Degree type : ${list[i]['school_name'] ?? ''}\n' +
          'Institute : ${list[i]['degree_type'] ?? ''}\n' +
          'Time Duration : ${list[i]['start_end'] ?? ''}\n\n';
    }
    return data;
  }

  String getskill() {
    String data = '';
    List list = controller.profileData['skills'] ?? [];
    print('eeeeeeee===== $list');
    for (var i = 0; i < list.length; i++) {
      data = data + '${list[i]['skills'] ?? ''}\n';
    }
    return data;
  }

  String getvolunteering() {
    String data = '';
    List list = controller.profileData['volunteering'] ?? [];
    print('eeeeeeee===== $list');
    for (var i = 0; i < list.length; i++) {
      data = data + '${list[i]['details'] ?? ''}\n';
    }
    return data;
  }

  String getaccomplishments() {
    String data = '';
    List list = controller.profileData['accomplishments'] ?? [];
    print('eeeeeeee===== $list');
    for (var i = 0; i < list.length; i++) {
      data = data + '${list[i]['details'] ?? ''}\n';
    }
    return data;
  }
}

class ChatBoxItemForAnotherProfile extends StatefulWidget {
  final Map? mapData;
  final int? index;
  final ChatBoxController? controller;

  const ChatBoxItemForAnotherProfile(
      {Key? key, this.mapData, this.controller, this.index})
      : super(key: key);

  @override
  _ChatBoxItemForAnotherProfileState createState() =>
      _ChatBoxItemForAnotherProfileState();
}

class _ChatBoxItemForAnotherProfileState
    extends State<ChatBoxItemForAnotherProfile> {
  String? firstHalf;
  String? secondHalf;
  bool flag = true;

  List commitList = [];
  List Likelist = [];

  @override
  void initState() {
    String text = '${widget.mapData!['discussionform_text']}';

    if (text.length > 150) {
      firstHalf = text.substring(0, 150);
      secondHalf = text.substring(150, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('object = ${widget.mapData}');
    String value = widget.mapData!['date_time'].toString().split(' ')[0] +
        'T' +
        widget.mapData!['date_time'].toString().split(' ')[1];
    var time = DateFormat.jm().format(DateTime.parse(value));
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${widget.mapData!['profile_image']}'))),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.mapData!['user_name']}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    Text(
                      '${widget.mapData!['industy_name']} > ${widget.mapData!['industy_sub_name']}',
                      style: TextStyle(color: greyColor, fontSize: 10),
                    ),
                  ],
                ),
              ),
              Text(
                '${widget.mapData!['date_time'].toString().split(' ')[0]}' +
                    '  $time',
                style: TextStyle(color: greyColor, fontSize: 8),
              ),
              SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                  child: Icon(Icons.more_horiz),
                  onSelected: (v) {
                    repot(
                        user_id: widget.mapData!['user_id'],
                        post_id: widget.mapData!['business_id']);
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Report".tr),
                          value: 1,
                        ),
                      ])
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            width: width,
            child: secondHalf!.isEmpty
                ? new Text(
                    firstHalf!,
                    style: TextStyle(color: greyColor, fontSize: 12),
                  )
                : new Column(
                    children: <Widget>[
                      new Text(
                        flag
                            ? (firstHalf! + "...")
                            : (firstHalf! + secondHalf!),
                        style: TextStyle(color: greyColor, fontSize: 12),
                      ),
                      new InkWell(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Text(
                              flag ? "See more".tr : "See less".tr,
                              style: new TextStyle(color: blueColor),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                            print(flag);
                          });
                        },
                      ),
                    ],
                  ),
          ),
          SizedBox(
            height: height * 0.010,
          ),
          widget.mapData!['fourm_image'] == ''
              ? SizedBox()
              : ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: height * 0.2,
                    width: width,
                    child: CachedNetworkImage(
                      height: double.infinity,
                      fit: BoxFit.contain,
                      imageUrl: "${widget.mapData!['fourm_image']}",
                      placeholder: (context, url) => SpinKitWave(
                        color: Colors.blue,
                        size: 12.0,
                      ),
                      errorWidget: (context, url, error) => Image.network(
                          'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                    ),
                  ),
                ),
          SizedBox(
            height: height * 0.010,
          ),
          Container(
            color: greyColor,
            width: MediaQuery.of(context).size.width,
            height: 0.5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Get.to(ViewLike(
                      form_id: widget.mapData!['form_id'],
                    ));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.hand_thumbsup,
                        color: blueColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.mapData!['total_rating']} Likes',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Get.to(ViewComments(
                      form_id: widget.mapData!['form_id'],
                    ));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.chat_bubble,
                        color: blueColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.mapData!['total_review']} Comments',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
            padding: EdgeInsets.only(top: 10),
          )
        ],
      ),
    );
  }

  repot({String? post_id, String? report_comments, String? user_id}) {
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
                    'Report'.tr,
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
                          ApiUtilsForAll.reportlistings(
                              post_id: post_id,
                              report_comments: textCon.text,
                              user_id: user_id);
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                          snackBarFailer('Please type message to receiver'.tr);
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            'Report'.tr,
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
