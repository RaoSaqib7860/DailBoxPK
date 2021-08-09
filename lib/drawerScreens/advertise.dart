import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Advertise extends StatefulWidget {
  @override
  _AdvertiseState createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30,bottom: 20),
            decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Text('Advertise',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),),
                IconButton(
                  icon: Icon(Icons.notifications,color: Colors.white,size: 30,),
                  onPressed: (){},
                ),
              ],),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: new TextSpan(text: 'Get your', style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),children: [
                        new TextSpan(
                          text: ' BANNER ',
                          style: TextStyle(color: blueColor),
                          recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                        ),
                        new TextSpan(
                          text: 'on the top, place your Ad with Dailbox enter youe details below...',
                          recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                        )
                      ]),
                    ),
                    SizedBox(height: 20,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                       // height: 100.0,
                        margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                        padding: const EdgeInsets.all( 6.0), //Same as `blurRadius` i guess
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
                             // prefixIcon: Icon(Icons.search,color: greyColor,),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle: TextStyle(color: greyColor,fontSize: 14),
                              hintText: "Company Name"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        // height: 100.0,
                        margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                        padding: const EdgeInsets.all( 6.0), //Same as `blurRadius` i guess
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
                            // prefixIcon: Icon(Icons.search,color: greyColor,),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle: TextStyle(color: greyColor,fontSize: 14),
                              hintText: "Bussiness ID"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              // height: 100.0,
                              margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                              padding: const EdgeInsets.all( 6.0), //Same as `blurRadius` i guess
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
                                  // prefixIcon: Icon(Icons.search,color: greyColor,),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                    hintStyle: TextStyle(color: greyColor,fontSize: 14),
                                    hintText: "First Name"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              // height: 100.0,
                              margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                              padding: const EdgeInsets.all( 6.0), //Same as `blurRadius` i guess
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
                                  // prefixIcon: Icon(Icons.search,color: greyColor,),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                    hintStyle: TextStyle(color: greyColor,fontSize: 14),
                                    hintText: "Last Name"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        // height: 100.0,
                        margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                        padding: const EdgeInsets.all( 6.0), //Same as `blurRadius` i guess
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
                            // prefixIcon: Icon(Icons.search,color: greyColor,),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle: TextStyle(color: greyColor,fontSize: 14),
                              hintText: "City Name"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        // height: 100.0,
                        margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                        padding: const EdgeInsets.all( 6.0), //Same as `blurRadius` i guess
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
                            // prefixIcon: Icon(Icons.search,color: greyColor,),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle: TextStyle(color: greyColor,fontSize: 14),
                              hintText: "Phone Number"),
                        ),
                      ),
                    ),
                   SizedBox(height: 10,),
                   Container(
                     width: MediaQuery.of(context).size.width,
                     height: 55,
                     child:  RaisedButton(
                       color: blueColor,
                       onPressed: () {

                       },
                       child: Text("SUBMIT",style: TextStyle(color: Colors.white),),
                     ),
                   )
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
