import 'package:flutter/material.dart';
class StringDropDownButton extends StatefulWidget {
  String value;
 Function function;
 List<String> list;
 double width;

  StringDropDownButton(this.value, this.function, this.list,this.width);

  @override
  _StringDropDownButtonState createState() => _StringDropDownButtonState();
}

class _StringDropDownButtonState extends State<StringDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
      ),
      height: 30,
      width: widget.width,
      child: DropdownButton<String>(
        value:widget.value,
        icon: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                border: Border(left:BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
            ),
            child: Icon(Icons.arrow_drop_down,color: Colors.blue,)
        ),

        iconSize: 30,
        elevation: 16,
        isExpanded: true,
        style: TextStyle(color: Colors.black, fontSize: 17.0),
        underline: Container(
          height: 2,
        ),
        onChanged: widget.function,
        items:
        widget.list.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Text(value,style: TextStyle( fontSize: 12.0),)),
          );
        }).toList(),
      ),
    );
  }
}
