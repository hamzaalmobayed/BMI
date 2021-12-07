
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  ToastMessage._();
  static ToastMessage toast = ToastMessage._();
  toastMessage(txt){
    return Fluttertoast.showToast(
        msg: txt,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor:Colors.white,
        fontSize: 16.0
    );
  }
}