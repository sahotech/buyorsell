import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class CloudFirestore {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future upLoadUserDetailsToDatabase({required UserDetailsModel user}) async {
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(user.getJson());
  }
}
