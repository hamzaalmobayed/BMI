import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {
Function function;

CustomAppBar(this.function);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blue,
      leading: IconButton(
        color: Colors.white,
        iconSize: 30,
        icon: Icon(Icons.arrow_back),
        onPressed: function,
      ),
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
