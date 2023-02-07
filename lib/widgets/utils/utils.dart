import 'package:flutter/material.dart';

class Utils {
  // SNACKBAR
  mySnackbar({
    required BuildContext context,
    required String message,
    required Color bgColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        content: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.all(10),
        backgroundColor: bgColor,
      ),
    );
  }

// custom appBar TextBox
  myTextBox() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search products',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  myAppBarColor() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amberAccent.shade700,
            Colors.amberAccent.shade200,
            Colors.amberAccent.shade100,
          ],
        ),
      ),
    );
  }
}
