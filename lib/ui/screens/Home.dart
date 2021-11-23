import 'package:bmi_project/model/Status_Model.dart';
import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/Status.dart';
import 'package:bmi_project/ui/general-widgets/StyleButton.dart';
import 'package:bmi_project/ui/screens/AddFood.dart';
import 'package:bmi_project/ui/screens/UserData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
      builder:(context,p,x)=> Scaffold(
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
        body: Container(
          child: p.user==null?Center(child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 5,)):ListView(
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hi, ${p.user.name}",
                    style: TextStyle(
                        fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "current status",
                      style: TextStyle(
                          fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 130.0),
                      child: Text(p.user.status["status0"]["status"]==null?"normal":p.user.status["status0"]["status"],
                        style: TextStyle(
                            fontSize: 18, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "old status",
                      style: TextStyle(
                          fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 320,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
                      ),
                      child: Status(),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StyleButton((){RouteHelper.routeHelper.goToPageWithReplacement(AddFood());},15,0,"Add Food",20),
                  StyleButton(p.goToRecord,0,15,"Add Record",10),

                ],
              ),
              StyleButton((){},20,20,"View Food",50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: p.logout,
                    child: Text("Logout",style: TextStyle(
                        fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                  ),

                ],
              ),


            ],
          ),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 5,style:BorderStyle.solid))
          ),
        ),
      ),
    );
  }
}
