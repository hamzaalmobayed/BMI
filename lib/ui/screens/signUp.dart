
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/ContentOfScreen/SignUpContent.dart';
import 'package:bmi_project/ui/general-widgets/AppBarWithoutBack.dart';
import 'package:bmi_project/ui/screens/login.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return RouteHelper.routeHelper.goToPageWithReplacement(Login());
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child:AppBarWithoutBack(),
          ),
          body:SignUpContent()

      ),
    );
  }
}
