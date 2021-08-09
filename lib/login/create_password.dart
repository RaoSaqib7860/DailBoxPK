import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreatePassword extends StatefulWidget {
  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Image(
                  image: AssetImage('assets/icons/logo_red.png'),
                  height: 50,
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Skip',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: new TextSpan(
                            text: 'Confirm',
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w400),
                            children: [
                              new TextSpan(
                                text: ' your ',
                                style: TextStyle(color: Colors.black),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () => print('Tap Here onTap'),
                              ),
                              new TextSpan(
                                text: 'password ',
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () => print('Tap Here onTap'),
                              ),
                              new TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: 'Let\'s finally..',
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () => print('Tap Here onTap'),
                              )
                            ]),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Register your bussiness with dialboxx to gain visibility in the marketplace.',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 50,
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
                                  Icons.lock_outline,
                                  color: greyColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (){},
                                  icon: Icon(
                                    Icons.remove_red_eye,
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
                                hintText: "New Password"),
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
                                  Icons.lock_outline,
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
                                hintText: "Confirm Password"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        // margin: EdgeInsets.only(left: 30,right: 30),
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        child: RaisedButton(
                          color: blueColor,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
                          },
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
