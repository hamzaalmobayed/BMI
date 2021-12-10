import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/ui/general-widgets/ViewShape.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ViewFoodContent extends StatefulWidget {

  @override
  _ViewFoodContentState createState() => _ViewFoodContentState();
}

class _ViewFoodContentState extends State<ViewFoodContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
      builder:(context,p,x)=>Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 5,style:BorderStyle.solid))
        ),
        child: ListView(
          children: [
            SizedBox(height: 20,),

            /**************** title of screen  ************************/

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

            /****************  food list  ************************/

            Container(

              height: 500,
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
      ) ,
    );
  }
}
