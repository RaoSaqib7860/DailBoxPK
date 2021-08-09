import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
                        child: Center(
                          child: Text(
                            'User Messages',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 45,
                        color: greyColor,
                        child: Center(
                          child: Text(
                            'Bussiness Messages',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
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
                        hintText: "Search user messages"),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15,top: 15),
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: blueColor,width: 1),
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
                                          color: blueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Okay thanks dude!!',
                                style: TextStyle(
                                    color: greyColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '12:30 am',
                              style:
                              TextStyle(color: greyColor, fontSize: 11),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                           true? Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: blueColor
                              ),
                              child: Text('123',style: TextStyle(color: Colors.white,fontSize: 10),),
                            ):Container()
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext ctxt, int index) {
                  return Divider(
                    thickness: 10,
                    color: Colors.transparent,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
