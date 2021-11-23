class Status_Model {
  String height;
  String weight;
  String date;
  String status;
  String time;


  Status_Model(
      {
        this.height,
        this.weight,
        this.date,
        this.status,
        this.time,
      });

  factory Status_Model.fromMap(Map<String, dynamic> map) {
    return Status_Model(
      height: map['height'],
      weight: map['weight'],
      date: map['date'],
      status: map['status'],
      time:map['gender'] ,
    );
  }

  Map<String, dynamic> toMap() {
    return {'height':height,'weight':weight,'date':date,'status':status,'time':time};
  }
}
