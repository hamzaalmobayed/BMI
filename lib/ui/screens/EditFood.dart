import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/ContentOfScreen/EditFoodContent.dart';
import 'package:bmi_project/ui/general-widgets/CustomAppBar.dart';
import 'package:bmi_project/ui/screens/ViewFood.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class EditFood extends StatefulWidget {

  @override
  _EditFoodState createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Provider.of<BMIProvider>(context,listen: false).EditFile=null;
        return RouteHelper.routeHelper.goToPageWithReplacement(ViewFood());
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar:PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child:CustomAppBar((){
              return RouteHelper.routeHelper.goToPageWithReplacement(ViewFood());
            }),
          ),
          body: EditFoodContent()
      ),
    ) ;
  }
}
