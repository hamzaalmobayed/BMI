
import 'package:bmi_project/ui/ContentOfScreen/HomeContent.dart';
import 'package:bmi_project/ui/general-widgets/AppBarWithoutBack.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child:AppBarWithoutBack(),
      ),
      body: HomeContent(),
    ) ;
  }
}
