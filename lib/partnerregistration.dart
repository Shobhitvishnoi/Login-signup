
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:intern/constants.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PartnerRegistration extends StatefulWidget {
  @override
  _PartnerRegistrationState createState() => new _PartnerRegistrationState();
}

class _PartnerRegistrationState extends State<PartnerRegistration> {
  File image;
  String fileName='';
  var first;
  String _locationMessage = "";
//  To use Gallery or File Manager to pick Image
//  Comment Line No. 19 and uncomment Line number 20
  picker() async {
    print('Picker is called');
   // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
       fileName = image.path.split('/').last;

      setState(() {});
    }
  }






  int _currentStep = 0;
  String name,email,address,aadhar,mobile,delivery;
  String vehicle,license;
  String license1;
  bool checkBoxValue=false;
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller1 = new TextEditingController(text:"Enter Your Address");
  final TextEditingController _controller2 = new TextEditingController(text:"");
  var items = ['Bike','Car'];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              margin: EdgeInsets.all(8.0),
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
        child: Container(
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
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Center(
            child: Stepper(
              type: StepperType.horizontal,
              steps: _mySteps(),
              currentStep: this._currentStep,
              onStepTapped: (step){
                setState(() {
                  this._currentStep = step;
                });
              },

                controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        onPressed:onStepCancel,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 10.0,bottom: 10.0),
                          child: Text('Back',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        ),
                        color: Colors.green,
                      ),
                      RaisedButton(
                        onPressed:onStepContinue,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 10.0,bottom: 10.0),
                          child: Text('Submit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        ),
                        color: Colors.green,
                      ),
                    ],
                  );
                },
              onStepContinue: (){
                setState(() {
                  if(this._currentStep < this._mySteps().length - 1){
                    this._currentStep = this._currentStep + 1;

                  }else{
                    //Logic to check if everything is completed
                    addDialog(context);
                    print('Completed, check fields.');
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if(this._currentStep > 0){
                    this._currentStep = this._currentStep - 1;
                  }else{
                    this._currentStep = 0;
                  }
                });
              },

            ),



          ),

        ),

      ),
    );
  }

  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
        title: Text('Profile Details',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 150.0,top: 10.0,bottom: 10.0,left: 5.0  ),
              child: Text("Partner Registration:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
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
               onChanged: (input) => this.aadhar= input,

              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
              decoration: kBoxDecorationStyle,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Enter your Name*',
                  hintStyle: kHintTextStyle,
                ),
               onChanged: (input) => this.name= input,

              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 195.0,
                    margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
                    decoration: kBoxDecorationStyle,
                    height: 40,
                    child: TextFormField(
                      controller:_controller1,
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
                      onChanged: (input) => this.address= input,
                    ),

                  ),
                  Container(
                    width: 114.0,
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
              margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
              decoration: kBoxDecorationStyle,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Enter Mobile Number*',
                  hintStyle: kHintTextStyle,
                ),
                onChanged: (input) => this.mobile= input,

              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
              decoration: kBoxDecorationStyle,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Enter Email id',
                  hintStyle: kHintTextStyle,
                ),
                onChanged: (input) => this.email= input,

              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
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
              margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
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
            SizedBox(height: 25,),

          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Vehicle Details',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 150.0,top: 10.0,bottom: 10.0,left: 5.0  ),
              child: Text("Partner Registration:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),


            Container(
              child: new Column(
                children: [
                  new Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Row(
                      children: <Widget>[
                        Container(

                            margin: EdgeInsets.all(10.0),
                            decoration: kBoxDecorationStyle,
                            height: 40,
                            child:Row(
                              children: <Widget>[
                                Container(
                                    width: 250.0,
                                    child: new TextFormField(controller: _controller,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(17.0),
                                        hintText: '! Which types of vehicle you have?',
                                        hintStyle: kHintTextStyle2,
                                      ),
                                    )
                                ),
                                Container(
                                  child: PopupMenuButton<String>(
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onSelected: (String value) {
                                      _controller.text = value;
                                      delivery=value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items.map<PopupMenuItem<String>>((String value) {
                                        return new PopupMenuItem(child: new Text(value), value: value);
                                      }).toList();
                                    },
                                  ),
                                )
                              ],
                            )

                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                child:Row(
                  children: <Widget>[
                    Container(
                      width: 215.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: kBoxDecorationStyle,
                      height: 40,
                      child: TextFormField(

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(17.0),
                          hintText: '!Enter your Driving License Number*',
                          hintStyle: kHintTextStyle2,

                        ),
                        onChanged: (input){
                          this.license=input;
                        },

                      ),
                    ),

                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                      ),
                      onPressed: () {
                        picker();
                      },
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      child: Text("Choose File",
                          style: TextStyle(fontSize: 12)),
                    ),
                  ],
                )

            ),

            Container(
                child:Row(
                  children: <Widget>[
                    Container(
                      width: 215.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: kBoxDecorationStyle,
                      height: 40,
                      child: TextFormField(
controller: _controller2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(17.0),
                          hintText: '!Enter your vehicle Number*',
                          hintStyle: kHintTextStyle2,

                        ),
                        onChanged: (input){
                          this.vehicle=input;
                        },

                      ),
                    ),

                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                      ),
                      onPressed: () {
                        picker();
                      },
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      child: Text("Choose File",
                          style: TextStyle(fontSize: 12)),
                    ),
                  ],
                )

            ),




            SizedBox(height: 25,),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Preview & submit',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 150.0,top: 0.0,bottom: 10.0,left: 5.0  ),
              child: Text("Partner Registration:",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
            ),
            Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            ''),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 7.0, color: Colors.black)
                    ])),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Name",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 103,),
                  Container(
                    child: new Text("${name}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  new Container(
                    
                    child: new Text("Address",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 88,),


                     Expanded(
                        flex: 10,
                      child: Container(
                        child: new Text("${address}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15)),
                      ),
                    ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Mobile No",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 73,),
                  Container(
                    child: new Text("${mobile}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Email Id",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 90),
                    Expanded(
                      flex: 10,
                    child: Container(
                      child: new Text("${email}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15)),
                    ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Aadhar ID",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 75,),
                  Container(
                    child: new Text("${aadhar}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Delivery through",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 27,),
                  Container(
                    child: new Text("${delivery}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Driving License No",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: new Text("${license}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Vehicle Number",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    child: new Text("${vehicle}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  new Checkbox(value: checkBoxValue,
                      activeColor: Colors.green,
                      onChanged:(bool newValue){
                        setState(() {
                          checkBoxValue = newValue;
                        });
                      }),
                  new Text("I have read and agrred with all terms & condition")
                ],
              ),
            ),
          ],
        ),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            content: Container(
              margin: EdgeInsets.only(top: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        child: Text("Thank you for connect with us.",style: TextStyle(fontSize: 20),)
                    ),
                    Container(
                        child: Text("  Please Download & install your",style: TextStyle(fontSize: 20),)
                    ),
                    Container(
                        child: Text(" admin panel.",style: TextStyle(fontSize: 20),)
                    ),
                    SizedBox(height: 20,),

                    Container(
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Cancel",style: TextStyle(fontSize: 25,color:Colors.black,fontWeight: FontWeight.w400),),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                            new FlatButton(
                              color: Colors.green,
                              child: Text("Download",style: TextStyle(fontSize: 25,color:Colors.black,fontWeight: FontWeight.w400 ),),
                            )
                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
          );
        }
    );
  }
  void _getCurrentLocation() async {

    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
     first = addresses.first;
_controller1.text=first.addressLine;
address=first.addressLine;
    print("${first.featureName} : ${first.addressLine}");
  }

}