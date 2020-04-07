import 'package:flutter/material.dart';
import 'package:intern/CustomerRegistration.dart';
import 'package:intern/partnerregistration.dart';
import 'package:intern/sellerregistration.dart';

class FindUser extends StatefulWidget {
  @override
  _FindUserState createState() => _FindUserState();
}

class _FindUserState extends State<FindUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text("Register As ",style: TextStyle(fontSize: 30,fontFamily:'OpenSans',fontWeight: FontWeight.bold,),),
            ),
            FlatButton(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 20),
                color: Colors.green,
                child: ListTile(
                  title: Text(
                    "Customer",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1.5),
                  ),
                ),
            ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CutomerRegistration()));
              },
            ),
            FlatButton(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 20),
                color: Colors.green,
                child: ListTile(
                  title: Text(
                    "Seller",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SellerRegistration()));
              },
            ),
            FlatButton(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 20),
                color: Colors.green,
                child: ListTile(
                  title: Text(
                    "Delivery Partner",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PartnerRegistration()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
