import 'package:bmi_project/model/Food_Model.dart';
import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/ui/general-widgets/StyleButton.dart';
import 'package:bmi_project/ui/general-widgets/TextFieldWithBorder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AddMealContent extends StatefulWidget {

  @override
  _AddMealContentState createState() => _AddMealContentState();
}

class _AddMealContentState extends State<AddMealContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
      builder:(context,p,x)=>Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 5,style:BorderStyle.solid))
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text(
                  "Add Meal",
                  style: TextStyle(
                      fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 30,),
                Row(
                  children: [

                    Text("Food",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 80,),
                    Container(
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
                        onChanged: (newValue) {
                          p.selectFood(newValue);

                        },
                        items:
                        p.food.map((value) {
                          return DropdownMenuItem<Food_Model>(
                            value: value,
                            child: Center(child: Text(value.name,style: TextStyle( fontSize: 17.0),)),
                          );
                        }).toList(),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 20,),
                Row(
                  children: [

                    Text("amount",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 60,),

                    TextFieldWithBorder(p.amountController,160,''),
                    SizedBox(width:8,),
                    Text("unit",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),

                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  children: [
                    Text("Date ",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 75,),

                    TextFieldWithBorder(p.dateMealController,200,''),
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  children: [
                    Text("Time",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 75,),

                    TextFieldWithBorder(p.timeMealController,200,''),
                  ],
                ),
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StyleButton(p.resetMeal,15,0,"reset",20),
                    StyleButton(p.addMeal,0,15,"save",10),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
