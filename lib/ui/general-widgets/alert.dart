import 'package:bmi_project/routes/Routes.dart';
import 'package:flutter/material.dart';

class CustomDialoug {
  CustomDialoug._();
  static CustomDialoug customDialoug = CustomDialoug._();
  showCustomDialoug(String message, [Function function]) {
    showDialog(
        context: RouteHelper.routeHelper.navKey.currentContext,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            backgroundColor: Colors.blue,
            contentTextStyle: TextStyle(color: Colors.white,fontSize: 20),
            actions: [
              TextButton(
                  onPressed: () {
                    if (function == null) {
                      RouteHelper.routeHelper.back();
                    } else {
                      function();
                      RouteHelper.routeHelper.back();
                    }
                  },
                  child: Text('ok',style: TextStyle(color: Colors.white,fontSize: 20),))
            ],
          );
        });
  }
}