import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/TextField.dart';
import 'package:bmi_project/ui/screens/UserData.dart';
import 'package:bmi_project/ui/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          centerTitle: true,
          toolbarHeight: 70,
          title: Text(
            "BMI Analyzer",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body:Consumer<BMIProvider>(
          builder:(context,p,x)=>Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 5,style:BorderStyle.solid))
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Text(
                      "Create New Account",
                      style: TextStyle(
                          fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "If you do not already have an account",
                      style: TextStyle(
                          fontSize: 17, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30,),

                    TextFieldAdding("Name",p.NameController,false),
                    TextFieldAdding("E-mail",p.EmailController,false),
                    TextFieldAdding("Password",p.SignUpPasswordController,p.obscureSignUp,2,Icon(Icons.visibility_off)),
                    TextFieldAdding("Re-Password",p.RePasswordController,true),
                    SizedBox(height: 80,),
                    ElevatedButton(
                      onPressed: (){
                        RouteHelper.routeHelper.goToPageWithReplacement(UserData());
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 100),
                        child: Text("CREATE",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
                      ),
                    ),

                    SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You Have An Account ?",
                          style: TextStyle(
                              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            RouteHelper.routeHelper.goToPageWithReplacement(Login());
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )

    );
  }
}
