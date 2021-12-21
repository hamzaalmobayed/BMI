import 'package:bmi_project/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class TextFieldAdding extends StatefulWidget {
  String hint;
  Icon icon;
  int num;
  bool obscure=true;
  TextEditingController con= TextEditingController();
  TextFieldAdding(this.hint,this.con,this.obscure,[this.num,this.icon]);

  @override
  _TextFieldAddingState createState() => _TextFieldAddingState();
}

class _TextFieldAddingState extends State<TextFieldAdding> {
  @override
  Widget build(BuildContext context) {
    return widget.icon==null?TextFormField(
      validator: widget.hint=="Password"?Provider.of<BMIProvider>(context,listen: false).validatePassword:Provider.of<BMIProvider>(context,listen: false).validateName,
      controller: widget.con,
      obscureText: widget.obscure,
      decoration: new InputDecoration(
          hintText: widget.hint,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.blue,width: 2),
            //  when the TextFormField in unfocused
          ) ,
          border: new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: Colors.blue
              )
          )
      ),
    ):TextFormField(
      validator: Provider.of<BMIProvider>(context,listen: false).validatePassword,
      controller: widget.con,
      obscureText: widget.obscure,
      decoration: new InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(widget.num==1?Provider.of<BMIProvider>(context,listen: false).obscure
              ? Icons.visibility_off
              : Icons.visibility:Provider.of<BMIProvider>(context,listen: false).obscureSignUp
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: (){
            widget.num==1?Provider.of<BMIProvider>(context,listen: false).setObscure():Provider.of<BMIProvider>(context,listen: false).setObscureSignUp();
          }
        ),
          hintText: widget.hint,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.blue,width: 2),
            //  when the TextFormField in unfocused
          ) ,
          border: new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: Colors.blue
              )
          )
      ),
    );
  }
}