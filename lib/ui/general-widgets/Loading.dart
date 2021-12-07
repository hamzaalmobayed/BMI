import 'package:bmi_project/routes/Routes.dart';
import 'package:flutter/material.dart';

class Loading {
  Loading._();
  static Loading loading = Loading._();
  loadingMessage(){
    showDialog(
        context: RouteHelper.routeHelper.navKey.currentContext,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white.withOpacity(0),
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content:Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    color:Colors.white.withOpacity(0) ,
                    height:height,
                    width: width,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Colors.blue,
                    ));
              },
            ),

          );
        });
  }
}