
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/constants.dart';
import 'package:intern/partnerregistration.dart';
import 'package:intern/user.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool checkBoxValue=false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child:Form(
            key: _formKey,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 0.0,top: 40.0,right: 210),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  height: 60,
                  child: TextFormField(
                    validator: validateEmail,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15.0),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.teal,
                        size: 30,
                      ),
                      hintText: 'Enter your Aadhar id/Mobile/Email',
                      hintStyle: kHintTextStyle,
                    ),

                  ),
                ),
                Container(

                  decoration: kBoxDecorationStyle,
                  height: 60,
                  child: TextFormField(
                    validator: validatePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.teal,
                        size: 30,
                      ),
                      hintText: 'Enter your Password',
                      hintStyle: kHintTextStyle,
                    ),

                    obscureText: true,
                  ),
                ),
                Container(
                    height: 60,
                    child: SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 10.0),
                            child: Row(
                              children: <Widget>[
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
                                      new Text("Remember Me")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left:35,right: 0.0,top: 10.0),
                              child: FlatButton(
                                  onPressed: null,
                                  child: Text("Forgot Password ?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue,),)


                              )
                          )
                        ],
                      ),
                    )
                ),
             SizedBox(height: 10.0,),
                RaisedButton(
                  elevation: 10,
                  onPressed: () {
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0,right: 100.0,top: 10.0,bottom: 10.0),
                    child: Text('Log In',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  color: Colors.green,
                ),
                Container(

                  height: 60,



                      child: SingleChildScrollView(
                        child: Row(
                          children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 15.0,right: 0.0,top: 10.0),
                            child: Text("Don't have an account ?",style: TextStyle(fontSize: 20,)),
                          ),
                            Container(
                              margin: EdgeInsets.only(left:0.0,right: 0.0,top: 10.0),
                              child: FlatButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>FindUser()));
                                  },
                                  child: Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue,),)


                              )
                            )
                          ],
                        ),
                      )
                ),
              ],

            ) ) ,
      ),
    );

  }
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {

      return 'Enter Valid Email';
    }
    else {

      return null;
    }
  }
  String validatePassword(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 6) {

      return 'Password must be of atleast 6 digit';
    }
    else {

      return null;
    }
  }
}
