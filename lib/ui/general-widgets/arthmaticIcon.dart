import 'package:flutter/material.dart';
class ArthmaticIcon extends StatelessWidget {
  Icon icon;
  Function function;

  ArthmaticIcon(this.icon, this.function);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: function,
          icon: Center(child: icon),
          iconSize: 20,
        ),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
        ),
      ),
    );
  }
}
