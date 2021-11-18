import 'package:bmi_project/model/Food_Model.dart';
import 'package:bmi_project/model/Status_Model.dart';

class User_Model {
  String id;
  String name;
  String email;
  List<Status_Model> status;
  List<Food_Model> food;


  User_Model(
      {
        this.id,
        this.name,
        this.email,
        this.status,
        this.food,
        });

  factory User_Model.fromMap(Map<String, dynamic> map) {
    return User_Model(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      status: map['status'],
      food: map['food'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id':id,'name':name,'email':email,'status':status,'food':food};
  }
}
