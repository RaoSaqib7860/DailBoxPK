import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/Screens/Profile/ViewComments/ViewCommentController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewComments extends StatefulWidget {
  final String? form_id;
  final String? name;

  const ViewComments({Key? key, this.form_id, this.name}) : super(key: key);

  @override
  _ViewCommentsState createState() => _ViewCommentsState();
}

class _ViewCommentsState extends State<ViewComments> {
  final controller = Get.put(ViewCommentsController());

  @override
  void initState() {
    ApiUtilsForAll.getgetAllCommentsform(
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
          'All Comments',
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
                            child: Text('Empty'),
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
                                      'https://www.dailboxx.websitescare.com/upload/profile/${controller.listofComment[i]['profile_image']}',
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
                          itemCount: controller.listofComment.length,
                        )),
            )
          ],
        ),
      ),
    ));
  }
}
