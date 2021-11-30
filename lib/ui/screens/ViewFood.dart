import 'package:bmi_project/model/Food_Model.dart';
import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/StyleButton.dart';
import 'package:bmi_project/ui/general-widgets/TextField.dart';
import 'package:bmi_project/ui/general-widgets/TextFieldWithBorder.dart';
import 'package:bmi_project/ui/general-widgets/ViewShape.dart';
import 'package:bmi_project/ui/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ViewFood extends StatefulWidget {

  @override
  _ViewFoodState createState() => _ViewFoodState();
}

class _ViewFoodState extends State<ViewFood> {
  List<Food_Model> food;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
       Provider.of<BMIProvider>(context,listen: false).getFoodList();
       food=Provider.of<BMIProvider>(context,listen: false).foodList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
      builder:(context,p,x)=> WillPopScope(
        onWillPop: (){
            p.updateFoodMap();
          p.foodList=null;
          return RouteHelper.routeHelper.goToPageWithReplacement(Home());
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.blue,
              leading: IconButton(
                color: Colors.white,
                iconSize: 30,
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  p.updateFoodMap();
                  p.foodList=null;
                  return RouteHelper.routeHelper.goToPageWithReplacement(Home());
                },
              ),
              centerTitle: true,
              toolbarHeight: 70,
              title: Text(
                "BMI Analyzer",
                style: TextStyle(
                    fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 5,style:BorderStyle.solid))
              ),
              child: ListView(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Food List",
                        style: TextStyle(
                            fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  Container(

                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: p.foodList==null?Center(child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 3,)):p.foodList.length==0?Center(child: Text("No Food!!!",style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold,),)):ListView.builder(
                      itemCount: p.foodList.length,
                      itemBuilder: (context, i) {
                        return  ViewShape(p.foodList[i].photo,p.foodList[i].name,p.foodList[i].category,p.foodList[i].calory,(){
                          p.deleteFood(i);
                        },(){
                          p.goEditFood(i);
                        });
                      },

                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
