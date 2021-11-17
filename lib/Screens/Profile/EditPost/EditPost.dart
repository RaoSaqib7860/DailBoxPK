import 'package:dail_box/AppUtils.dart/ApiUtisAllFiles.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'EditPostController.dart';

class EditPost extends StatefulWidget {
  final Map? mapdata;

  const EditPost({Key? key, this.mapdata}) : super(key: key);

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final controller = Get.put(EditPostController());

  @override
  void initState() {
    print('mapdata = ${widget.mapdata!}');
    controller.textCon.text = widget.mapdata!['discussionform_text'];
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
      'Edit'.tr,
      style: TextStyle(
        fontSize: 16,
      ),
    ),
    elevation: 0,
    backgroundColor: blueColor,
      ),
      body: Padding(
    padding: EdgeInsets.symmetric(
        horizontal: width * 0.030, vertical: height * 0.030),
    child: Obx(
      () => Column(
        children: [
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
                            'https://www.dailboxx.websitescare.com/upload/industry/${widget.mapdata!['industy_sub_name_image']}'))),
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
                            '${widget.mapdata!['industy_name']}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${widget.mapdata!['industy_name']} > ${widget.mapdata!['industy_sub_name']}',
                      style: TextStyle(color: greyColor, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.020,
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
                controller: controller.textCon,
                maxLines: 5,
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
                    hintText: ""),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.010,
          ),
          InkWell(
            onTap: () {
              controller.displayBottomSheet();
            },
            child: Container(
              child: Container(
                height: height * 0.2,
                width: width,
                decoration: BoxDecoration(color: Colors.blueGrey[100]),
                child: Card(
                  color: Colors.blueGrey[100],
                  child: controller.isf1.value
                      ? Image.file(
                          controller.f1.value,
                          fit: BoxFit.cover,
                        )
                      : widget.mapdata!['fourm_image'] != ''
                          ? Image.network(
                              "${widget.mapdata!['fourm_image']}",
                            )
                          : Center(
                              child: Icon(
                                Icons.image,
                                size: 70,
                                color: Colors.black38,
                              ),
                            ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          InkWell(
            onTap: () {
              if (controller.textCon.text.isNotEmpty) {
                ApiUtilsAllFiles.getupdateDiscussionform(
                    controller: controller, map: widget.mapdata);
              } else {
                snackBarSuccess('Please enter text'.tr);
              }
            },
            child: Container(
              height: height * 0.055,
              width: width,
              child: Center(
                child: Text(
                  'Update'.tr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    ),
      ),
    );
  }
}
