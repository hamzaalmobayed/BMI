import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/ui/general-widgets/StringDropDownButton.dart';
import 'package:bmi_project/ui/general-widgets/StyleButton.dart';
import 'package:bmi_project/ui/general-widgets/TextFieldWithBorder.dart';
import 'package:bmi_project/ui/general-widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AddFoodContent extends StatefulWidget {

  @override
  _AddFoodContentState createState() => _AddFoodContentState();
}

class _AddFoodContentState extends State<AddFoodContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
      builder:(context,p,x)=> Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 5,style:BorderStyle.solid))
        ),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            /**************** title of screen ****************/

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

            /**************** name faild ****************/

            Row(
              children: [
                SizedBox(width: 20,),

                Text("name",style: TextStyle(
                    fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                SizedBox(width: 61,),

                TextFieldWithBorder(p.nameController,200,''),
              ],
            ),
            SizedBox(height: 20,),

            /**************** category ****************/

            Row(
              children: [
                SizedBox(width: 20,),

                Text("category",style: TextStyle(
                    fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                SizedBox(width: 40,),
                StringDropDownButton(p.selectedCategory,(newValue) {
                  p.selectCategory(newValue);

                }, p.categoryList,200)


              ],
            ),

            SizedBox(height: 20,),

            /**************** calory ****************/

            Row(
              children: [
                SizedBox(width: 20,),

                Text("calory",style: TextStyle(
                    fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),),
                SizedBox(width: 60,),

                TextFieldWithBorder(p.caloryController,100,''),
                SizedBox(width:4,),
                StringDropDownButton(p.selectedCalory,
                        (newValue) {
                  p.selectCalory(newValue);

                },p.caloryList,95)

              ],
            ),
            SizedBox(height: 20,),

            /**************** show photo  ****************/

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
                        border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 3,style:BorderStyle.solid))
                    ),
                    child: p.AddFile==null?Center(child:Text(" Photo",style: TextStyle(
                        fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),), )
                        :ClipRRect(borderRadius: BorderRadius.circular(7.0),child: Image.file(p.AddFile, fit: BoxFit.cover,height: 320,width: 320,)),
                  )
                ],
              ),
            ),

            /**************** button of screen ****************/

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StyleButton(p.selectAddFile,15,0,"Upload Photo",20),
                StyleButton(p.addFood,0,15,"Save",10),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
