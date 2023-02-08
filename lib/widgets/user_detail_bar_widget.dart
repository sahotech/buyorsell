// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:buy_or_sell/models/user_model.dart';

class UserDetailBarWidget extends StatelessWidget {
  final UserDetailsModel userDetail;
  UserDetailBarWidget({
    Key? key,
    required this.userDetail,
  }) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white70),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hi, ',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: userDetail.name,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
