import 'package:bmi_project/model/Food_Model.dart';
import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/ui/general-widgets/FoodDropDownButton.dart';
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

                /**************** title of screen ****************/

                Text(
                  "Add Meal",
                  style: TextStyle(
                      fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 30,),

                /**************** food dropdown button ****************/

                Row(
                  children: [

                    Text("Food",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 80,),
                    p.food==null?FoodDropDownButton((newValue) {}):FoodDropDownButton((newValue) {p.selectFood(newValue);}),

                  ],
                ),

                SizedBox(height: 20,),

                /**************** amount field ****************/

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

                /**************** date field ****************/

                Row(
                  children: [
                    Text("Date ",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 75,),

                    TextFieldWithBorder(p.dateMealController,200,''),
                  ],
                ),
                SizedBox(height: 20,),

                /**************** time field ****************/

                Row(
                  children: [
                    Text("Time",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 75,),

                    TextFieldWithBorder(p.timeMealController,200,''),
                  ],
                ),
                SizedBox(height: 30,),

                /**************** button of screen ****************/

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
