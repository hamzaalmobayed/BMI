import 'package:bmi_project/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class TextFieldWithBorder extends StatelessWidget {
  TextEditingController con= TextEditingController();
  double width;
  String hint;
  TextFieldWithBorder(this.con,this.width,this.hint);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(
        primaryColor:  Colors.blue,
        primaryColorDark:  Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: 30,
          decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
          ),
          child: new TextFormField(
            validator: Provider.of<BMIProvider>(context,listen: false).validateName,
            textAlign: TextAlign.center,
            controller: con,
            decoration: new InputDecoration(
                border: InputBorder.none,
              enabledBorder:InputBorder.none

            ),
          ),
        ),
      ));
  }
}
