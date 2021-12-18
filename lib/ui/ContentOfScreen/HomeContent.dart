import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/Status.dart';
import 'package:bmi_project/ui/general-widgets/StyleButton.dart';
import 'package:bmi_project/ui/screens/AddFood.dart';
import 'package:bmi_project/ui/screens/AddMeal.dart';
import 'package:bmi_project/ui/screens/ViewFood.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeContent extends StatefulWidget {

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      Provider.of<BMIProvider>(context,listen: false).getReversedList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
        builder:(context,p,x)=>Container(
          child: p.user==null?Center(child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 5,)):ListView(
            children: [
              SizedBox(height: 30,),
              /**************** current user ****************/

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

              /**************** current status ****************/

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
                    padding: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Text(p.reversedList==null?"waiting.....":p.determineStatus(0)+'('+p.lastStatus+")",
                        style: TextStyle(
                            fontSize: 18, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),

              /**************** old status ****************/

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
                      child: p.reversedList==null?Center(child: CircularProgressIndicator(strokeWidth: 3,color: Colors.white,),):Status(),
                    )
                  ],
                ),
              ),

              /***************************************** buttons of screen *********************************/

              /**************** add record and food buttons ****************/

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StyleButton((){RouteHelper.routeHelper.goToPageWithReplacement(AddFood());p.resetAddFoodControllers();},15,0,"Add Food",20),
                  StyleButton(p.goToRecord,0,15,"Add Record",10),

                ],
              ),

              /**************** add meal button  **************************/

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StyleButton((){RouteHelper.routeHelper.goToPageWithReplacement(AddMeal());p.getFood();},15,0,"Add Meal",20),

                ],
              ),

              /**************** view food button  ************************/

              StyleButton((){RouteHelper.routeHelper.goToPageWithReplacement(ViewFood());},20,20,"View Food",50),

              /**************** logout button ****************/

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
        )
    );
  }
}
