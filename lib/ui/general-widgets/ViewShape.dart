import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ViewShape extends StatefulWidget {
String img;
String name;
String category;
String calory;
Function delete;
Function edit;

ViewShape(this.img, this.name, this.category, this.calory,this.delete,this.edit);

  @override
  _ViewShapeState createState() => _ViewShapeState();
}

class _ViewShapeState extends State<ViewShape> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 2,style:BorderStyle.solid))
        ),
        child: Row(
          children: [

            Expanded(
              flex: 2,
              child: Container(
                height: 150,
                width: 100,
                child:widget.img==null?Center(child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 3,),): Image.network(widget.img,width: 100,height: 150,fit: BoxFit.cover,),
                decoration: BoxDecoration(

                    border: Border(right:BorderSide(color: Colors.blue,width: 2,style:BorderStyle.solid))
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.name,style: TextStyle(
                      fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),),
                  Text(widget.category,style: TextStyle(
                      fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),),
                  Text(widget.calory,style: TextStyle(
                      fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            SizedBox(width: 40,),

            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ElevatedButton(
                        onPressed:widget.edit,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            )
                        ),
                        child: Text("Edit",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 20,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: widget.delete,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          padding:MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(right: 1)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(5.0),bottomLeft: Radius.circular(5.0),),
                              )
                          )
                      ),
                      child: Icon(Icons.clear,size: 15,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
