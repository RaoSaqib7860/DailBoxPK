import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  'Contact Us',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Card(
                          child: Container(
                            height: 110,
                            width: 110,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: blueColor),
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Call Us',
                                  style: TextStyle(
                                      color: blueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            height: 110,
                            width: 110,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orange),
                                    child: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Email Us',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            height: 110,
                            width: 110,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Chat with Us',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Quick Contact',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        // height: 100.0,
                        margin: const EdgeInsets.only(bottom: 6.0),
                        //Same as `blurRadius` i guess
                        padding: const EdgeInsets.all(6.0),
                        //Same as `blurRadius` i guess
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
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: greyColor,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle:
                                  TextStyle(color: greyColor, fontSize: 14),
                              hintText: "First Name"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        // height: 100.0,
                        margin: const EdgeInsets.only(bottom: 6.0),
                        //Same as `blurRadius` i guess
                        padding: const EdgeInsets.all(6.0),
                        //Same as `blurRadius` i guess
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
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: greyColor,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle:
                                  TextStyle(color: greyColor, fontSize: 14),
                              hintText: "Email"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        // height: 100.0,
                        margin: const EdgeInsets.only(bottom: 6.0),
                        //Same as `blurRadius` i guess
                        padding: const EdgeInsets.all(6.0),
                        //Same as `blurRadius` i guess
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
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: greyColor,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle:
                                  TextStyle(color: greyColor, fontSize: 14),
                              hintText: "Phone"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        // height: 100.0,
                        margin: const EdgeInsets.only(bottom: 6.0),
                        //Same as `blurRadius` i guess
                        padding: const EdgeInsets.all(6.0),
                        //Same as `blurRadius` i guess
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
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          decoration: new InputDecoration(
                              prefixIcon: Container(
                                transform: Matrix4.translationValues(0, -50, 0),
                                child: Icon(
                                  Icons.email,
                                  color: greyColor,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle:
                                  TextStyle(color: greyColor, fontSize: 14),
                              hintText: "Message"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      child: RaisedButton(
                        color: blueColor,
                        onPressed: () {},
                        child: Text(
                          "SEND",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
