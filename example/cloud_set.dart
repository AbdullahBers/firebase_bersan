import 'package:firebase_bersan/firebase_bersan.dart';
import 'package:flutter/material.dart';

class CloudSet extends StatefulWidget {
  @override
  _CloudSetState createState() => _CloudSetState();
}

class _CloudSetState extends State<CloudSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new Center(
          child: MaterialButton(
            onPressed: () {
              Map<String, dynamic> map = {
                "email": "abubersan@gmail.com",
                "password": "test",
                "dateRegister": DateTime.now(),
              };

              FirebaseBersan.cloudSet(
                email: "abubersan@gmail.com",
                map: map,
                debugMode: true,
                context: context,
              );
            },
            child: new Text("Set data"),
          ),
        ),
      ),
    );
  }
}
