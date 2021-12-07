import 'package:bmi_project/model/Food_Model.dart';
import 'package:bmi_project/model/Status_Model.dart';

class User_Model {
  String id;
  String name;
  String email;
  String gender;
  String birthday;
  Map<String,dynamic> status= {};
  Map<String,dynamic> food= {};
  Map<String,dynamic> meal= {};


  User_Model(
      {
        this.id,
        this.name,
        this.email,
        this.gender,
        this.birthday,
        this.status,
        this.food,
        this.meal,
        });

  factory User_Model.fromMap(Map<String, dynamic> map) {
    return User_Model(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      gender: map['gender'],
      birthday: map['birthday'],
      status: map['status'],
      food: map['food'],
      meal: map['meal'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id':id,'name':name,'email':email,'gender':gender,'birthday':birthday,'status':status,'food':food,'meal':meal};
  }
}
