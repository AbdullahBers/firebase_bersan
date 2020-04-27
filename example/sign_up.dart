import 'package:firebase_bersan/firebase_bersan.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: email,
            ),
            new TextField(
              controller: password,
            ),
            new MaterialButton(
              child: new Text("Validate"),
              onPressed: () {
                Map<String, dynamic> mapRegister = {
                  "email": email.text,
                  "password": password.text,
                  "dateRegister": DateTime.now(),
                };

                FirebaseBersan.authSignUp(
                  email: email.text,
                  password: password.text,
                  context: context,
                  // The map is optional if you want to directly add the registered user in the auth and also in firestore you can add him this way
                  map: mapRegister,
                  // the name you put when you created firestore example "users"
                  cloud: "users",
                  // If the debugMode is a true if an error comes from an alertBox will be displayed with the message of the error to be propagated if you want to manage the error yourself just set the value to false recover the error return and manage it
                  debugMode: true,
                ).then((e) {
                  if (e == "OK") {
                    // If the return value is OK you can redirect the user.
                    // ...
                  }
                  if (e != "OK") {
                    // If you set the debugMode parameters to false you can get the value back like this
                    String error = e.toString();
                    print(error);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
