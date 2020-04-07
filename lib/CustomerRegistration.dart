import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intern/CutomerRegistartion1.dart';
import 'package:intern/constants.dart';
import 'package:intern/partnerregistration.dart';
import 'package:intern/sellerregistration.dart';
import 'package:intern/user.dart';

class CutomerRegistration extends StatefulWidget {
  @override
  _CutomerRegistrationState createState() => _CutomerRegistrationState();
}

class _CutomerRegistrationState extends State<CutomerRegistration> {

  bool boolean=true;
  var first;
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.green,
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.location_on,
                color: Colors.redAccent,
              ),
              onPressed: () {
              }),
          new IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
              onPressed: () {
              }),
          Container(
              margin: EdgeInsets.all(10.0),
              decoration: kBoxDecorationStyle2,
              height: 20,
              child:Row(
                children: <Widget>[
                  Container(
                      width: 100.0,
                      child: new TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15.0),
                          hintStyle: kHintTextStyle,
                        ),)
                  ),
                  new IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      onPressed: () {
                      }),
                ],
              )
          ),
          new IconButton(
              icon: Icon(
                Icons.account_balance_wallet,
                color: Colors.redAccent,
              ),
              onPressed: () {
              }),
          new IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.redAccent,
              ),
              onPressed: () {
              }),
        ],
      ),
      drawer: new Drawer(
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[

            new IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                }),
          Container(
            margin: EdgeInsets.only(left: 290),
              child:Row(
                children: <Widget>[
                  new IconButton(
                      icon: Icon(
                        Icons.account_box,
                        color: Colors.red,
                      ),
                      onPressed: () {
                      }),
                ],
              )
          )
          ],
        ),
      ),
      body: DecoratedBox(
    position: DecorationPosition.background,
    decoration: BoxDecoration(
    color: Colors.green
    ),
      child:SingleChildScrollView(
        child:Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Row(

                            children: <Widget>[

                              RaisedButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(13.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PartnerRegistration()));
                                },
                                color: Colors.lightBlueAccent,
                                textColor: Colors.white,
                                child: Text("Start your Carrer as a Delivery Partner",
                                    style: TextStyle(fontSize: 10)),
                              ),
                              SizedBox(width: 10),
                              RaisedButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(13.0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SellerRegistration()));
                                },
                                color: Colors.lightBlueAccent,
                                textColor: Colors.white,
                                child: Text("Get Your Shop Online",
                                    style: TextStyle(fontSize: 10)),
                              ),
                            ],
                          )
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 145.0,top: 10.0,bottom: 10.0,left: 15.0  ),
                        child: Text("Customer Registration:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            FlatButton(
                              child: Row(
                                children: <Widget>[
                                  CircularCheckBox(
                                    value: boolean,
                                  ),
                                  Container(

                                    child: Text("I have Aadhar Card",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold,color: Colors.black),),
                                  )
                                ],
                              ),

                            ),
                            FlatButton(
                              child: Row(
                                children: <Widget>[
                                  CircularCheckBox(
                                    value: !boolean,
                                  ),
                                  Container(

                                    child: Text("I don't have Aadhar Card",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold,color: Colors.black),),
                                  )
                                ],
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CutomerRegistration1()));
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kBoxDecorationStyle,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15.0),
                            hintText: 'Enter your Aadhar ID',
                            hintStyle: kHintTextStyle,
                            suffixIcon: IconButton(
                              icon: new Icon(Icons.center_focus_weak,color: Colors.black,),
                            ),
                          ),


                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kBoxDecorationStyle,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15.0),
                            hintText: 'Enter your Name*',
                            hintStyle: kHintTextStyle,
                          ),



                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 200.0,
                              margin: EdgeInsets.only(left: 10.0),
                              decoration: kBoxDecorationStyle,
                              height: 40,
                              child: TextFormField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintText: 'Enter your Address',
                                  hintStyle: kHintTextStyle,
                                  suffixIcon: IconButton(
                                    icon: new Icon(Icons.my_location,color: Colors.blue,),
onPressed: _getCurrentLocation,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 115.0,
                              margin: EdgeInsets.only(left: 5.0,right: 10.0),
                              decoration: kBoxDecorationStyle,
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15.0),
                                  hintText: 'Pin Code',
                                  hintStyle: kHintTextStyle,
                                ),
                              ),
                            )
                          ],
                        ),

                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kBoxDecorationStyle,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15.0),
                            hintText: 'Enter Mobile Number*',
                            hintStyle: kHintTextStyle,
                          ),


                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kBoxDecorationStyle,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15.0),
                            hintText: 'Enter Email id',
                            hintStyle: kHintTextStyle,
                          ),


                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kBoxDecorationStyle,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15.0),
                            hintText: 'Enter Password*',
                            hintStyle: kHintTextStyle,
                          ),

                          obscureText: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kBoxDecorationStyle,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15.0),
                            hintText: 'Re enter Password*',
                            hintStyle: kHintTextStyle,
                          ),

                          obscureText: true,
                        ),
                      ),
                      RaisedButton(
                        elevation: 10,
                        onPressed: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 10.0,bottom: 10.0),
                          child: Text('Register',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        ),
                        color: Colors.green,
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),

          SizedBox(height: 40,)
            ],

          ),

        ),
      ),

      ),

    );

  }
  void _getCurrentLocation() async {

    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;
    _controller.text=first.addressLine;

    print("${first.featureName} : ${first.addressLine}");
  }

}
