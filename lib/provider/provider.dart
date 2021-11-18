import 'dart:async';

import 'package:bmi_project/helper/auth_Helper.dart';
import 'package:bmi_project/helper/firestore_Helper.dart';
import 'package:bmi_project/model/user.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/alert.dart';
import 'package:bmi_project/ui/screens/UserData.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
enum Gender { Male, Female }
class BMIProvider extends ChangeNotifier{
  TextEditingController UserNameController= TextEditingController();
  TextEditingController PasswordController= TextEditingController();
  TextEditingController NameController= TextEditingController();
  TextEditingController EmailController= TextEditingController();
  TextEditingController SignUpPasswordController= TextEditingController();
  TextEditingController RePasswordController= TextEditingController();
  TextEditingController birthDayController= TextEditingController();
  TextEditingController weightController= TextEditingController();
  TextEditingController lengthController= TextEditingController();
  bool obscure=true;
  bool obscureSignUp=true;
  Gender group=Gender.Male;
  setObscure(){
    obscure=!obscure;
    notifyListeners();
  }
  increaseWeight(){
    double weight=double.parse(weightController.text);
    ++weight;
    weightController.text=weight.toString();
    notifyListeners();
  }
  decreaseWeight(){
    double weight=double.parse(weightController.text);
    --weight;
    weightController.text=weight.toString();
    notifyListeners();
  }
  increaseLength(){
    double length=double.parse(lengthController.text);
    ++length;
    lengthController.text=length.toString();
    notifyListeners();
  }
  decreaseLength(){
    double length=double.parse(lengthController.text);
    --length;
    lengthController.text=length.toString();
    notifyListeners();
  }
  setGroup(v){
    group = v;
    notifyListeners();
  }
  setObscureSignUp(){
    obscureSignUp=!obscureSignUp;
    notifyListeners();
  }
  signUp() async{
    UserCredential user=await AuthHelper.authHelper.signup(EmailController.text, SignUpPasswordController.text);
    Future.delayed(Duration(seconds: 2)).then((value) {
      FirestoreHelper.firestoreHelper.add(User_Model(id: user.user.uid,name: NameController.text,email: EmailController.text,food: null,status: null));
    });
  }
  login()async{
    AuthHelper.authHelper.signin(UserNameController.text, PasswordController.text);
    UserCredential userCredinial = await AuthHelper.authHelper
        .signin(UserNameController.text, PasswordController.text);
    FirestoreHelper.firestoreHelper
        .getUserFromFirestore(userCredinial.user.uid);
    bool isVerifiedEmail = AuthHelper.authHelper.checkEmailVerification();
    if (isVerifiedEmail) {
    RouteHelper.routeHelper.goToPageWithReplacement(UserData());
    } else {
      CustomDialoug.customDialoug.showCustomDialoug(
          'You have to verify your email, press ok to send another email',
          sendVericiafion);
    }
    resetControllers();
  }
  sendVericiafion() {
    AuthHelper.authHelper.verifyEmail();
    AuthHelper.authHelper.logout();
  }
  resetControllers() {
    UserNameController.clear();
    PasswordController.clear();
  }

}