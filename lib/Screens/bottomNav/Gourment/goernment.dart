import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';

class Government extends StatefulWidget {
  @override
  _GovernmentState createState() => _GovernmentState();
}

class _GovernmentState extends State<Government> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Material(
              elevation: 3,
              child: TextFormField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  prefixIcon: Icon(Icons.search,color: greyColor,),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintStyle: TextStyle(color: greyColor,fontSize: 14),
                    hintText: "Search in government directory"),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (BuildContext ctxt, int index){
                  return Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('RMS Pack & Movers',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                              SizedBox(height: 10,),
                              Text('Office No. 373, Islamabad',style: TextStyle(
                                  color: greyColor,fontSize: 12
                              ),),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.only(left: 1, right: 1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                          content: SingleChildScrollView(
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              padding: EdgeInsets.all(15),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                    Text('RMS Pack & Movers',
                                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                                    IconButton(icon: Icon(Icons.clear),
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                    },)
                                                  ],),
                                                  //SizedBox(height: 10,),
                                                  Text('- 20 July 2020',
                                                  style: TextStyle(color: greyColor,fontSize: 14),),
                                                  SizedBox(height: 10,),
                                                  Text('- Logistics',
                                                    style: TextStyle(color: greyColor,fontSize: 14),),
                                                  SizedBox(height: 10,),
                                                  Text('- http://dialbox.com',
                                                    style: TextStyle(color: greyColor,fontSize: 14),),
                                                  SizedBox(height: 10,),
                                                  Divider(),
                                                  Text('Contact info',
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                                  SizedBox(height: 10,),
                                                  Text('Office No: 373, Street No: 71, F-11/1, Islamabad',
                                                    style: TextStyle(color: greyColor,fontSize: 14),),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(Icons.phone,color: greyColor,size: 20,),
                                                      SizedBox(width: 5,),
                                                      Text('+92 345 6789102',
                                                        style: TextStyle(color: greyColor,fontSize: 14),),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Text('Bussiness Overview',
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                                  SizedBox(height: 10,),
                                                  Text('Office No: 373, Street No: 71, F-11/1, Islamabad Office No: 373, Street No: 71, F-11/1, Islamabad Office No: 373, Street No: 71, F-11/1, Islamabad',
                                                    style: TextStyle(color: greyColor,fontSize: 14),),

                                                  Divider(),
                                                  Text('Bussiness Overview',
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                                  SizedBox(height: 10,),
                                                  Text('- Appliances',
                                                    style: TextStyle(color: greyColor,fontSize: 14),),
                                                  SizedBox(height: 10,),
                                                  Text('- Handyman Services',
                                                    style: TextStyle(color: greyColor,fontSize: 14),),
                                                  SizedBox(height: 10,),
                                                  Text('- Appliances',
                                                    style: TextStyle(color: greyColor,fontSize: 14),),
                                                  SizedBox(height: 10,),
                                                ],
                                              ),
                                            ),
                                          ),

                                        );
                                      });
                                });
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                            child: Text('Contact',style: TextStyle(color: Colors.white,fontSize: 12),),
                            decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(3)
                            ),),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                  );

                },
                separatorBuilder:(BuildContext ctxt, int index){
                  return Divider();
                } ,

              ),
            )
          ],
        ),
      ),
    );
  }
}
