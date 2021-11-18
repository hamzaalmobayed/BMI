import 'package:flutter/material.dart';
class TextFieldWithBorder extends StatelessWidget {
  TextEditingController con= TextEditingController();

  TextFieldWithBorder(this.con);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(
        primaryColor:  Colors.blue,
        primaryColorDark:  Colors.blue,
      ),
      child: Container(
        width: 150,
        height: 80,
        child: new TextField(
          controller: con,
          decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.blue)),
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.green,
              ),
        ),
    ),
      ));
  }
}
