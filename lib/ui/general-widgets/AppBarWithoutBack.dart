import 'package:flutter/material.dart';
class AppBarWithoutBack extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blue,
      centerTitle: true,
      toolbarHeight: 70,
      title: Text(
        "BMI Analyzer",
        style: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
