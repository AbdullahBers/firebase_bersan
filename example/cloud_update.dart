import 'package:firebase_bersan/firebase_bersan.dart';
import 'package:flutter/material.dart';

class CloudUpdate extends StatefulWidget {
  @override
  _CloudUpdateState createState() => _CloudUpdateState();
}

class _CloudUpdateState extends State<CloudUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new Center(
          child: MaterialButton(
            onPressed: () {
              // A user already exists in my firestore database
              // with the information :
              // "abubersan@gmail.com" {
              //   "email": "abubersan@gmail.com",
              //   "password": "test",
              //   "dateRegister": randomStuff
              //}
              //and I want to change
              // only his password. Be careful, this does not
              //change the password of the Auth !

              Map<String, dynamic> map = {
                "password": "azerty",
              };

              FirebaseBersan.cloudUpdate(
                email: "abubersan@gmail.com",
                map: map,
                debugMode: true,
                context: context,
              );
            },
            child: new Text("Update data"),
          ),
        ),
      ),
    );
  }
}
