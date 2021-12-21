import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/StyleButton.dart';
import 'package:bmi_project/ui/general-widgets/TextField.dart';
import 'package:bmi_project/ui/general-widgets/alert.dart';
import 'package:bmi_project/ui/screens/UserData.dart';
import 'package:bmi_project/ui/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
class SignUpContent extends StatefulWidget {

  @override
  _SignUpContentState createState() => _SignUpContentState();
}

class _SignUpContentState extends State<SignUpContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
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

                /**************** title of screen ****************/

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

                /**************** data fields ****************/

                Form(
                  key: p.signupFormKey,
                  child: Column(
                    children: [
                      TextFieldAdding("Name",p.NameController,false),
                      TextFieldAdding("E-mail",p.EmailController,false),
                      TextFieldAdding("Password",p.SignUpPasswordController,p.obscureSignUp,2,Icon(Icons.visibility_off)),
                      TextFieldAdding("Re-Password",p.RePasswordController,true),
                    ],
                  ),
                ),
                SizedBox(height: 80,),

                /**************** sign up button ****************/

                StyleButton((){
                  if (p.signupFormKey.currentState.validate()) {
                    if(!isEmail(p.EmailController.text)){
                      CustomDialoug.customDialoug.showCustomDialoug("Email Format is wrong!!!");
                    }else if(p.RePasswordController.text!=p.SignUpPasswordController.text){
                      CustomDialoug.customDialoug.showCustomDialoug("two password not same!!!");
                    }else{
                      RouteHelper.routeHelper.goToPageWithReplacement(UserData());
                    }
                    print("Validated");
                  }else{
                    print("Not Validated");
                  }
                }, 0, 0, "CREATE", 100),


                SizedBox(height: 30,),

                /**************** go to log in button ****************/

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
    );
  }
}
