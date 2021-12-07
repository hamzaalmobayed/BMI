
import 'package:bmi_project/ui/ContentOfScreen/LoginContent.dart';
import 'package:bmi_project/ui/general-widgets/AppBarWithoutBack.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child:AppBarWithoutBack(),
      ),
      body:LoginContent()

    );
  }
}
