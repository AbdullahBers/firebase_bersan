library firebase_bersan;

import 'package:flutter/material.dart';
import 'package:firebase_bersan/alert_box.dart/error_alert.dart';
import 'package:firebase_bersan/constant/auth_message.dart' as auth;
import 'package:firebase_bersan/constant/cloud_message.dart';
import 'package:firebase_bersan/firebase/firebase_auth_bersan.dart';
import 'package:firebase_bersan/firebase/firebase_cloud_bersan.dart';

class FirebaseBersan {
  //  Auth
  static handleAuth({Widget index, Widget mainAppController}) {
    return Auth.handleAuth(index, mainAppController);
  }

  static Future<dynamic> authSignIn(
      {String email, String password, bool debugMode, context}) async {
    FocusScope.of(context).requestFocus(FocusNode());

    final response = await Auth.signIn(email: email, password: password);

    if (response == "OK")
      return auth.SUCCESS;
    else {
      if (debugMode == true) ErrorAlert.errorAlert(response, context);

      return response;
    }
  }

  static Future<dynamic> authSignUp(
      {String email,
      String password,
      Map<String, dynamic> map,
      bool debugMode,
      context,
      String cloud}) async {
    FocusScope.of(context).requestFocus(FocusNode());

    final response = await Auth.signUp(
        email: email, password: password, map: map, cloud: cloud);

    if (response == "OK")
      return auth.SUCCESS;
    else {
      if (debugMode == true) ErrorAlert.errorAlert(response, context);

      return response;
    }
  }

  static authLogOut() async {
    return await Auth.logOutAuth();
  }

  static currentUser() async {
    return await Auth.currentUser();
  }

  // Cloud 

  static cloudSet(
      {String email,
      Map<String, dynamic> map,
      String cloud,
      bool debugMode,
      context}) async {
    final response = await Cloud.setCloud(
      email: email,
      map: map,
      cloud: cloud,
    );

    if (debugMode == true && response != "OK")
      ErrorAlert.errorAlert(UNDEFINED_ERROR_CLOUD, context);

    return response;
  }

  static cloudUpdate(
      {String email,
      Map<String, dynamic> map,
      String cloud,
      bool debugMode,
      context}) async {
    final response = await Cloud.updateCloud(
      email: email,
      map: map,
      cloud: cloud,
    );

    if (debugMode == true && response != "OK")
      ErrorAlert.errorAlert(UNDEFINED_ERROR_CLOUD, context);

    return response;
  }
}
