import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 45,
                        color: blueColor,
                        child: Theme(
                            data: new ThemeData(
                                canvasColor: blueColor,
                                primaryColor: Colors.black,
                                accentColor: Colors.black,
                                hintColor: Colors.black),
                            child: DropdownButton<String>(
                              items: <String>['INDUSTRY', 'B', 'C', 'D']
                                  .map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                  ),
                                );
                              }).toList(),
                              value: 'INDUSTRY',
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              style: TextStyle(color: Colors.white),
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
                        height: 45,
                        color: Colors.red[900],
                        child: Theme(
                            data: new ThemeData(
                                canvasColor: Colors.red[900],
                                primaryColor: Colors.black,
                                accentColor: Colors.black,
                                hintColor: Colors.black),
                            child: DropdownButton<String>(
                              items: <String>['CATEGORIES', 'B', 'C', 'D']
                                  .map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                              value: 'CATEGORIES',
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              style: TextStyle(color: Colors.white),
                              isExpanded: true,
                              onChanged: (_) {},
                            )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 3,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: greyColor,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintStyle: TextStyle(color: greyColor, fontSize: 14),
                        hintText: "Search chat box"),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (BuildContext ctxt, int index) {
                return ChatBoxItem();
              },
              separatorBuilder: (BuildContext ctxt, int index) {
                return Divider(
                  thickness: 10,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ChatBoxItem extends StatefulWidget {
  @override
  _ChatBoxItemState createState() => _ChatBoxItemState();
}

class _ChatBoxItemState extends State<ChatBoxItem> {
  String text =
      'Arrive at your destination in the smoothest ride possible, by sailing through real-time trip planning to payment with a few clicks. We\'re never more than 5 minutes away with pick-up stations closer from and to your home, office or anywhere in between. Grabbing coffee along your way?';

  String? firstHalf;
  String? secondHalf;
  bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
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
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://post.healthline.com/wp-content/uploads/2019/01/Male_Doctor_732x549-thumbnail.jpg'))),
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
                            'Aaban Motors Cars',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Text(
                          '30 min',
                          style: TextStyle(color: greyColor, fontSize: 11),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.menu)
                      ],
                    ),
                    Text(
                      'Automobile > Bikes',
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
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
                              flag ? "See more" : "See less",
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
            height: 2,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.thumb_up,
                      color: blueColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '25 Likes',
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
                      Icons.chat,
                      color: blueColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '12 Comments',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
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
