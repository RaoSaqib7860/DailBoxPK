import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/Screens/Profile/ViewAllLike/ViewAllLikeController.dart';
import 'package:dail_box/Screens/ViewAllRating/ViewAllRatingsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ViewAllRatings extends StatefulWidget {
  final String? business_id;

  const ViewAllRatings({Key? key, this.business_id}) : super(key: key);

  @override
  _ViewAllRatingsState createState() => _ViewAllRatingsState();
}

class _ViewAllRatingsState extends State<ViewAllRatings> {
  final controller = Get.put(ViewAllRatingsController());

  @override
  void initState() {
    ApiUtils.getgetlistingallrating(
        controller: controller, b_id: widget.business_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      appBar: appBarGlobal('All Ratings'.tr),
      body: Column(
    children: [
      SizedBox(
        height: height * 0.030,
      ),
      Obx(() => !controller.isloadings.value
          ? Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : controller.listofAllRatings.isEmpty
              ? Expanded(
                  child: Center(
                    child: Text('Empty'.tr),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                  itemBuilder: (c, i) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.030),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircularProfileAvatar(
                            '${controller.listofAllRatings[i]['profile_image']}',
                            borderColor: Colors.white,
                            borderWidth: 1,
                            elevation: 5,
                            radius: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ' ${controller.listofAllRatings[i]['name']}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [1, 2, 3, 4, 5].map((e) {
                                        int value = int.parse(
                                                '${controller.listofAllRatings[i]['rating_points'] ?? '0'}')
                                            .toInt();
                                        return value >= e
                                            ? InkWell(
                                                child: Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: Colors.yellow[700],
                                                ),
                                              )
                                            : InkWell(
                                                child: Icon(
                                                  Icons.star_border,
                                                  size: 16,
                                                  color: Colors.yellow[700],
                                                ),
                                              );
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Rating ${controller.listofAllRatings[i]['rating_points']}.0',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ' ${controller.listofAllRatings[i]['rating_review']}',
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.black45),
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: controller.listofAllRatings.length,
                )))
    ],
      ),
    );
  }
}
