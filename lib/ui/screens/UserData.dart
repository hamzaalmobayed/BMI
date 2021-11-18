import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/TextField.dart';
import 'package:bmi_project/ui/general-widgets/TextFieldWithBorder.dart';
import 'package:bmi_project/ui/general-widgets/arthmaticIcon.dart';
import 'package:bmi_project/ui/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          centerTitle: true,
          toolbarHeight: 70,
          title: Text(
            "BMI Analyzer",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body:Consumer<BMIProvider>(
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
                    Row(
                      children: [
                        Text("Weight",style: TextStyle(
                            fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                        ArthmaticIcon(Icon(Icons.add),p.increaseWeight()),
                        TextFieldWithBorder(p.weightController),
                        ArthmaticIcon(Icon(Icons.minimize),p.decreaseWeight()),

                      ],
                    ),
                    Row(
                      children: [
                        Text("Length",style: TextStyle(
                            fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                        ArthmaticIcon(Icon(Icons.add),p.increaseLength()),
                        TextFieldWithBorder(p.lengthController),
                        ArthmaticIcon(Icon(Icons.minimize),p.decreaseLength()),

                      ],
                    ),
                    Row(
                      children: [
                        Text("Date Of Birth",style: TextStyle(
                            fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                        TextFieldWithBorder(p.birthDayController),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: (){

                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 100),
                        child: Text("Save Data",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        )

    );
  }
}
