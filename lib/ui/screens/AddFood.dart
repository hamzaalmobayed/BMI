import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/StyleButton.dart';
import 'package:bmi_project/ui/general-widgets/TextField.dart';
import 'package:bmi_project/ui/general-widgets/TextFieldWithBorder.dart';
import 'package:bmi_project/ui/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AddFood extends StatefulWidget {

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(

      builder:(context,p,x)=> WillPopScope(
        onWillPop: (){
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
              height: double.infinity,
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
                        "Add Food Details",
                        style: TextStyle(
                            fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      SizedBox(width: 20,),

                      Text("name",style: TextStyle(
                          fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                      SizedBox(width: 61,),

                      TextFieldWithBorder(p.timeController,200,''),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      SizedBox(width: 20,),

                      Text("category",style: TextStyle(
                          fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                      SizedBox(width: 40,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
                        ),
                        height: 30,
                        width: 200,
                        child: DropdownButton<String>(
                          value:p.selectedCategory,
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
                          style: TextStyle(color: Colors.blue, fontSize: 17.0),
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (newValue) {
                            p.selectCategory(newValue);

                          },
                          items:
                          p.categoryList.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(child: Text(value,style: TextStyle(color: Colors.blue, fontSize: 17.0),)),
                            );
                          }).toList(),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 20,),

                  Row(
                    children: [
                      SizedBox(width: 20,),

                      Text("calory",style: TextStyle(
                          fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                      SizedBox(width: 60,),

                      TextFieldWithBorder(p.timeController,150,''),
                      SizedBox(width:1,),

                      Text(" cal / g",style: TextStyle(
                          fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20,),

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
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
                          ),
                          child: Center(child:Text(" Photo",style: TextStyle(
                              fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),), ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StyleButton((){},15,0,"Upload Photo",20),
                      StyleButton((){},0,15,"Save",10),

                    ],
                  ),

                ],
              ),
            )
        ),
      ),
    );
  }
}
