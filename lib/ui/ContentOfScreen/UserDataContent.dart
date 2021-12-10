import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/ui/general-widgets/StyleButton.dart';
import 'package:bmi_project/ui/general-widgets/TextFieldWithBorder.dart';
import 'package:bmi_project/ui/general-widgets/arthmaticIcon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UserDataContent extends StatefulWidget {

  @override
  _UserDataContentState createState() => _UserDataContentState();
}

class _UserDataContentState extends State<UserDataContent> {
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
                  "Complete Your",
                  style: TextStyle(
                      fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Information",
                  style: TextStyle(
                      fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30,),

                /**************** gender radio button ****************/

                Row(
                  children: [
                    Text(
                      "Gender",
                      style: TextStyle(
                          fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 30,),

                    Radio(
                        value: Gender.Male,
                        groupValue: p.group,
                        onChanged: (v) {
                          p.setGroup(v);

                        }),
                    Text("Male",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 50,),

                    Radio(
                        value: Gender.Female,
                        groupValue: p.group,
                        onChanged: (v) {
                          p.setGroup(v);

                        }),
                    Text("Female",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),

                  ],
                ),
                SizedBox(height: 20,),

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

                /**************** length field ****************/

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

                /**************** birthday ****************/

                Row(
                  children: [
                    Text("Date Of Birth",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),

                    TextFieldWithBorder(p.birthDayController,200,'dd/mm/yyyy'),
                  ],
                ),
                SizedBox(height: 30,),

                /**************** save data button ****************/

                StyleButton(p.signUp, 0, 0, "Save Data", 100),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
