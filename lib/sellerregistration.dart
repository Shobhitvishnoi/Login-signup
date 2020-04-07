import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intern/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SellerRegistration extends StatefulWidget {
  @override
  _SellerRegistrationState createState() => new _SellerRegistrationState();
}

class _SellerRegistrationState extends State<SellerRegistration> {

  File image;
  String fileName='';
  var first;

//  To use Gallery or File Manager to pick Image
//  Comment Line No. 19 and uncomment Line number 20
  picker1() async {
    print('Picker is called');
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      shopimage=image;
      fileName = image.path.split('/').last;

      setState(() {});
    }
  }
  picker() async {
    print('Picker is called');
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      shopinterior=image;
      fileName = image.path.split('/').last;

      setState(() {});
    }
  }

Size screenSize;
  int _currentStep = 0;
  String name,email,address,aadhar,mobile;
  String vehicle,license,delivery;
  bool checkBoxValue=false;
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller1 = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController(text:"Enter your address");
  final TextEditingController _controller3 = new TextEditingController(text:"");
  final TextEditingController _controller4 = new TextEditingController(text:"");
  var items1 = ['Sastha Hyper Mall'];

  String  shopname,GST,location,shopcontactnumber,shopemailid;
  File shopimage,shopinterior;
  var items = ['Bike','Car'];
  @override
  Widget build(BuildContext context) {
     screenSize = MediaQuery.of(context).size;
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
        title: Text('Owner Details',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 150.0,top: 10.0,bottom: 10.0,left: 5.0  ),
              child: Text("Seller Registration:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
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
                      controller: _controller2,
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
        title: Text('Shop Details',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 150.0,top: 10.0,bottom: 10.0,left: 5.0  ),
              child: Text("Seller Registration:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: kBoxDecorationStyle,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Enter Shop Name*',
                  hintStyle: kHintTextStyle,
                ),

                onChanged: (input){
                  this.shopname=input;
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 145.0,
                    margin: EdgeInsets.only(left: 5.0,right: 10.0),
                    decoration: kBoxDecorationStyle,
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(17.0),
                        hintText: 'Enter Shop Pin Code*',
                        hintStyle: kHintTextStyle2,
                      ),
                    ),
                  ),
                  Container(
                    width: 160.0,
                    margin: EdgeInsets.only(left: 0.0),
                    decoration: kBoxDecorationStyle,
                    height: 40,
                    child: TextFormField(
                      controller: _controller3,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(7.0),
                        hintText: 'Choose Location*',
                        hintStyle: kHintTextStyle2,
                        suffixIcon: IconButton(
                          icon: new Icon(Icons.my_location,color: Colors.blue,),
                          onPressed: _getCurrentLocation1,

                        ),
                      ),
                      onChanged: (input){
                        this.location=input;
                      },
                    ),
                  ),

                ],
              ),

            ),
            Container(
                child:Row(
                  children: <Widget>[
                    Container(
                      width: 220.0,
                      margin: EdgeInsets.all(5.0),
                      decoration: kBoxDecorationStyle,
                      height: 40,
                      child: TextFormField(
controller: _controller4,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15.0),
                          hintText: 'Upload front image Of shop*',
                          hintStyle: kHintTextStyle2,

                        ),

                      ),
                    ),

                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                      ),
                      onPressed: () {

                        picker1();
                        shopimage=image;
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
                      width: 220.0,
                      margin: EdgeInsets.all(5.0),
                      decoration: kBoxDecorationStyle,
                      height: 40,
                      child: TextFormField(

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15.0),
                          hintText: 'Upload some interior image Of shop*',
                          hintStyle: kHintTextStyle2,
                        ),

                      ),
                    ),

                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                      ),
                      onPressed: () {
                        picker();

                        print(shopinterior);
                        print(image);
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
              child: new Column(
                children: [
                  new Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Row(
                      children: <Widget>[
                        Container(

                            margin: EdgeInsets.all(5.0),
                            decoration: kBoxDecorationStyle,
                            height: 40,
                            child:Row(
                              children: <Widget>[
                                Container(
                                    width: 255.0,
                                    child: new TextFormField(controller: _controller1,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(15.0),
                                        hintText: 'Choose Shop Category*',
                                        hintStyle: kHintTextStyle1,
                                      ),)
                                ),
                                Container(
                                  child: PopupMenuButton<String>(
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onSelected: (String value) {
                                      _controller1.text = value;

                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items1.map<PopupMenuItem<String>>((String value) {
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
              margin: EdgeInsets.all(5.0),
              decoration: kBoxDecorationStyle,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Enter Shop Contact Number',
                  hintStyle: kHintTextStyle,
                ),
                onChanged: (input){
                  this.shopcontactnumber=input;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: kBoxDecorationStyle,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Enter Shop Contact Email Id',
                  hintStyle: kHintTextStyle,
                ),

                onChanged: (input){
                  this.shopemailid=input;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: kBoxDecorationStyle,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'GST Number',
                  hintStyle: kHintTextStyle,
                ),
                onChanged: (input){
                  this.GST=input;
                },
              ),
            ),
            SizedBox(height: 20,),
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
              margin: EdgeInsets.only(right: 150.0,top: 0.0,bottom: 0.0,left: 5.0  ),
              child: Text("Seller Registration:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            _buildCoverImage(screenSize),
            Container(
              child: Row(
                children: <Widget>[
                  _buildProfileImage(),

                  Column(
                    children: <Widget>[
                      Container(
                        child: Text("${shopname}",style: TextStyle(fontSize: 20),),
                      ),

                         Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text("${location}",style: TextStyle(fontSize: 8),),
                        ),

                      Container(
                        child: Text("📞 ${shopcontactnumber}",style: TextStyle(fontSize: 15),),
                      ),
                      Container(
                        child: Text(" ✉ ${shopemailid}",style: TextStyle(fontSize: 15),),
                      ),
                      Container(
                        child: Text(" GST : ${GST}",style: TextStyle(fontSize: 15),),
                      ),
                    ],

                  )
                ],
              ),
            ),




            Container(

              margin: EdgeInsets.only(right: 200.0,top: 10.0,bottom: 0.0,left: 5.0  ),
              child: Text("Owner Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),

            Container(
              margin: EdgeInsets.only(left: 15.0,top: 5),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Name",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 50,),
                  Container(
                    child: new Text("${name}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0,top: 5),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Address",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 35,),

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
              margin: EdgeInsets.only(left: 15.0,top: 5),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Mobile No",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 21,),
                  Container(
                    child: new Text("${mobile}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0,top: 5),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Email Id",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 38),
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
              margin: EdgeInsets.only(left: 15.0,top: 5),
              child: Row(
                children: <Widget>[
                  Container(
                    child: new Text("Aadhar ID",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20)),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    child: new Text("${aadhar}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20)),
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
    _controller2.text=first.addressLine;
    address=first.addressLine;
    print("${first.featureName} : ${first.addressLine}");
  }
  void _getCurrentLocation1() async {

    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;
    _controller3.text=first.addressLine;
    location=first.addressLine;
    print("${first.featureName} : ${first.addressLine}");
  }
  Widget _buildCoverImage(Size screenSize) {

    return Column(
      children: <Widget>[
        Container(
          margin:EdgeInsets.only(top: 5),
          height:100,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
                image: shopinterior == null
                    ? AssetImage('images/2845445.jpg')
                    : FileImage(shopinterior),
                fit: BoxFit.cover
            ),
          ),
        )
      ],

    );
  }
  Widget _buildProfileImage() {

      return Center(
      child: Container(
          margin: EdgeInsets.only(left: 5.0,top:0.0,right: 0 ),
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: shopimage == null
                    ? AssetImage('images/2845445.jpg')
                    : FileImage(shopimage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(blurRadius: 7.0, color: Colors.black)
              ])

      ),
    );

  }


}