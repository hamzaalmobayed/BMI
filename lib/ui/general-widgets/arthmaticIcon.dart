import 'package:flutter/material.dart';
class ArthmaticIcon extends StatelessWidget {
  Icon icon;
  Function function;

  ArthmaticIcon(this.icon, this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: function,
        icon: icon,
        iconSize: 20,
      ),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1,style:BorderStyle.solid))
      ),
    );
  }
}
