import 'package:bmi_project/helper/auth_Helper.dart';
import 'package:bmi_project/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> add(User_Model map) async{
    // Call the user's CollectionReference to add a new user
    try {
      // await firebaseFirestore.collection('Users').add(registerRequest.toMap());
      await firebaseFirestore
          .collection('Users')
          .doc(map.id)
          .set(map.toMap());
    } on Exception catch (e) {
      print(e);
    }
  }



  Future<User_Model> getUserFromFirestore(String userId) async {
    DocumentSnapshot documentSnapshot =
    await firebaseFirestore.collection('Users').doc(userId).get();

    return User_Model.fromMap(documentSnapshot.data());
  }

  Future<List<User_Model>> getAllUsersFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await firebaseFirestore.collection('Users').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    List<User_Model> users =
    docs.map((e) => User_Model.fromMap(e.data())).toList();

    return users;
  }
  updateProfile(User_Model userModel) async {
    await firebaseFirestore
        .collection('Users')
        .doc(userModel.id)
        .update(userModel.toMap());
  }

}