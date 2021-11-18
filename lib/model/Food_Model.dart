class Food_Model {
  String name;
  String category;
  String calory;
  String photo;


  Food_Model(
      {
        this.name,
        this.category,
        this.calory,
        this.photo,
      });

  factory Food_Model.fromMap(Map<String, dynamic> map) {
    return Food_Model(
      name: map['name'],
      category: map['category'],
      calory: map['calory'],
      photo: map['photo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name':name,'category':category,'calory':calory,'photo':photo};
  }
}
