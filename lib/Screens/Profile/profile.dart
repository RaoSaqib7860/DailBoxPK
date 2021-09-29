import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/Screens/Profile/ProfileController.dart';
import 'package:dail_box/Screens/bottomNav/ChatBox/chatbox.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'EditProfile.dart';

caltoHome() {
  Future.delayed(Duration(seconds: 2), () {
    Get.offAll(HomeScreen());
  });
}

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
    getProfileData();
    super.initState();
  }

  getProfileData() async {
    await ApiUtils.getmyuserprofile(
        controller: controller, user_id: '${storage.read('userId')}');
  }

  int currentTab = 1;

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
                      fontWeight: FontWeight.w600,letterSpacing: 1,
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
                                      '${storage.read('profile_image')}',
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
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentTab = 1;
                                    });
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: currentTab == 1
                                                  ? blueColor
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: currentTab == 1
                                                      ? blueColor
                                                      : greyColor)),
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            CupertinoIcons.rectangle_grid_2x2,
                                            color: currentTab != 1
                                                ? greyColor
                                                : Colors.white,
                                            size: 22,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Activities'.tr,
                                        style: TextStyle(
                                            color: currentTab == 1
                                                ? Colors.black
                                                : greyColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentTab = 2;
                                    });
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: currentTab == 2
                                                ? blueColor
                                                : Colors.white,
                                            border: Border.all(
                                                color: currentTab == 2
                                                    ? blueColor
                                                    : greyColor)),
                                        padding: EdgeInsets.all(10),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/icons/interest.png'),
                                          color: currentTab == 2
                                              ? Colors.white
                                              : greyColor,
                                          height: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Information'.tr,
                                        style: TextStyle(
                                            color: currentTab == 2
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentTab = 3;
                                    });
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      // Get.to(EditProfile());
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => EditProfile()));
                                    });
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: currentTab == 3
                                                  ? blueColor
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: currentTab == 3
                                                      ? blueColor
                                                      : greyColor)),
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            CupertinoIcons.person,
                                            color: currentTab == 3
                                                ? Colors.white
                                                : greyColor,
                                            size: 22,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Edit'.tr,
                                        style: TextStyle(
                                            color: currentTab == 3
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
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
                Obx(() => currentTab == 2
                    ? SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.030,
                              vertical: width * 0.030),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Experience'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  InkWell(
                                    child: Icon(Icons.add),
                                    onTap: () {
                                      experince(controller: controller);
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Column(
                                children: controller.experience.map((element) {
                                  int index =
                                      controller.experience.indexOf(element);
                                  return Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[50]),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      'Company Name : ${element['position']}')),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  experinceEdit(
                                                      controller: controller,
                                                      id: '${element['id']}',
                                                      companyName:
                                                          '${element['company_name']}',
                                                      duration:
                                                          '${element['time_duration']}',
                                                      positions:
                                                          '${element['position']}',
                                                      index: index);
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  size: 17,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller.experience
                                                      .removeAt(index);
                                                  setState(() {});
                                                  ApiUtils
                                                      .getuserExperienceRemove(
                                                          controller:
                                                              controller,
                                                          id: '${element['id']}');
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red[300],
                                                  size: 17,
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                              'Position : ${element['company_name']}'),
                                          Text(
                                              'Time Duration : ${element['time_duration']}')
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Education'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  InkWell(
                                    child: Icon(Icons.add),
                                    onTap: () {
                                      experince(
                                          controller: controller,
                                          from: 'Education');
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Column(
                                children: controller.education.map((element) {
                                  int index =
                                      controller.education.indexOf(element);
                                  return Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[50]),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                //school_name
                                                  child: Text(
                                                      'School Name : ${element['degree_type']}')),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  experinceEdit(
                                                      controller: controller,
                                                      id: '${element['id']}',
                                                      companyName:
                                                          '${element['school_name']}',
                                                      duration:
                                                          '${element['start_end']}',
                                                      positions:
                                                          '${element['degree_type']}',
                                                      from: 'Education',
                                                      index: index);
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  size: 17,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller.education
                                                      .removeAt(index);
                                                  setState(() {});
                                                  ApiUtils.getuserEducationRemove(
                                                      controller: controller,
                                                      id: '${element['id']}');
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red[300],
                                                  size: 17,
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            //degree_type
                                              'Degree Type : ${element['school_name']}'),
                                          Text(
                                              'Time Duration : ${element['start_end']}')
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Accomplishments'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  InkWell(
                                    child: Icon(Icons.add),
                                    onTap: () {
                                      accomplishments(controller: controller);
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Column(
                                children: controller.listofAccomplishment
                                    .map((element) {
                                  int index = controller.listofAccomplishment
                                      .indexOf(element);
                                  return Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[50]),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  '${element['details']}')),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              accomplishmentsEdit(
                                                  controller: controller,
                                                  id: '${element['id']}',
                                                  text: '${element['details']}',
                                                  index: index);
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              size: 17,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.listofAccomplishment
                                                  .removeAt(index);
                                              setState(() {});
                                              ApiUtils
                                                  .getuserAccomplishmentsRemove(
                                                      controller: controller,
                                                      id: '${element['id']}');
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red[300],
                                              size: 17,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Skills'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  InkWell(
                                    child: Icon(Icons.add),
                                    onTap: () {
                                      accomplishments(
                                          controller: controller,
                                          isupdate: 'skill');
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Column(
                                children: controller.Skills.map((element) {
                                  int index =
                                      controller.Skills.indexOf(element);
                                  return Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[50]),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child:
                                                  Text('${element['skills']}')),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              accomplishmentsEdit(
                                                  controller: controller,
                                                  id: '${element['id']}',
                                                  text: '${element['skills']}',
                                                  index: index,
                                                  from: 'skill');
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              size: 17,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.Skills.removeAt(index);
                                              setState(() {});
                                              ApiUtils.getuserSkillsRemove(
                                                  controller: controller,
                                                  id: '${element['id']}');
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red[300],
                                              size: 17,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Volunteering'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  InkWell(
                                    child: Icon(Icons.add),
                                    onTap: () {
                                      accomplishments(
                                          controller: controller,
                                          isupdate: 'Volunteering');
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Column(
                                children:
                                    controller.userVolunteering.map((element) {
                                  int index = controller.userVolunteering
                                      .indexOf(element);
                                  return Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[50]),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  '${element['details']}')),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              accomplishmentsEdit(
                                                  controller: controller,
                                                  id: '${element['id']}',
                                                  text: '${element['details']}',
                                                  index: index,
                                                  from: 'Volunteering');
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              size: 17,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.userVolunteering
                                                  .removeAt(index);
                                              setState(() {});
                                              ApiUtils
                                                  .getuserVolunteeringRemove(
                                                      controller: controller,
                                                      id: '${element['id']}');
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red[300],
                                              size: 17,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        ),
                      )
                    : !controller.loadmainList.value
                        ? SliverToBoxAdapter(
                            child: Container(
                              height: height * 0.4,
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
                                  height: height * 0.4,
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
                                          mapData:
                                              controller.listofChatBox[index],
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

  accomplishments(
      {ProfileController? controller, String isupdate = 'acconplish'}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController textCon = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width / 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: height / 2.50,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    isupdate == 'acconplish'
                        ? 'Add accomplishments'.tr
                        : isupdate == 'Volunteering'
                            ? 'Add Volunteering'.tr
                            : 'Add Skills'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height / 30,
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
                        maxLines: 6,
                        keyboardType: TextInputType.text,
                        controller: textCon,
                        textInputAction: TextInputAction.done,
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
                            hintText: isupdate == 'acconplish'
                                ? "Write your accomplishments here".tr
                                : isupdate == 'Volunteering'
                                    ? 'Write your Volunteering here'.tr
                                    : "Write your skill here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        if (isupdate == 'acconplish') {
                          await ApiUtils.getuserAccomplishments(
                              controller: controller, detail: textCon.text);
                          setState(() {});
                        } else if (isupdate == 'Volunteering') {
                          await ApiUtils.getuserVolunteering(
                              controller: controller, detail: textCon.text);
                          setState(() {});
                        } else {
                          await ApiUtils.getuserSkills(
                              controller: controller, detail: textCon.text);
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            'Add'.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        });
  }

  accomplishmentsEdit(
      {ProfileController? controller,
      String? text,
      String? id,
      int? index,
      String? from = 'Acomplish'}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController textCon = TextEditingController();
    textCon.text = text!;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width / 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: height / 2.50,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    from == 'Acomplish'
                        ? 'Update accomplishments'.tr
                        : from == 'Volunteering'
                            ? 'Update Volunteering'.tr
                            : 'Update Skills'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height / 30,
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
                        maxLines: 6,
                        keyboardType: TextInputType.text,
                        controller: textCon,
                        textInputAction: TextInputAction.done,
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
                            hintText: from == 'Acomplish'
                                ? "Write your accomplishments here".tr
                                : from == 'Volunteering'
                                    ? 'Write your Volunteering here'.tr
                                    : "Write your skills here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        if (from == 'Acomplish') {
                          await ApiUtils.getuserAccomplishmentsEdit(
                              controller: controller,
                              detail: textCon.text,
                              id: id,
                              index: index);
                          setState(() {});
                        } else if (from == 'Volunteering') {
                          await ApiUtils.getuserVolunteeringEdit(
                              controller: controller,
                              detail: textCon.text,
                              id: id,
                              index: index);
                          setState(() {});
                        } else {
                          await ApiUtils.getuserSkillsEdit(
                              controller: controller,
                              detail: textCon.text,
                              id: id,
                              index: index);
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
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
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        });
  }

  experince({ProfileController? controller, String from = 'experince'}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController position = TextEditingController();
    TextEditingController company_name = TextEditingController();
    TextEditingController time_duration = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width / 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: height / 2,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    from == 'Education' ? 'Add Education'.tr : 'Add Experience'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height / 30,
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
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        controller: position,
                        textInputAction: TextInputAction.done,
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
                            hintText: from == 'Education'
                                ? "Write your School name".tr
                                : "Write your position here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
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
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        controller: company_name,
                        textInputAction: TextInputAction.done,
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
                            hintText: from == 'Education'
                                ? "Write your degree type".tr
                                : "Write your company name".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
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
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        controller: time_duration,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle:
                                TextStyle(color: greyColor, fontSize: 12),
                            hintText: from == 'Education'
                                ? "Time Duration".tr
                                : "Write your time duration".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        if (from == 'Education') {
                          await ApiUtils.getuserEducation(
                              controller: controller,
                              degree_type: position.text,
                              school_name: company_name.text,
                              start_end: time_duration.text);
                          setState(() {});
                        } else {
                          await ApiUtils.getuserExperience(
                              controller: controller,
                              degree_type: position.text,
                              school_name: company_name.text,
                              start_end: time_duration.text);
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            'Add'.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        });
  }

  experinceEdit(
      {ProfileController? controller,
      String from = 'experince',
      String? positions,
      String? companyName,
      String? duration,
      String? id,
      int? index}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController position = TextEditingController();
    TextEditingController company_name = TextEditingController();
    TextEditingController time_duration = TextEditingController();
    position.text = positions!;
    company_name.text = companyName!;
    time_duration.text = duration!;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width / 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: height / 2,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    from == 'Education'
                        ? 'Update Education'.tr
                        : 'Update Experience'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height / 30,
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
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        controller: position,
                        textInputAction: TextInputAction.done,
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
                            hintText: from == 'Education'
                                ? "Write your Education here".tr
                                : "Write your position here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
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
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        controller: company_name,
                        textInputAction: TextInputAction.done,
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
                            hintText: from == 'Education'
                                ? "Write your Education here".tr
                                : "Write your company name".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
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
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        controller: time_duration,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle:
                                TextStyle(color: greyColor, fontSize: 12),
                            hintText: from == 'Education'
                                ? "Write your Education here".tr
                                : "Write your time duration".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        if (from == 'Education') {
                          await ApiUtils.getuserEducationEdit(
                              controller: controller,
                              degree_type: position.text,
                              school_name: company_name.text,
                              start_end: time_duration.text,
                              id: id,
                              index: index);
                          setState(() {});
                        } else {
                          await ApiUtils.getuserExperienceEdit(
                              controller: controller,
                              degree_type: position.text,
                              school_name: company_name.text,
                              start_end: time_duration.text,
                              id: id,
                              index: index);
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
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
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        });
  }
}
