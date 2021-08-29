import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/Screens/Profile/ProfileController.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/chatbox.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'EditProfile.dart';

callProfile() {
  final controller = Get.find<ProfileController>();
  controller.loadmainList.value = false;
  controller.callApiData(controller);
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GetStorage storage = GetStorage();
  final controller = Get.put(ProfileController());

  @override
  void initState() {
    print('${storage.read('profile_image')}');
    controller.callApiData(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.loadmainList.value = false;
    controller.isf1.value = false;
    controller.listofChatBox.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
                    Navigator.pop(context);
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
          Container(
            height: height,
            margin: EdgeInsets.only(top: 100),
            child: CustomScrollView(
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
                        child: Stack(
                          children: [
                            Obx(
                              () => controller.isf1.value
                                  ? CircularProfileAvatar(
                                      '',
                                      child: Image.file(
                                        controller.f1.value,
                                        fit: BoxFit.cover,
                                      ),
                                      borderColor: Colors.black,
                                      borderWidth: 0.5,
                                      elevation: 3,
                                      radius: 50,
                                    )
                                  : CircularProfileAvatar(
                                      'https://www.dailboxx.websitescare.com/upload/profile/${storage.read('profile_image')}',
                                      borderColor: Colors.black,
                                      borderWidth: 0.5,
                                      elevation: 3,
                                      radius: 50,
                                    ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.displayBottomSheet();
                              },
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          offset: Offset(-3, -3),
                                          blurRadius: 5)
                                    ],
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
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
                              storage.read('name'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: blueColor,
                                            border:
                                                Border.all(color: blueColor)),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          CupertinoIcons.rectangle_grid_2x2,
                                          color: Colors.white,
                                          size: 22,
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'My Activity'.tr,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(color: greyColor)),
                                      padding: EdgeInsets.all(10),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/icons/interest.png'),
                                        color: greyColor,
                                        height: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'My Interest'.tr,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(EditProfile());
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border:
                                                  Border.all(color: greyColor)),
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            CupertinoIcons.person,
                                            color: greyColor,
                                            size: 22,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Edit'.tr,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(color: greyColor)),
                                      padding: EdgeInsets.all(10),
                                      child: Image(
                                        image:
                                            AssetImage('assets/icons/more.png'),
                                        color: greyColor,
                                        height: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'More'.tr,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    )
                                  ],
                                )
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
                Obx(() => !controller.loadmainList.value
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
                                    ChatBoxItem(
                                      mapData: controller.listofChatBox[index],
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
                          )),
              ],
              physics: BouncingScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }
}
