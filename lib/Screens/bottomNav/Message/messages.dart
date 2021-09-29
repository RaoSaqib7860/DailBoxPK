import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/Screens/MessageDetails/MessageDetails.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'MessageController.dart';

bool isopenMessage = false;

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  var controller = Get.put(MessageController());
  GetStorage storage = GetStorage();

  @override
  void initState() {
    isopenMessage = true;
    ApiUtils.getgetAllMyMessages();
    // controller.callBackgroundSms();
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
        body: Obx(() => controller.load.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  Obx(
                    () => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 15),
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                                  '.............',
                                                  style: TextStyle(
                                                      color: greyColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                '.....',
                                                style: TextStyle(
                                                    color: greyColor,
                                                    fontSize: 11),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              true
                                                  ? Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
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
                                separatorBuilder:
                                    (BuildContext ctxt, int index) {
                                  return Divider(
                                    thickness: 10,
                                    color: Colors.transparent,
                                  );
                                },
                              )
                            : ListView.separated(
                                itemCount: controller.listofMessages.length,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  var time = DateFormat.jm().format(
                                      DateTime.parse(controller
                                              .listofMessages[index]['time']
                                              .toString()
                                              .split(' ')[0] +
                                          'T' +
                                          controller.listofMessages[index]
                                                  ['time']
                                              .toString()
                                              .split(' ')[1]));
                                  return InkWell(
                                      onTap: () {
                                        pushNewScreen(
                                          context,
                                          screen: MessageDetails(
                                            incommingId:
                                                controller.listofMessages[index]
                                                    ['incoming_id'],
                                            IncommingName:
                                                '${controller.listofMessages[index]['business_name']}',
                                            incomingProfile:
                                                '${controller.listofMessages[index]['listing_image']}',
                                            businessId:
                                                '${controller.listofMessages[index]['post_id']}',
                                          ),
                                          withNavBar: true,
                                          // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        ).then((value) async {
                                          await ApiUtils.getgetAllMyMessages(
                                              isLoad: false);
                                          setState(() {});
                                        });
                                      },
                                      child: Container(
                                        width: Get.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Transform.translate(
                                              offset: Offset(0, 10),
                                              child: Text(
                                                '${controller.listofMessages[index]['time'].toString().split(' ')[0]} $time',
                                                style: TextStyle(
                                                    color: greyColor,
                                                    fontSize: 8),
                                              ),
                                            ),
                                            UnseenMessage(
                                              post_id:
                                                  '${controller.listofMessages[index]['post_id']}',
                                              index: index,
                                            ),
                                          ],
                                        ),
                                      ));
                                },
                                physics: BouncingScrollPhysics(),
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                separatorBuilder:
                                    (BuildContext ctxt, int index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Divider(
                                      thickness: 4,
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  )
                ],
              )));
  }
}

class UnseenMessage extends StatefulWidget {
  final String? post_id;
  final int? index;

  const UnseenMessage({Key? key, this.post_id, this.index}) : super(key: key);

  @override
  _UnseenMessageState createState() => _UnseenMessageState();
}

class _UnseenMessageState extends State<UnseenMessage> {
  @override
  void initState() {
    getApi();
    super.initState();
  }

  List value = [];
  GetStorage storage = GetStorage();

  getApi() async {
    List result =
        await ApiUtils.getgetAllMyMessagesunseen(post_id: widget.post_id);
    setState(() {
      value = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return value.isEmpty
        ? SizedBox()
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircularProfileAvatar(
                '${value[widget.index!]['listing_image']}',
                elevation: 5,
                radius: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  '${value[widget.index!]['business_name']}' +
                      '${storage.read('userId') != value[widget.index!]['owner_id'] ? '' : ' v/s '}' +
                      '${storage.read('userId') != value[widget.index!]['owner_id'] ? '' : value[widget.index!]['name']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: blueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              '${value[widget.index!]['totalunseen']}' == '0'
                  ? SizedBox()
                  : Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: blueColor, shape: BoxShape.circle),
                      padding: EdgeInsets.all(3),
                    ),
            ],
          );
  }
}
