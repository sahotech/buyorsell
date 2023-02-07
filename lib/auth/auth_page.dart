// import 'package:buy_or_sell/auth/screens/sign_in_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import '../pages/main_page.dart';

// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey.shade200,
//       ),
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Colors.amberAccent.shade700,
//               ),
//             );
//           } else if (snapshot.hasData) {
//             FirebaseAuth.instance.signOut();
//             return const MainScreen();
//           } else {
//             return const SignInScreen();
//           }
//         },
//       ),
//     );
//   }
// }
