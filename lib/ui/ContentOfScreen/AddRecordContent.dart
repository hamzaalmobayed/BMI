import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/ui/general-widgets/StyleButton.dart';
import 'package:bmi_project/ui/general-widgets/TextFieldWithBorder.dart';
import 'package:bmi_project/ui/general-widgets/arthmaticIcon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AddRecordContent extends StatefulWidget {

  @override
  _AddRecordContentState createState() => _AddRecordContentState();
}

class _AddRecordContentState extends State<AddRecordContent> {
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
                  "Add Record",
                  style: TextStyle(
                      fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 30,),

                /**************** weight field ****************/

                Row(
                  children: [
                    Text("Weight",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 62,),
                    ArthmaticIcon(Icon(Icons.add,color: Colors.blue,),p.increaseWeight),
                    TextFieldWithBorder(p.weightController,120,'0'),
                    ArthmaticIcon(Icon(Icons.minimize,color: Colors.blue,),p.decreaseWeight),
                    SizedBox(width: 2,),
                    Text("kg",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),

                  ],
                ),
                SizedBox(height: 20,),

                /**************** lenght field ****************/

                Row(
                  children: [
                    Text("Length",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 65,),
                    ArthmaticIcon(Icon(Icons.add,color: Colors.blue,),p.increaseLength),
                    TextFieldWithBorder(p.lengthController,120,'0'),
                    ArthmaticIcon(Icon(Icons.minimize,color: Colors.blue,),p.decreaseLength),
                    SizedBox(width: 2,),
                    Text("cm",style: TextStyle(
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

                    TextFieldWithBorder(p.dateController,200,''),
                  ],
                ),
                SizedBox(height: 20,),

                /**************** time field ****************/

                Row(
                  children: [
                    Text("Time",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 75,),

                    TextFieldWithBorder(p.timeController,200,''),
                  ],
                ),
                SizedBox(height: 30,),

                /**************** button of screen ****************/

                StyleButton(p.createRecordFunction, 0, 0, "Add Record", 90),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
