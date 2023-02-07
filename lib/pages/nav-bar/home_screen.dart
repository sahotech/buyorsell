import 'package:buy_or_sell/pages/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/categorie_widget.dart';
import '../../widgets/utils/banner_ads_widget.dart';
import '../../widgets/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final user = FirebaseAuth.instance.currentUser!;

myContainer() {
  return Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        const SizedBox(width: 10),
        Icon(
          Icons.search_outlined,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 5),
        Text(
          'Search',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 20,
          ),
        )
      ],
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Colors.amber.shade600,
            title: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  child: myContainer(),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                CategoriesWidget(),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: BannerAdsWidget(),
          ),
        ],
      ),
    );
  }
}
