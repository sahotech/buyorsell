import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

// ### sign in method ###
  Future<String?> signUpUsers({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    email.trim();
    name.trim();
    phoneNumber.trim();
    password.trim();
    String message = 'Something wenr wrong';
    if (email.isNotEmpty ||
        name.isNotEmpty ||
        phoneNumber.isNotEmpty ||
        password.isNotEmpty) {
      try {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await firestore.collection('users').doc(cred.user!.uid).set({
          'Name': name,
          'Email Address': email,
          'Phone Number': phoneNumber,
        });
        message = 'Success';
      } on FirebaseAuthException catch (e) {
        message = e.message.toString();
      }
    } else {
      message = 'Please all field are required';
    }
    return message;
  }

// ### sign in method ###
  Future<String?> signInUsers(
      {required String email, required String password}) async {
    email.trim();

    password.trim();
    String message = 'Something wenr wrong';
    if (email.isNotEmpty || password.isNotEmpty) {
      try {
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        message = 'Success';
      } on FirebaseAuthException catch (e) {
        message = e.message.toString();
      }
    } else {
      message = 'Please all field are required';
    }
    return message;
  }
}
