import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/constants.dart';

class UserProfilePage extends StatelessWidget {

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      margin:EdgeInsets.only(top: 50),
      height:180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/2845445.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _buildProfileImage() {
    return Center(
      child: Container(
          margin: EdgeInsets.only(left: 10.0,top:40,right: 220 ),
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('images/2845445.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(blurRadius: 7.0, color: Colors.black)
              ])

      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
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
      body: Stack(
        children: <Widget>[

          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.4),
                  _buildProfileImage(),
                  //_builddetails(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}