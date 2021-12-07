import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/general-widgets/alert.dart';
import 'package:bmi_project/ui/screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String getUserId() {
    return firebaseAuth.currentUser.uid;
  }

  Future<UserCredential> signup(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomDialoug.customDialoug
            .showCustomDialoug('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomDialoug.customDialoug
            .showCustomDialoug('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
int i;
  Future<UserCredential> signin(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      i=1;

      return userCredential;
    } on FirebaseAuthException catch (e) {
      i=0;
      if (e.code == 'user-not-found') {
        CustomDialoug.customDialoug
            .showCustomDialoug('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialoug.customDialoug
            .showCustomDialoug('Wrong password provided for that user.');
      }
    }
  }

  resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    CustomDialoug.customDialoug.showCustomDialoug(
        'we have sent email for reset password, please check your email');
  }


  logout() async {
    firebaseAuth.signOut();
  }

  bool checkEmailVerification() {
    return firebaseAuth.currentUser?.emailVerified ?? false;
  }

  bool checkUserLoging() {
    if (firebaseAuth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }
}