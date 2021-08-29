import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/Screens/MessageDetails/MessageDetails.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'MessageController.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  var controller = Get.put(MessageController());

  @override
  void initState() {
    ApiUtils.getgetAllMyMessages();
    controller.callBackgroundSms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chat'.tr,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        elevation: 0,
        backgroundColor: blueColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
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
                      // controller: controller.nameCon,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintStyle: TextStyle(color: greyColor, fontSize: 14),
                          hintText: "Search here".tr),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(15),
          //   child: Column(
          //     children: <Widget>[
          //       SizedBox(
          //         height: 10,
          //       ),
          //       ClipRRect(
          //         borderRadius: BorderRadius.circular(5.0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(5.0),
          //             color: Colors.grey[100],
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey[400]!,
          //                 offset: Offset(0.0, 1.0), //(x,y)
          //                 blurRadius: 6.0,
          //               ),
          //             ],
          //           ),
          //           child: TextFormField(
          //             cursorColor: Colors.black,
          //             // controller: controller.nameCon,
          //             enabled: false,
          //             keyboardType: TextInputType.text,
          //             decoration: new InputDecoration(
          //                 border: InputBorder.none,
          //                 focusedBorder: InputBorder.none,
          //                 enabledBorder: InputBorder.none,
          //                 errorBorder: InputBorder.none,
          //                 disabledBorder: InputBorder.none,
          //                 contentPadding: EdgeInsets.only(
          //                     left: 15, bottom: 11, top: 11, right: 15),
          //                 hintStyle: TextStyle(color: greyColor, fontSize: 14),
          //                 hintText: "Search here"),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Divider(
            thickness: 10,
          ),
          Obx(
            () => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: !controller.loadmessage.value
                    ? ListView.separated(
                        itemCount: 10,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return ShimerEffect(
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: blueColor, width: 1),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://post.healthline.com/wp-content/uploads/2019/01/Male_Doctor_732x549-thumbnail.jpg'))),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '...........',
                                                style: TextStyle(
                                                    color: blueColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '.............',
                                          style: TextStyle(
                                              color: greyColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '.....',
                                        style: TextStyle(
                                            color: greyColor, fontSize: 11),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      true
                                          ? Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: blueColor),
                                              child: Text(
                                                '..',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext ctxt, int index) {
                          return Divider(
                            thickness: 10,
                            color: Colors.transparent,
                          );
                        },
                      )
                    : ListView.separated(
                        itemCount: controller.listofMessages.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          var time = DateFormat.jm().format(DateTime.parse(
                              controller.listofMessages[index]['time']
                                      .toString()
                                      .split(' ')[0] +
                                  'T' +
                                  controller.listofMessages[index]['time']
                                      .toString()
                                      .split(' ')[1]));
                          return InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: MessageDetails(
                                    incommingId: controller
                                        .listofMessages[index]['incoming_id'],
                                    IncommingName:
                                        '${controller.listofMessages[index]['name']}',
                                  ),
                                  withNavBar: true,
                                  // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    CircularProfileAvatar(
                                      'https://www.dailboxx.websitescare.com/upload/profile/${controller.listofMessages[index]['profileimage']}',
                                      elevation: 5,
                                      radius: 25,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                  '${controller.listofMessages[index]['name']}',
                                                  style: TextStyle(
                                                      color: blueColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${controller.listofMessages[index]['lasttext']}',
                                            style: TextStyle(
                                                color: greyColor, fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          '${controller.listofMessages[index]['time'].toString().split(' ')[0]} $time',
                                          style: TextStyle(
                                              color: greyColor, fontSize: 9),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        },
                        physics: BouncingScrollPhysics(),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        separatorBuilder: (BuildContext ctxt, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              thickness: 0.3,
                            ),
                          );
                        },
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
