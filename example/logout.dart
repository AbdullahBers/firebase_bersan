import 'package:firebase_bersan/firebase_bersan.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new Center(
          child: new GestureDetector(
            onTap: () {
              final response = FirebaseBersan.authLogOut();

              // If you have added the HandleAuth function to
              // the root of your project, you don't need to
              // redirect the user it will be automatically
              // redirected to the "/" route, but if you didn't
              //use the "HandleAuth" function you have to redirect
              //it yourself this way:

              if (response == "OK") {
                Navigator.pushNamed(context, "/");
              }
            },
            child: new Text("Click me"),
          ),
        ),
      ),
    );
  }
}
