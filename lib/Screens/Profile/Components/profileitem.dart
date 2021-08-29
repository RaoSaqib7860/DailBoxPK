import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileItem extends StatefulWidget {
  @override
  _ProfileItemState createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  String text =
      'Arrive at your destination in the smoothest ride possible, by sailing through real-time trip planning to payment with a few clicks. We\'re never more than 5 minutes away with pick-up stations closer from and to your home, office or anywhere in between. Grabbing coffee along your way?'.tr;

  String? firstHalf;
  String? secondHalf;
  bool flag = true;

  @override
  void initState() {
   
    if (text.length > 150) {
      firstHalf = text.substring(0, 150);
      secondHalf = text.substring(150, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircularProfileAvatar(
                '',
                child: Center(
                    child: Icon(
                  Icons.person,
                  color: Colors.black45,
                  size: 35,
                )),
                borderColor: Colors.black,
                borderWidth: 0.5,
                elevation: 3,
                radius: 22,
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
                            'Aaban Motors Cars'.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          ),
                        ),
                        Text(
                          '30 min',
                          style: TextStyle(color: greyColor, fontSize: 9),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Image(
                          image: AssetImage('assets/icons/more.png'),
                          color: Colors.black,
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                    Text(
                      'Automobile > Bikes'.tr,
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
          Text(
            '',
            style: TextStyle(color: greyColor, fontSize: 12),
          ),
          SizedBox(
            height: 20,
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
                      '25 Likes'.tr,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
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
                      '12 Comments'.tr,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10),
          ),
          Divider(
            thickness: 10,
          )
        ],
      ),
    );
  }
}
