import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/Screens/Profile/ViewAllLike/ViewAllLikeController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewLike extends StatefulWidget {
  final String? form_id;
  final String? name;

  const ViewLike({Key? key, this.form_id, this.name}) : super(key: key);

  @override
  _ViewLikeState createState() => _ViewLikeState();
}

class _ViewLikeState extends State<ViewLike> {
  final controller = Get.put(ViewAllLikeController());

  @override
  void initState() {
    ApiUtilsForAll.getgetAllLikeform(
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
          'All Likes'.tr,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: blueColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.030),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.010,
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
                  : controller.listoflike.isEmpty
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
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircularProfileAvatar(
                                      '${controller.listoflike[i]['profile_image']}',
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
                                            height: height * 0.015,
                                          ),
                                          Text(
                                            '${controller.listoflike[i]['name']}',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
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
                          itemCount: controller.listoflike.length,
                        )),
            )
          ],
        ),
      ),
    ));
  }
}
