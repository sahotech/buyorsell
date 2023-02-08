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
          children: const [
            Expanded(
              child: SearchTextField(),
            ),
          ],
        ),
      ),
    );
  }
}
