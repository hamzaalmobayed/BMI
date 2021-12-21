import 'dart:async';
import 'dart:math';

import 'package:bmi_project/helper/auth_Helper.dart';
import 'package:bmi_project/helper/firestorage_Helper.dart';
import 'package:bmi_project/helper/firestore_Helper.dart';
import 'package:bmi_project/model/Food_Model.dart';
import 'package:bmi_project/model/Meal_Model.dart';
import 'package:bmi_project/model/Status_Model.dart';
import 'package:bmi_project/model/user.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/Loading.dart';
import 'package:bmi_project/ui/general-widgets/Toast.dart';
import 'package:bmi_project/ui/general-widgets/alert.dart';
import 'package:bmi_project/ui/screens/AddRecord.dart';
import 'package:bmi_project/ui/screens/EditFood.dart';
import 'package:bmi_project/ui/screens/Home.dart';
import 'package:bmi_project/ui/screens/UserData.dart';
import 'package:bmi_project/ui/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
enum Gender { Male, Female }
class BMIProvider extends ChangeNotifier{
  /*************  constructor  ************************************************************/
  BMIProvider() {
    getCategory();
    getCalory();
  }

  /*************  variables  *************************************************************/

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
  TextEditingController timeMealController= TextEditingController(text: '');
  TextEditingController dateMealController= TextEditingController(text: '');
  TextEditingController nameController= TextEditingController(text: '');
  TextEditingController caloryController= TextEditingController(text: '');
  TextEditingController amountController= TextEditingController(text: '');
  bool obscure=true;
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(debugLabel: "someState1");
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(debugLabel: "someState2");
  bool obscureSignUp=true;
  Gender group=Gender.Male;
  List<String> categoryList;
  String selectedCategory;
  List<String> caloryList;
  List<Status_Model> reversedList;
  String selectedCalory;
  String onpressedScreen;
  List<List<String>> matrix=[
    ["so bad","so bad","so bad","little changes","little changes","still good","go ahead","go ahead"],
    ["so bad","be careful","be careful","little changes","little changes","be careful","be careful","be careful"],
    ["be careful","go ahead","still good","little changes","little changes","be careful","so bad","so bad"],
    ["go ahead","go ahead","little changes","little changes","be careful","so bad","so bad","so bad"]
  ];

  /*************  DropDown Buttons Function  *************************************************/

  /**************** 1- select category ****************/
  selectCategory(String category) {
    this.selectedCategory = category;
    notifyListeners();
  }

  /**************** 2- get category list****************/

  getCategory() async {
    List<String> categoryList =['','carbohydrates','proteins','fibers','vitamins','fats'];
    this.categoryList = categoryList;
    selectCategory(categoryList.first);
    notifyListeners();

  }

  /**************** 3- select food ****************/

  Food_Model selectedFood;
  selectFood(Food_Model food) {
    this.selectedFood = food;
    notifyListeners();
  }

  /**************** 4- get food list ****************/

  List<Food_Model> food;
  getFood() async {
    List<Food_Model> food =user.food.entries.map((e) => Food_Model.fromMap(e.value)).toList();
    food.forEach((element) {
      print(element.name);
    });
    this.food = food;
    selectFood(food.first);
    notifyListeners();

  }

  /**************** 5- select calory unit ****************/

  selectCalory(String calory) {
    this.selectedCalory = calory;
    notifyListeners();
  }
  /**************** 6- get calory list ****************/

  getCalory() async {
    List<String> calory=["","cal/spoon","cal/cup","cal/g","cal/piece"];
    this.caloryList = calory;
    selectCalory(caloryList.first);
    notifyListeners();

  }
  /**************** 7- get reversed list ****************/

  getReversedList() async {
    List<Status_Model> statusList;
    Future.delayed(Duration(seconds: 2),(){
      statusList=user.status.entries.map((e) => Status_Model.fromMap(e.value)).toList();
      this.reversedList = statusList.reversed.toList();
      notifyListeners();

    });

  }
  /**************** 8- select screen ****************/
  selectScreen(String screen) {
    this.onpressedScreen = screen;
    notifyListeners();
  }

  /*************  images picker Functions  ***************************************************/

  File AddFile;
  File EditFile;
  bool ispressed=false;

  /**************** 1- select image from gallery ****************/

  selectAddFile() async {
    ispressed=true;
    XFile imageFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    this.AddFile = File(imageFile.path);
    notifyListeners();
  }

  /**************** 2- select image for edit ****************/

  selectEditFile() async {
    XFile imageFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    this.EditFile = File(imageFile.path);
    notifyListeners();
  }

  /*************  mathematics Functins  **********************************************/

  /**************** 1- hide password in login screen****************/

  setObscure(){
    obscure=!obscure;
    notifyListeners();
  }

  /**************** 2- increase weight ****************/

  increaseWeight(){
    double weight;
    if(weightController.text!=''){
      weight=double.parse(weightController.text);
    }
    ++weight;
    weightController.text=weight.toString();
    notifyListeners();
  }

  /**************** 3- decrease weight ****************/

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

  /**************** 4- increase lenght ****************/

  increaseLength(){
    double length;
    if(lengthController.text!=''){
       length=double.parse(lengthController.text);
    }
    ++length;
    lengthController.text=length.toString();
    notifyListeners();
  }

  /**************** 5- decrease lenght ****************/

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

  /**************** 6- choose gender ****************/

  setGroup(v){
    group = v;
    notifyListeners();
  }

  /**************** 7- hide password in sign up screen ****************/

  setObscureSignUp(){
    obscureSignUp=!obscureSignUp;
    notifyListeners();
  }

  /*******************  main functions  ********************************************************/

  double bmi;
  int firstIndex;
  int secondIndex;
  String initialStatus;
  String lastStatus;
  double differanceBmi;

  /**************** 1- calculate Bmi ****************/

  calculateBMI(int index){
    int agePercent;
    double weight=double.parse(reversedList[index].weight);
    double height=double.parse(reversedList[index].height)/100;
    int bornYear=int.parse(user.birthday.split('/').last);
    int currentYear=DateTime.now().year;
    int age=currentYear-bornYear;
    if(age>=2&&age<=10){
      agePercent=70;
    }else if(age>10&&age<=20&&user.gender=="Male"){
      agePercent=90;
    }else if(age>10&&age<=20&&user.gender=="Female"){
      agePercent=80;
    }else if(age>20){
      agePercent=100;
    }
    bmi=(weight/pow(height,2))*(agePercent/100);
    if(bmi<18.5){
      initialStatus="under weight";
      firstIndex=0;
    }else if(bmi<25&&bmi>=18.5){
      initialStatus="healthy weight";
      firstIndex=1;
    }else if(bmi<30&&bmi>=25){
      initialStatus="over weight";
      firstIndex=2;
    }else if(bmi>30){
      initialStatus="obesity";
      firstIndex=3;
    }
    return bmi;
  }

  /**************** 2- calculate difference between two last BMI ****************/

  getDifferanceBmi(int index){
    if(index==reversedList.length-1){
      differanceBmi=calculateBMI(index)-0;
    }else{
      differanceBmi=calculateBMI(index)-calculateBMI(index+1);
    }
    if(differanceBmi<-1){
      secondIndex=0;
    }else if(differanceBmi>=-1&&differanceBmi<-0.6){
      secondIndex=1;
    }else if(differanceBmi>=-0.6&&differanceBmi<-0.3){
      secondIndex=2;
    }else if(differanceBmi>=-0.3&&differanceBmi<0){
      secondIndex=3;
    }else if(differanceBmi>=0&&differanceBmi<0.3){
      secondIndex=4;
    }else if(differanceBmi>=0.3&&differanceBmi<0.6){
      secondIndex=5;
    }else if(differanceBmi>=0.6&&differanceBmi<1){
      secondIndex=6;
    }else if(differanceBmi>=1){
      secondIndex=7;
    }

  }

  /**************** 3- determine Status ****************/

  determineStatus(int i){
    getDifferanceBmi(i);
    calculateBMI(i);
    lastStatus= matrix[firstIndex][secondIndex];
    return initialStatus;
  }

  /**************** 3- transport to add record screen ****************/

  goToRecord(){
    int v=user.status.length-1;
    weightController.text=user.status['status$v']['weight'];
    lengthController.text=user.status['status$v']['height'];
    RouteHelper.routeHelper.goToPageWithReplacement(AddRecord());
  }

  /**************** 4- add record function ****************/

  createRecordFunction(){
    int i=user.status.length;
    Status_Model status=Status_Model(weight: weightController.text,height: lengthController.text,date: dateController.text,time:timeController.text);
  user.status.addEntries([MapEntry('status$i',status.toMap())]);
  FirestoreHelper.firestoreHelper.updateProfile(user);
    ToastMessage.toast.toastMessage("done successfully");
    i++;

  }
  int b;

  /**************** 5- add meal function ****************/

  addMeal(){
    b=user.meal.length;
    Meal_Model meal=Meal_Model(food: selectedFood.toMap(),amount: amountController.text,time:timeMealController.text,date: dateMealController.text);
    user.meal.addEntries([MapEntry('meal$b',meal.toMap())]);
    FirestoreHelper.firestoreHelper.updateProfile(user);
    ToastMessage.toast.toastMessage("done successfully");
    b++;
  }

  /**************** 6- clear meal fields ****************/

  resetMeal(){
    amountController.text="";
    timeMealController.text="";
    dateMealController.text="";
  }

  /**************** 7- add food function ****************/

  int z;
  addFood()async{
    z=user.food.length;
    int t=z-1;
    Loading.loading.loadingMessage();
    String imageUrl =
    ispressed?await FirebaseStorageHelper.firebaseStorageHelper.uploadImage(AddFile):user.food['food$t']['photo'];
    Food_Model food=Food_Model(calory: caloryController.text+" "+selectedCalory,name: nameController.text,category: selectedCategory,photo:imageUrl );
    user.food.addEntries([MapEntry('food$z',food.toMap())]);
    FirestoreHelper.firestoreHelper.updateProfile(user);
    ispressed=false;
    RouteHelper.routeHelper.back();
    ToastMessage.toast.toastMessage("done successfully");
    notifyListeners();
  }

  /**************** 8- transport to edit food screen  ****************/

  int index;
  String url;

  goEditFood(int index)async{
    List<String> calory=user.food['food$index']['calory'].split(" ");
    this.index=index;
    nameController.text=user.food['food$index']['name'];
    caloryController.text=calory[0];
    selectedCalory=calory[1];
    selectedCategory=user.food['food$index']['category'];
    url=user.food['food$index']['photo'];
    RouteHelper.routeHelper.goToPageWithReplacement(EditFood());

  }
  /**************** 9- edit food function ****************/

  editFood()async{
    String imageUrl;
    Loading.loading.loadingMessage();
    if(EditFile!=null){
      imageUrl =
      await FirebaseStorageHelper.firebaseStorageHelper.uploadImage(EditFile);
    }
    user.food['food$index']['name']=nameController.text;
    user.food['food$index']['calory']=caloryController.text+" "+selectedCalory;
    user.food['food$index']['category']=selectedCategory;
    user.food['food$index']['photo']=imageUrl==null?user.food['food$index']['photo']:imageUrl;
    FirestoreHelper.firestoreHelper.updateProfile(user);
    RouteHelper.routeHelper.back();
    ToastMessage.toast.toastMessage("done Successfully");
    notifyListeners();

  }

  /**************** 10- delete food function ****************/

  List<Food_Model> foodList;
  deleteFood(int index) async{
    foodList.removeAt(index);
    notifyListeners();
  }

  /**************** 11- get food list ****************/

  getFoodList(){
    List<Food_Model> foodList=user.food.entries.map((e) => Food_Model.fromMap(e.value)).toList();
    this.foodList=foodList;
    notifyListeners();
  }
  /**************** 12- update user food list ****************/

  updateFoodMap(){
    int i=0;
    user.food.clear();
    foodList.forEach((element) {
      user.food.addEntries([MapEntry('food$i',element.toMap())]);
      ++i;
    });
    FirestoreHelper.firestoreHelper.updateProfile(user);
    notifyListeners();
  }

/******************* auth function***************************************************/

  /********* 1- current user***************/

  User_Model user;
  getUserFromFirestore() async {
    String userId = AuthHelper.authHelper.getUserId();
    user = await FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
    notifyListeners();
  }

  /********* 2-sign up **********************/

  signUp() async{
    var outputDateFormat = DateFormat('dd/MM/yyyy');
    var outputTimeFormat = DateFormat('kk:mm');
    var outputDate = outputDateFormat.format(DateTime.now());
    var outputTime = outputTimeFormat.format(DateTime.now());
    Status_Model status=Status_Model(weight: weightController.text,height: lengthController.text,date: outputDate.toString(),time:outputTime.toString());
    Loading.loading.loadingMessage();
    UserCredential user=await AuthHelper.authHelper.signup(EmailController.text, SignUpPasswordController.text);
    Future.delayed(Duration(seconds: 2)).then((value) {
      FirestoreHelper.firestoreHelper.add(User_Model(id: user.user.uid,name: NameController.text,email: EmailController.text,gender: group==Gender.Male?"Male":"Female",birthday:birthDayController.text ,food: {},status: {"status0":status.toMap()},meal: {}));
    });
    UserCredential userCredinial =await AuthHelper.authHelper.signin(EmailController.text, SignUpPasswordController.text);bool isVerifiedEmail = AuthHelper.authHelper.checkEmailVerification();
    RouteHelper.routeHelper.goToPageWithReplacement(Home());

    Future.delayed(Duration(seconds: 2)).then((value) {
      getUserFromFirestore();
    });
  }

  /********* 3-log in **************************/

  login()async{
    UserCredential userCredinial = await AuthHelper.authHelper
        .signin(UserNameController.text, PasswordController.text);
    Loading.loading.loadingMessage();
    if(AuthHelper.authHelper.i==1){
      RouteHelper.routeHelper.goToPageWithReplacement(Home());
      getUserFromFirestore();
    }else{
      RouteHelper.routeHelper.back();
    }

    resetControllers();
  }

  /********* 4-log out ****************************/

  logout() async{
    z=0;
    AuthHelper.authHelper.logout();
    resetControllers();
    user=null;
    RouteHelper.routeHelper.goToPageWithReplacement(Login());

  }

  /********* 5-check login*************************/

  checkLogin() {
    bool isLoggedIn = AuthHelper.authHelper.checkUserLoging();

    if (isLoggedIn) {
      getUserFromFirestore();
      RouteHelper.routeHelper.goToPageWithReplacement(Home());
    } else {
      RouteHelper.routeHelper.goToPageWithReplacement(Login());
    }
  }

  /********* 6-clear fields  ************************/

  resetControllers() {
    nameController.clear();
    selectedCategory="";
    selectedCalory="";
    caloryController.clear();
    AddFile=null;
  }
  /********* 7-clear fields  ************************/

  resetAddFoodControllers() {
    UserNameController.clear();
    PasswordController.clear();
  }
/******************* validators***********************************************/

/*********  1-password validator  *******************/

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    }
      return null;
  }

/*********  2- repassword validator  ***************/

  String validateRePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value==SignUpPasswordController.text) {
      return "two passwords not the same";
    }
    return null;
  }
  String validateName(String value) {
    if (value.isEmpty) {
      return "* Required";
    }
    return null;
  }

/*********  3-email validator  *******************/

  String validateEmail(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (isEmail(EmailController.text)) {
      return "Email format is wrong";
    }
    return null;
  }

}