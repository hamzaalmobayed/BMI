import 'package:bmi_project/model/Food_Model.dart';
import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/ContentOfScreen/ViewFoodContent.dart';
import 'package:bmi_project/ui/general-widgets/CustomAppBar.dart';
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
    return WillPopScope(
      onWillPop: (){
        Provider.of<BMIProvider>(context,listen: false).updateFoodMap();
        Provider.of<BMIProvider>(context,listen: false).foodList=null;
        return RouteHelper.routeHelper.goToPageWithReplacement(Home());
      },

      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child:CustomAppBar((){
              Provider.of<BMIProvider>(context,listen: false).updateFoodMap();
              Provider.of<BMIProvider>(context,listen: false).foodList=null;
              return RouteHelper.routeHelper.goToPageWithReplacement(Home());
            }),
          ),
          body: ViewFoodContent()
      ),
    );
  }
}
