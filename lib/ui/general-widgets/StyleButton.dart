import 'package:flutter/material.dart';
class StyleButton extends StatefulWidget {
  Function function;
  double paddingLeft;
  double paddingRight;
  String txt;
  double paddingTxt;

  StyleButton(this.function, this.paddingLeft,this.paddingRight, this.txt,this.paddingTxt);

  @override
  _StyleButtonState createState() => _StyleButtonState();
}

class _StyleButtonState extends State<StyleButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0,bottom: 8,left: widget.paddingLeft,right: widget.paddingRight),
      child: ElevatedButton(
        onPressed: widget.function,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
            )
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: widget.paddingTxt),
          child: Text(widget.txt,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
        ),
      ),
    );
  }
}
