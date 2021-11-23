import 'dart:async';

import 'package:bmi_project/helper/auth_Helper.dart';
import 'package:bmi_project/helper/firestore_Helper.dart';
import 'package:bmi_project/model/Status_Model.dart';
import 'package:bmi_project/model/user.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/alert.dart';
import 'package:bmi_project/ui/screens/AddRecord.dart';
import 'package:bmi_project/ui/screens/Home.dart';
import 'package:bmi_project/ui/screens/UserData.dart';
import 'package:bmi_project/ui/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
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
  BMIProvider() {
    getCategory();
  }
  TextEditingController UserNameController= TextEditingController();
  TextEditingController PasswordController= TextEditingController();
  TextEditingController NameController= TextEditingController();
  TextEditingController EmailController= TextEditingController();
  TextEditingController SignUpPasswordController= TextEditingController();
  TextEditingController RePasswordController= TextEditingController();
  TextEditingController birthDayController= TextEditingController();
  TextEditingController weightController= TextEditingController(text: '');
  TextEditingController lengthController= TextEditingController(text: '');
  TextEditingController timeController= TextEditingController(text: '');
  TextEditingController dateController= TextEditingController(text: '');
  bool obscure=true;
  bool obscureSignUp=true;
  Gender group=Gender.Male;
  List<String> categoryList;
  String selectedCategory;
  selectCategory(String category) {
    this.selectedCategory = category;
    notifyListeners();
  }
  getCategory() async {
    List<String> categoryList =['','carbohydrates','proteins','fibers','vitamins','fats'];
    this.categoryList = categoryList;
    selectCategory(categoryList.first);
    notifyListeners();

  }
  setObscure(){
    obscure=!obscure;
    notifyListeners();
  }
  increaseWeight(){
    double weight;
    if(weightController.text!=''){
      weight=double.parse(weightController.text);
    }
    ++weight;
    weightController.text=weight.toString();
    notifyListeners();
  }
  decreaseWeight(){
    double weight;
    if(weightController.text!=''){
      weight=double.parse(weightController.text);
    }
    if(weight!=0){
      --weight;
    }
    weightController.text=weight.toString();
    notifyListeners();
  }
  increaseLength(){
    double length;
    if(lengthController.text!=''){
       length=double.parse(lengthController.text);
    }
    ++length;
    lengthController.text=length.toString();
    notifyListeners();
  }
  decreaseLength(){
    double length;
    if(lengthController.text!=''){
      length=double.parse(lengthController.text);
    }
    if(length!=0){
      --length;
    }
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
  int i=0;
  goToRecord(){
    weightController.text=user.status['status$i']['weight'];
    lengthController.text=user.status['status$i']['height'];
    lengthController.text=user.status['status$i']['time'];
    lengthController.text=user.status['status$i']['date'];
    RouteHelper.routeHelper.goToPageWithReplacement(AddRecord());
  }
  createRecordFunction(){
    i++;
  Status_Model status=Status_Model(weight: weightController.text,height: lengthController.text,date: birthDayController.text,time:group==Gender.Male?"Male":"Female");
  print(status.weight);
  user.status.addEntries([MapEntry('status$i',status.toMap())]);
  FirestoreHelper.firestoreHelper.updateProfile(user);
  }
  User_Model user;
  getUserFromFirestore() async {
    String userId = AuthHelper.authHelper.getUserId();
    user = await FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
    notifyListeners();
  }
  signUp() async{
    var outputDateFormat = DateFormat('dd/MM/yyyy');
    var outputTimeFormat = DateFormat('kk:mm');
    var outputDate = outputDateFormat.format(DateTime.now());
    var outputTime = outputTimeFormat.format(DateTime.now());
    Status_Model status=Status_Model(weight: weightController.text,height: lengthController.text,date: outputDate.toString(),time:outputTime.toString());
    UserCredential user=await AuthHelper.authHelper.signup(EmailController.text, SignUpPasswordController.text);
    Future.delayed(Duration(seconds: 2)).then((value) {
      FirestoreHelper.firestoreHelper.add(User_Model(id: user.user.uid,name: NameController.text,email: EmailController.text,gender: group==Gender.Male?"Male":"Female",birthday:birthDayController.text ,food: {},status: {"status0":status.toMap()}));
    });
    UserCredential userCredinial =await AuthHelper.authHelper.signin(EmailController.text, SignUpPasswordController.text);bool isVerifiedEmail = AuthHelper.authHelper.checkEmailVerification();
    getUserFromFirestore();
    RouteHelper.routeHelper.goToPageWithReplacement(Home());

  }
  login()async{
    UserCredential userCredinial = await AuthHelper.authHelper
        .signin(UserNameController.text, PasswordController.text);
    RouteHelper.routeHelper.goToPageWithReplacement(Home());
    getUserFromFirestore();
    resetControllers();
  }
  logout() {
    AuthHelper.authHelper.logout();
    RouteHelper.routeHelper.goToPageWithReplacement(Login());

  }
  checkLogin() {
    bool isLoggedIn = AuthHelper.authHelper.checkUserLoging();

    if (isLoggedIn) {
      getUserFromFirestore();
      RouteHelper.routeHelper.goToPageWithReplacement(Home());
    } else {
      RouteHelper.routeHelper.goToPageWithReplacement(Login());
    }
  }
  resetControllers() {
    UserNameController.clear();
    PasswordController.clear();
  }

}