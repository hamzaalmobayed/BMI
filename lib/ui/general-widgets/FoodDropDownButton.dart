import 'package:bmi_project/model/Food_Model.dart';
import 'package:bmi_project/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FoodDropDownButton extends StatefulWidget {
Function function;

FoodDropDownButton(this.function);

  @override
  _FoodDropDownButtonState createState() => _FoodDropDownButtonState();
}

class _FoodDropDownButtonState extends State<FoodDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
      builder:(context,p,x)=> Container(
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
        ),
        height: 30,
        width: 200,
        child: DropdownButton<Food_Model>(
          value:p.selectedFood,
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
          p.food.map((value) {
            return DropdownMenuItem<Food_Model>(
              value: value,
              child: Center(child: Text(value.name,style: TextStyle( fontSize: 17.0),)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
