import 'package:buy_or_sell/auth/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/setting_container_widget.dart';
import '../widgets/utils/utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        flexibleSpace: Utils().myAppBarColor(),
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsContainerWidget(
                icon: Icons.person_outline,
                onTap: () {},
                text: 'Personal details'),
            SettingsContainerWidget(
                icon: Icons.call_outlined,
                onTap: () {},
                text: 'Edit/Add phone number'),
            SettingsContainerWidget(
              icon: Icons.email_outlined,
              onTap: () {},
              text: 'Change email  ${user?.email}',
            ),
            SettingsContainerWidget(
                icon: Icons.star_outline, onTap: () {}, text: 'Rate us'),
            SettingsContainerWidget(
                icon: Icons.lock_outline,
                onTap: () {},
                text: 'Change password'),
            SettingsContainerWidget(
                icon: Icons.info_outline, onTap: () {}, text: 'About us'),
            SettingsContainerWidget(
                icon: Icons.logout_outlined,
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
                },
                text: 'Logout'),
          ],
        ),
      ),
    );
  }
}
