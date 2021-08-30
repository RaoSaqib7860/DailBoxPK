import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ApiUtisAllFiles.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/Profile/EditPost/EditPost.dart';
import 'package:dail_box/Screens/Profile/ViewAllLike/ViewAllLike.dart';
import 'package:dail_box/Screens/Profile/ViewComments/ViewComments.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'ChatBoxController.dart';
import 'Comment/Comment.dart';

class ChatBox extends StatefulWidget {
  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final controller = Get.put(ChatBoxController());

  @override
  void initState() {
    ApiUtils.getgetDiscussionform(controller: controller);
    ApiUtils.getgetpackges();
    ApiUtils.getgetmybusinesslist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Discussion Forum'.tr,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        elevation: 0,
        backgroundColor: blueColor,
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Obx(
                      () => Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              height: 30,
                              color: blueColor,
                              child: Theme(
                                  data: new ThemeData(
                                      canvasColor: blueColor,
                                      primaryColor: Colors.black,
                                      accentColor: Colors.black,
                                      hintColor: Colors.black),
                                  child: DropdownButton<String>(
                                    items:
                                        controller.listofIndustry.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: '$value',
                                        child:
                                            Text('${value['industry_name']}'),
                                        onTap: () {
                                          controller.currentlistofIndustryIndex
                                                  .value =
                                              controller.listofIndustry
                                                  .indexOf(value);
                                          controller.listofIndustryHint.value =
                                              value['industry_name'];
                                          ApiUtils.getgetMainCatapp(
                                              value['id']);
                                        },
                                      );
                                    }).toList(),
                                    hint: Text(
                                      controller.listofIndustryHint.value,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                    underline: Container(
                                      color: Colors.transparent,
                                    ),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                    isExpanded: true,
                                    onChanged: (_) {},
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              height: 30,
                              color: Colors.red[900],
                              child: Theme(
                                  data: new ThemeData(
                                      canvasColor: Colors.red[900],
                                      primaryColor: Colors.black,
                                      accentColor: Colors.black,
                                      hintColor: Colors.black),
                                  child: DropdownButton<String>(
                                    items: controller.listofCat.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: '$value',
                                        child:
                                            Text('${value['main_cat_name']}'),
                                        onTap: () {
                                          controller
                                                  .currentlistofCatIndex.value =
                                              controller.listofCat
                                                  .indexOf(value);
                                          controller.listofCatHint.value =
                                              value['main_cat_name'];
                                          ApiUtils.getsortDiscussionform(
                                              main_cat_id: controller
                                                      .listofIndustry[
                                                  controller
                                                      .currentlistofIndustryIndex
                                                      .value]['id'],
                                              sub_cat_id: controller.listofCat[
                                                  controller
                                                      .currentlistofCatIndex
                                                      .value]['id'],
                                              controller: controller);
                                        },
                                      );
                                    }).toList(),
                                    hint: Text(
                                      controller.listofCatHint.value,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                    underline: Container(
                                      color: Colors.transparent,
                                    ),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                    isExpanded: true,
                                    onChanged: (_) {},
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          enabled: true,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            if (value.length >= 3) {
                              ApiUtils.getsearchDiscussionform(
                                  controller: controller, search: value);
                            } else {
                              ApiUtils.getgetDiscussionform(
                                  controller: controller);
                            }
                          },
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle:
                                  TextStyle(color: greyColor, fontSize: 14),
                              hintText: "Search here".tr),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Obx(
                () => CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.030),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          'Add new Discussion Post'.tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 25,
                                              padding: EdgeInsets.only(left: 3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black26)),
                                              child: Theme(
                                                  data: new ThemeData(
                                                      canvasColor:
                                                          Colors.red[900],
                                                      primaryColor:
                                                          Colors.black,
                                                      accentColor: Colors.black,
                                                      hintColor: Colors.black),
                                                  child: DropdownButton<String>(
                                                    items: controller
                                                        .listofIndustrytwo
                                                        .map((value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: '$value',
                                                        child: Text(
                                                          '${value['industry_name']}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10),
                                                        ),
                                                        onTap: () {
                                                          controller
                                                                  .currentlistofIndustryIndextwo
                                                                  .value =
                                                              controller
                                                                  .listofIndustrytwo
                                                                  .indexOf(
                                                                      value);
                                                          controller
                                                                  .listofIndustryHinttwo
                                                                  .value =
                                                              value[
                                                                  'industry_name'];
                                                          ApiUtils
                                                              .getgetMainCatapptwo(
                                                                  value['id']);
                                                        },
                                                      );
                                                    }).toList(),
                                                    hint: Text(
                                                      controller
                                                          .listofIndustryHinttwo
                                                          .value,
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.black),
                                                    ),
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.black26,
                                                      size: 20,
                                                    ),
                                                    underline: Container(
                                                      color: Colors.transparent,
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                    isExpanded: true,
                                                    onChanged: (_) {},
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.050,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 25,
                                              padding: EdgeInsets.only(left: 3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black26)),
                                              child: Theme(
                                                  data: new ThemeData(
                                                      canvasColor:
                                                          Colors.red[900],
                                                      primaryColor:
                                                          Colors.black,
                                                      accentColor: Colors.black,
                                                      hintColor: Colors.black),
                                                  child: DropdownButton<String>(
                                                    items: controller
                                                        .listofCattwo
                                                        .map((value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: '$value',
                                                        child: Text(
                                                          '${value['main_cat_name']}',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        onTap: () {
                                                          controller
                                                                  .currentlistofCatIndextwo
                                                                  .value =
                                                              controller
                                                                  .listofCattwo
                                                                  .indexOf(
                                                                      value);
                                                          controller
                                                                  .listofCatHinttwo
                                                                  .value =
                                                              value[
                                                                  'main_cat_name'];
                                                        },
                                                      );
                                                    }).toList(),
                                                    hint: Text(
                                                      controller
                                                          .listofCatHinttwo
                                                          .value,
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.black),
                                                    ),
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.black26,
                                                      size: 20,
                                                    ),
                                                    underline: Container(
                                                      color: Colors.transparent,
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                    isExpanded: true,
                                                    onChanged: (_) {},
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                              cursorColor: Colors.black,
                              controller: controller.writeCommentCon.value,
                              keyboardType: TextInputType.text,
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
                                  hintText: "Write something here".tr),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              color: greyColor,
                              width: MediaQuery.of(context).size.width,
                              height: 0.5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  controller.displayBottomSheet();
                                },
                                child: Container(
                                  height: height * 0.030,
                                  width: width * 0.3,
                                  child: Row(
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.black26,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Center(
                                        child: Text(
                                          'Add Pictures'.tr,
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            !controller.isf1.value
                                ? SizedBox()
                                : Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                            height: height * 0.2,
                                            width: width,
                                            child: Image.file(
                                              controller.f1.value,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ],
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                    onTap: () async {
                                      if (controller
                                              .listofIndustryHinttwo.value !=
                                          'Select Industry'.tr) {
                                        if (controller.listofCatHinttwo.value !=
                                            'Category'.tr) {
                                          if (controller.writeCommentCon.value
                                              .text.isNotEmpty) {
                                            controller.loading.value = true;
                                            await ApiUtilsAllFiles
                                                .getpostDiscussionform(
                                                    controller);
                                            controller.writeCommentCon.value
                                                .text = '';
                                            controller.isf1.value = false;
                                            controller.f1.value = File('path');
                                            controller.loadmainList.value =
                                                false;
                                            ApiUtils.getgetDiscussionform(
                                                controller: controller);
                                          } else {
                                            snackBarFailer('Please enter text');
                                          }
                                        } else {
                                          snackBarFailer(
                                              'Please select Category');
                                        }
                                      } else {
                                        snackBarFailer(
                                            'Please select industry');
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[100],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                offset: Offset(2, 2),
                                                blurRadius: 5)
                                          ]),
                                      child: Text(
                                        'Publish Now'.tr,
                                        style: TextStyle(
                                            color: blueColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    !controller.loadmainList.value
                        ? SliverToBoxAdapter(
                            child: Container(
                              height: height * 0.2,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        : controller.listofChatBox.isEmpty
                            ? SliverToBoxAdapter(
                                child: Container(
                                  height: height * 0.2,
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
                                        ChatBoxItem2(
                                          mapData:
                                              controller.listofChatBox[index],
                                          controller: controller,
                                          index: index,
                                        ),
                                        Divider(
                                          thickness: 15,
                                        ),
                                      ],
                                    );
                                  },
                                  childCount: controller.listofChatBox.length,
                                ),
                              )
                  ],
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                ),
              )),
            ],
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
    );
  }
}

class ChatBoxItem extends StatefulWidget {
  final Map? mapData;
  final int? index;
  final ChatBoxController? controller;

  const ChatBoxItem({Key? key, this.mapData, this.controller, this.index})
      : super(key: key);

  @override
  _ChatBoxItemState createState() => _ChatBoxItemState();
}

class _ChatBoxItemState extends State<ChatBoxItem> {
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
    //getApiData();
    super.initState();
  }

  getApiData() async {
    List list = await ApiUtils.gettotalCommentform(
        controller: widget.controller,
        id: '${widget.mapData!['discussion_id']}');
    setState(() {
      commitList = list;
    });
    List list2 = await ApiUtils.gettotalLikeform(
        controller: widget.controller,
        id: '${widget.mapData!['discussion_id']}');
    setState(() {
      Likelist = list2;
    });
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
              Expanded(
                child: Text(
                  '${widget.mapData!['industy_name']}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
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
                    if (v == 1) {
                      Get.to(EditPost(mapdata: widget.mapData!));
                    } else {
                      ApiUtilsForAll.getremoveDiscussionform(
                          index: widget.index, id: widget.mapData!['form_id']);
                    }
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Edit".tr),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Delete".tr),
                          value: 2,
                        )
                      ])
            ],
          ),
          Text(
            '${widget.mapData!['industy_name']} > ${widget.mapData!['industy_sub_name']}',
            style: TextStyle(color: greyColor, fontSize: 10),
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
                      imageUrl:
                          "https://www.dailboxx.websitescare.com/upload/discussionform/${widget.mapData!['fourm_image']}",
                      placeholder: (context, url) => SpinKitWave(
                        color: Colors.blue,
                        size: 12.0,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
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
                Row(
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
                      Likelist.isEmpty
                          ? 'Likes'.tr
                          : '${Likelist[0]['total_likes']} Likes',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
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
                Row(
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
                      commitList.isEmpty
                          ? 'Comments'.tr
                          : '${commitList[0]['total_comments']} Comments',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
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
}

class ChatBoxItem2 extends StatefulWidget {
  final Map? mapData;
  final int? index;
  final ChatBoxController? controller;

  const ChatBoxItem2({Key? key, this.mapData, this.controller, this.index})
      : super(key: key);

  @override
  _ChatBoxItem2State createState() => _ChatBoxItem2State();
}

class _ChatBoxItem2State extends State<ChatBoxItem2> {
  String? firstHalf;
  String? secondHalf;
  bool flag = true;

  List commitList = [];
  List Likelist = [];

  @override
  void initState() {
    String text = '${widget.mapData!['discussionform_text']}';
    // TODO: implement initState
    if (text.length > 150) {
      firstHalf = text.substring(0, 150);
      secondHalf = text.substring(150, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
    // getApiData();
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
                            'https://www.dailboxx.websitescare.com/upload/profile/${widget.mapData!['profile_image']}'))),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '${widget.mapData!['industry_name']}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
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
                              if (v == 1) {
                                Get.to(EditPost(mapdata: widget.mapData!));
                              } else {
                                ApiUtilsForAll.getremoveDiscussionform(
                                    index: widget.index,
                                    id: widget.mapData!['discussion_id']);
                              }
                            },
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text("Edit".tr),
                                    value: 1,
                                  ),
                                  PopupMenuItem(
                                    child: Text("Delete".tr),
                                    value: 2,
                                  )
                                ])
                      ],
                    ),
                    Text(
                      '${widget.mapData!['main_cat_name'] ?? ''} > ${widget.mapData!['business_name']}',
                      style: TextStyle(color: greyColor, fontSize: 10),
                    ),
                  ],
                ),
              ),
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
                      imageUrl:
                          "https://www.dailboxx.websitescare.com/upload/discussionform/${widget.mapData!['fourm_image']}",
                      placeholder: (context, url) => SpinKitWave(
                        color: Colors.blue,
                        size: 12.0,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
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
                    if ('${widget.controller!.listofChatBox[widget.index!]['islike']}' ==
                        'false') {
                      print('like');
                      ApiUtilsForAll.getlikeDiscussionform(
                              form_id:
                                  '${widget.controller!.listofChatBox[widget.index!]['discussion_id']}',
                              index: widget.index,
                              controller: widget.controller,
                              isLike: true)
                          .then((value) {
                        setState(() {});
                      });
                    } else {
                      print('dislike');
                      ApiUtilsForAll.getlikeDiscussionform(
                              form_id:
                                  '${widget.controller!.listofChatBox[widget.index!]['discussion_id']}',
                              index: widget.index,
                              controller: widget.controller,
                              isLike: false)
                          .then((value) {
                        setState(() {});
                      });
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      '${widget.controller!.listofChatBox[widget.index!]['islike']}' ==
                              'false'
                          ? Icon(
                              CupertinoIcons.hand_thumbsup,
                              color: blueColor,
                              size: 20,
                            )
                          : Icon(
                              CupertinoIcons.hand_thumbsup_fill,
                              color: blueColor,
                              size: 20,
                            ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.controller!.listofChatBox[widget.index!]['total_likes']} Likes',
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
                    Get.to(CommentPage(
                      form_id: widget.mapData!['discussion_id'],
                      index: widget.index,
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
                        '${widget.mapData!['total_comments']} Comments',
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
}
