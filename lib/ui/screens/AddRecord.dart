import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/TextField.dart';
import 'package:bmi_project/ui/general-widgets/TextFieldWithBorder.dart';
import 'package:bmi_project/ui/general-widgets/arthmaticIcon.dart';
import 'package:bmi_project/ui/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRecord extends StatefulWidget {


  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return RouteHelper.routeHelper.goToPageWithReplacement(SignUp());

      },
      child: Scaffold(
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
                        "Add Record",
                        style: TextStyle(
                            fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 30,),

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

                      Row(
                        children: [
                          Text("Date ",style: TextStyle(
                              fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                          SizedBox(width: 20,),

                          TextFieldWithBorder(p.dateController,200,''),
                        ],
                      ),
                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Text("Time",style: TextStyle(
                              fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                          SizedBox(width: 20,),

                          TextFieldWithBorder(p.timeController,200,''),
                        ],
                      ),
                      SizedBox(height: 30,),

                      ElevatedButton(
                        onPressed:p.createRecordFunction,
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
                          child: Text("Add Record",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          )

      ),
    );
  }
}
