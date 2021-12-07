
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/ContentOfScreen/AddMealContent.dart';
import 'package:bmi_project/ui/general-widgets/CustomAppBar.dart';
import 'package:bmi_project/ui/screens/Home.dart';
import 'package:flutter/material.dart';

class AddMeal extends StatefulWidget {


  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return RouteHelper.routeHelper.goToPageWithReplacement(Home());

      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child:CustomAppBar((){
              return RouteHelper.routeHelper.goToPageWithReplacement(Home());
            }),
          ),
          body:AddMealContent()

      ),
    );
  }
}
