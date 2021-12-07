class Status_Model {
  String height;
  String weight;
  String date;
  String time;


  Status_Model(
      {
        this.height,
        this.weight,
        this.date,
        this.time,
      });

  factory Status_Model.fromMap(Map<String, dynamic> map) {
    return Status_Model(
      height: map['height'],
      weight: map['weight'],
      date: map['date'],
      time:map['gender'] ,
    );
  }

  Map<String, dynamic> toMap() {
    return {'height':height,'weight':weight,'date':date,'time':time};
  }
}
