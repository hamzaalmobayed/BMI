
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/ContentOfScreen/UserDataContent.dart';
import 'package:bmi_project/ui/general-widgets/AppBarWithoutBack.dart';
import 'package:bmi_project/ui/screens/signUp.dart';
import 'package:flutter/material.dart';

class UserData extends StatefulWidget {


  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return RouteHelper.routeHelper.goToPageWithReplacement(SignUp());

      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child:AppBarWithoutBack(),
          ),
          body:UserDataContent()

      ),
    );
  }
}
