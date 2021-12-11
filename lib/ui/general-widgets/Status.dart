import 'package:bmi_project/model/user.dart';
import 'package:bmi_project/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Status extends StatefulWidget {

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
      builder:(context,p,x)=>ListView.builder(
        shrinkWrap: true,
        itemCount: p.reversedList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [

                /******************************* date and weight ****************/

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    /**************** date ****************/

                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: 130,
                        height: 60,
                        child: Center(child: Text(p.reversedList[index].date)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                        ),
                      ),
                    ),

                    /**************** weight ****************/

                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: 130,
                        height: 60,
                        child: Center(child: Text(p.reversedList[index].weight)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                        ),
                      ),
                    )
                  ],
                ),

                /**************************** status and height ****************/

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    /**************** status ****************/

                    Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      width: 130,
                      height: 60,
                      child: Center(child: Text((p.determineStatus(index )))),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                      ),
                    ),
                  ),

                    /**************** height ****************/

                    Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      width: 130,
                      height: 60,
                      child: Center(child: Text(p.reversedList[index].height)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                      ),
                    ),
                  )
                ],),
              ],
            ),
          );
        },
      ),
    );
  }
}
