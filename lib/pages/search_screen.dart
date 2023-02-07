import 'package:flutter/material.dart';

import '../widgets/text_field/search_text_field.dart';
import '../widgets/utils/utils.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Utils().myAppBarColor(),
        title: Row(
          children: [
            const Expanded(
              child: SearchTextField(),
            ),
            // IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
          ],
        ),
      ),
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [
      //           Colors.amberAccent.shade700,
      //           Colors.amberAccent.shade200,
      //           Colors.amberAccent.shade100,
      //         ],
      //       ),
      //     ),
      //   ),
      //   // toolbarHeight: 102,
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(70),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      // child: Row(
      //   children: [
      //     const Expanded(
      //       child: SearchTextField(),
      //     ),
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
      //   ],
      // ),
      //     ),
      //   ),
      // ),
    );
  }
}
