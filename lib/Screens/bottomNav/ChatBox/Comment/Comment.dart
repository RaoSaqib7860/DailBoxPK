import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/Comment/CommentPageController.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ChatBoxController.dart';

class CommentPage extends StatefulWidget {
  final String? form_id;
  final int? index;

  const CommentPage({Key? key, this.form_id, this.index}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final controller = Get.put(CommentPageController());
  final con = Get.find<ChatBoxController>();

  @override
  void initState() {
    ApiUtilsForAll.getgetAllCommentsforms(
        controller: controller, form_id: widget.form_id);
    super.initState();
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
          },
        ),
        title: Text(
          'All Comments'.tr,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: blueColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.030),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.030,
            ),
            Obx(
              () => !controller.isloading.value
                  ? Expanded(
                      child: ListView.builder(
                      itemBuilder: (c, size) {
                        return ShimerEffect(
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircularProfileAvatar(
                                    '',
                                    child:
                                        Image.asset('assets/images/nature.jpg'),
                                    borderColor: Colors.white,
                                    borderWidth: 1,
                                    elevation: 5,
                                    radius: 20,
                                  ),
                                  SizedBox(
                                    width: width * 0.030,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          '..........',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: height * 0.010,
                                        ),
                                        SizedBox(
                                          child: Text(
                                            '................................................................................................................................................................',
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.black45),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.010,
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black12,
                                            width: 0.5))),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 10,
                    ))
                  : controller.listofComment.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text('Empty'.tr),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                          itemBuilder: (c, i) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircularProfileAvatar(
                                      '${controller.listofComment[i]['profile_image']}',
                                      borderColor: blueColor,
                                      borderWidth: 1,
                                      elevation: 5,
                                      radius: 20,
                                    ),
                                    SizedBox(
                                      width: width * 0.030,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.010,
                                          ),
                                          Text(
                                            '${controller.listofComment[i]['name']}',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              '${controller.listofComment[i]['comments']}',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black45),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.010,
                                          ),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12,
                                              width: 0.5))),
                                ),
                              ],
                            );
                          },
                          reverse: true,
                          itemCount: controller.listofComment.length,
                        )),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: height / 14,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller.textCon,
                      textAlign: findLanguageController.isEnglishLocale.value
                          ? TextAlign.left
                          : TextAlign.right,
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
                          contentPadding: EdgeInsets.only(
                              left: Get.width / 20,
                              right:
                                  findLanguageController.isEnglishLocale.value
                                      ? 0
                                      : Get.width / 30),
                          hintText: 'Write something here'.tr,
                          hintStyle: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ApiUtilsForAll.getpostCommentform(
                              form_id: widget.form_id,
                              text: controller.textCon.text)
                          .then((value) {
                        ApiUtilsForAll.getgetAllCommentsforms(
                            controller: controller, form_id: widget.form_id);
                      });
                      int total = int.parse(
                          '${con.listofChatBox[widget.index!]['total_comments']}');
                      con.listofChatBox[widget.index!]['total_comments'] =
                          '${total + 1}';
                      con.loadmainList.value = false;
                      con.loadmainList.value = true;
                      controller.textCon.clear();
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
                      margin:
                          EdgeInsets.only(right: width / 15, left: width / 30),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: blueColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }
}
