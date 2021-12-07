import 'Food_Model.dart';

class Meal_Model {
  Map<String,dynamic> food;
  String amount;
  String time;
  String date;


  Meal_Model(
      {
        this.food,
        this.amount,
        this.time,
        this.date,
      });

  factory Meal_Model.fromMap(Map<String, dynamic> map) {
    return Meal_Model(
      food: map['food'],
      amount: map['amount'],
      time: map['time'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'food':food,'amount':amount,'time':time,'date':date};
  }
}
