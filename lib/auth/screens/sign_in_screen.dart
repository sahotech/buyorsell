// ignore_for_file: use_build_context_synchronously

import 'package:buy_or_sell/auth/screens/auth_service.dart';
import 'package:buy_or_sell/auth/screens/sign_up_screen.dart';

import 'package:flutter/material.dart';

import '../../widgets/text_field/email_textform.dart';
import '../../widgets/text_field/password_text.dart';
import '../../widgets/utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> signinKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthServices authServices = AuthServices();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // void signIn() async {
  //   await authServices.signInUsers(
  //     email: emailController.text.trim(),
  //     password: passwordController.text.trim(),
  //   );
  // }
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: signinKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    child: const Text('Logo'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Sign-in',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  // email Text Field
                  EmailTextField(
                    controller: emailController,
                  ),
                  // Password Text Field
                  const SizedBox(height: 10),
                  PasswordTextField(
                    controller: passwordController,
                  ),
                  const SizedBox(height: 10),
                  // forgot password
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.amberAccent.shade700,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ## sign in butoon ###
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent.shade700,
                      ),
                      child: const Text(
                        'Sign-in',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                          Future.delayed(const Duration(seconds: 2));
                        });
                        final message = await authServices.signInUsers(
                            email: emailController.text,
                            password: passwordController.text);
                        setState(() {
                          isLoading = false;
                        });

                        if (message!.contains('Success')) {}
                        Utils().mySnackbar(
                            context: context,
                            message: message,
                            bgColor: Colors.black);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t Have An Account? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign-up',
                          style: TextStyle(
                              color: Colors.amberAccent.shade700,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
