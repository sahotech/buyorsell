import 'package:buy_or_sell/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../cloud_firestore_class.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  CloudFirestore cloudFirestore = CloudFirestore();

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
        await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        UserDetailsModel user = UserDetailsModel(
            name: name, email: email, phoneNumber: phoneNumber);
        await cloudFirestore.upLoadUserDetailsToDatabase(
          user: user,
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
