import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/TextField.dart';
import 'package:bmi_project/ui/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "If you already have an account, log in",
                    style: TextStyle(
                        fontSize: 17, color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30,),

                  TextFieldAdding("UserName",p.UserNameController,false),
                  TextFieldAdding("Password",p.PasswordController,p.obscure,1,Icon(Icons.visibility_off)),
                  SizedBox(height: 80,),
                  ElevatedButton(
                    onPressed: (){
                      p.login();
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
                      child: Text("LOG IN",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
                    ),
                  ),

                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You Don't Have An Account ?",
                        style: TextStyle(
                            fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          RouteHelper.routeHelper.goToPageWithReplacement(SignUp());
                        },
                        child: Text(
                          " Sign Up",
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
