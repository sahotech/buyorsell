// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:buy_or_sell/pages/settings_screen.dart';

import 'package:flutter/material.dart';

import '../../widgets/utils/utils.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  //get user details

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Utils().myAppBarColor(),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person),
          ),
        ),
        title: const Text('Peter Saho'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.add_outlined,
                    size: 24,
                  ),
                  title: const Text(
                    'Sell or Post Ads',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: const Text('Sell any Products for free'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.feedback_outlined,
                    size: 24,
                  ),
                  title: const Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: const Text('Send feedback '),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.notifications_outlined,
                    size: 24,
                  ),
                  title: const Text(
                    'Notification',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: const Text('Notifications'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.info_outline,
                    size: 24,
                  ),
                  title: const Text(
                    'FAQ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
