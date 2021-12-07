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
    Map<String,dynamic> status=Provider.of<BMIProvider>(context,listen: false).user.status;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Provider.of<BMIProvider>(context,listen: false).user.status.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      width: 130,
                      height: 60,
                      child: Center(child: Text(status["status$index"]['date'])),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      width: 130,
                      height: 60,
                      child: Center(child: Text(status["status$index"]['weight'])),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    width: 130,
                    height: 60,
                    child: Center(child: Text((Provider.of<BMIProvider>(context,listen: false).determineStatus(index )))),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    width: 130,
                    height: 60,
                    child: Center(child: Text(status["status$index"]['height'])),
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
    );
  }
}
