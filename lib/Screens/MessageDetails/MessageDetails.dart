import 'dart:ui';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/Screens/MessageDetails/MessageDetailsController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class MessageDetails extends StatefulWidget {
  final String? incommingId;
  final String? IncommingName;
  final String? incomingProfile;
  final String? businessId;
  final String? random_id;

  MessageDetails(
      {Key? key,
      this.incommingId,
      this.IncommingName,
      this.incomingProfile,
      this.businessId,
      this.random_id})
      : super(key: key);

  @override
  _MessageDetailsState createState() => _MessageDetailsState();
}

class _MessageDetailsState extends State<MessageDetails> {
  List list = [
    'Hey! How’s it all going?'.tr,
    'It’s been an okay day… Lots of School work'.tr,
    'Feeling quite overwhelmed today. Wish I had more time to myself.'.tr,
    'It’s okay to be tired. Try to take some deep breaths when you have a quick minute to yourself. Remember you are worth it! Being kind to others is just as important as being kind to yourself. '
        .tr,
    'Hello brother'.tr
  ];
  List listbool = [true, false, true, false, true];
  List listboolanim = [true, true, true, true, true];
  TextEditingController controller = TextEditingController();
  bool isfirst = false;
  final con = Get.put(MessageDetailsController());
  GetStorage storage = GetStorage();
  String userId = '';

  @override
  void initState() {
    print('random_id=${widget.random_id}');
    userId = storage.read('userId');
    con.loadData.value = false;
    ApiUtils.getgetChatOneToOne(
        widget.incommingId!, widget.businessId!, widget.random_id!);
    con.callBackgroundSms(
        widget.incommingId!, widget.businessId!, widget.random_id!);
    super.initState();
  }

  @override
  void dispose() {
    con.timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              ApiUtils.getgetAllMyMessages();
            },
          ),
          title: Text(
            '${widget.IncommingName}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          elevation: 0,
          backgroundColor: blueColor,
        ),
        body: Stack(
          children: [
            Obx(
              () => Column(
                children: [
                  Expanded(
                      child: Container(
                    child: !con.loadData.value
                        ? ListView.builder(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (c, i) {
                              return listbool[i] == true
                                  ? ShimerEffect(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: width / 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              // Container(
                                              //   margin: EdgeInsets.only(
                                              //       bottom: height / 60),
                                              //   child: CircularProfileAvatar(
                                              //     '',
                                              //     child: Center(
                                              //         child: Icon(
                                              //       Icons.person,
                                              //       color: Colors.black45,
                                              //       size: 35,
                                              //     )),
                                              //     borderColor: Colors.black,
                                              //     borderWidth: 0.5,
                                              //     radius: height / 40,
                                              //   ),
                                              // ),
                                              SizedBox(
                                                width: width / 40,
                                              ),
                                              Transform.translate(
                                                offset: Offset(2, 0),
                                                child: Container(
                                                  height: height / 50,
                                                  width: width / 25,
                                                  margin: EdgeInsets.only(
                                                      bottom: height / 60),
                                                  child: CustomPaint(
                                                    size: Size(
                                                        width / 8, height / 16),
                                                    painter: SmsPainter(),
                                                  ),
                                                ),
                                              ),
                                              ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth: width / 1.7),
                                                  child: IntrinsicWidth(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  width / 30),
                                                          decoration: BoxDecoration(
                                                              color: blueColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          child: Text(
                                                            '${list[i]}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height / 200,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          width /
                                                                              50),
                                                              child: Text(
                                                                '3.30PM'.tr,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : ShimerEffect(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(
                                            height: width / 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth: width / 1.7),
                                                  child: IntrinsicWidth(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  width / 30),
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                      .blueGrey[
                                                                  100],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          child: Text(
                                                            '${list[i]}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height / 200,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: width /
                                                                          50),
                                                              child: Text(
                                                                '3.30PM'.tr,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              Transform.translate(
                                                offset: Offset(-2, 0),
                                                child: Container(
                                                  height: height / 50,
                                                  width: width / 25,
                                                  margin: EdgeInsets.only(
                                                      bottom: height / 60),
                                                  child: CustomPaint(
                                                    size: Size(
                                                        width / 8, height / 16),
                                                    painter: SmsPainter2(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width / 40,
                                              ),
                                              // Container(
                                              //   margin: EdgeInsets.only(
                                              //       bottom: height / 60),
                                              //   child: CircularProfileAvatar(
                                              //     '',
                                              //     child: Center(
                                              //         child: Icon(
                                              //       Icons.person,
                                              //       color: Colors.black45,
                                              //       size: 35,
                                              //     )),
                                              //     borderColor: Colors.black,
                                              //     borderWidth: 0.5,
                                              //     radius: height / 40,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                            },
                            reverse: true,
                            itemCount: list.length,
                          )
                        : ListView.builder(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (c, i) {
                              String value = con.listofDealssms[i]['datetime']
                                      .toString()
                                      .split(' ')[0] +
                                  'T' +
                                  con.listofDealssms[i]['datetime']
                                      .toString()
                                      .split(' ')[1];
                              var time =
                                  DateFormat.jm().format(DateTime.parse(value));
                              return userId !=
                                      '${con.listofDealssms[i]['to_msg']}'
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: width / 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            // Container(
                                            //   margin: EdgeInsets.only(
                                            //       bottom: height / 60),
                                            //   child: CircularProfileAvatar(
                                            //     '${widget.incomingProfile}',
                                            //     borderColor: Colors.black,
                                            //     borderWidth: 0.5,
                                            //     elevation: 3,
                                            //     radius: height / 40,
                                            //   ),
                                            // ),
                                            SizedBox(
                                              width: width / 40,
                                            ),
                                            Transform.translate(
                                              offset: Offset(2, 0),
                                              child: Container(
                                                height: height / 50,
                                                width: width / 25,
                                                margin: EdgeInsets.only(
                                                    bottom: height / 60),
                                                child: CustomPaint(
                                                  size: Size(
                                                      width / 8, height / 16),
                                                  painter: SmsPainter(),
                                                ),
                                              ),
                                            ),
                                            ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxWidth: width / 1.7),
                                                child: IntrinsicWidth(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                            width / 30),
                                                        decoration: BoxDecoration(
                                                            color: blueColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: Text(
                                                          '${con.listofDealssms[i]['massages']}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height / 200,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        width /
                                                                            50),
                                                            child: Text(
                                                              time,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 7.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          height: width / 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxWidth: width / 1.7),
                                                child: IntrinsicWidth(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                            width / 30),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .blueGrey[100],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: Text(
                                                          '${con.listofDealssms[i]['massages']}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height / 200,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left:
                                                                        width /
                                                                            50),
                                                            child: Text(
                                                              time,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 7.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )),
                                            Transform.translate(
                                              offset: Offset(-2, 0),
                                              child: Container(
                                                height: height / 50,
                                                width: width / 25,
                                                margin: EdgeInsets.only(
                                                    bottom: height / 60),
                                                child: CustomPaint(
                                                  size: Size(
                                                      width / 8, height / 16),
                                                  painter: SmsPainter2(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width / 40,
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                            },
                            reverse: true,
                            itemCount: con.listofDealssms.length,
                          ),
                    padding:
                        EdgeInsets.only(left: width / 25, right: width / 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: height / 14,
                    width: width,
                    decoration: BoxDecoration(color: Colors.blueGrey[100]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            decoration: InputDecoration(
                                disabledBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: new BorderSide(
                                      color: Colors.black12,
                                    )),
                                focusedBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: new BorderSide(
                                      color: Colors.black12,
                                    )),
                                enabledBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: new BorderSide(
                                      color: Colors.black12,
                                    )),
                                border: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: new BorderSide(
                                      color: Colors.black12,
                                    )),
                                contentPadding:
                                    EdgeInsets.only(left: Get.width / 20),
                                hintText: 'Say something …'.tr,
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (controller.text.trim().isNotEmpty) {
                              ApiUtils.getgetChatOneToOneSave(
                                  incommingId: widget.incommingId,
                                  post_id: '${widget.businessId}',
                                  message: controller.text,
                                  random_id: widget.random_id!);
                              ApiUtils.getgetChatOneToOne(widget.incommingId!,
                                  widget.businessId!, widget.random_id!);
                              controller.clear();
                            }
                          },
                          child: Container(
                            height: height / 18,
                            width: width / 9,
                            child: Center(
                              child: Icon(
                                Icons.send_outlined,
                                color: Colors.white,
                              ),
                            ),
                            margin: EdgeInsets.only(
                                right: width / 15, left: width / 30),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: blueColor),
                          ),
                        )
                      ],
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = blueColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.0300000);
    path_0.lineTo(0, size.height * 0.5014000);
    path_0.lineTo(size.width, size.height * 0.9393000);
    path_0.lineTo(size.width, size.height * 0.0300000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SmsPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.blueGrey[100]!
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, size.height * 0.5019000);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
