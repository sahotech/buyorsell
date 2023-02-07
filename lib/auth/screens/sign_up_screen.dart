// ignore_for_file: use_build_context_synchronously

import 'package:buy_or_sell/auth/screens/sign_in_screen.dart';

import 'package:buy_or_sell/widgets/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_field/email_textform.dart';
import '../../widgets/text_field/name_text.dart';
import '../../widgets/text_field/password_text.dart';
import '../../widgets/text_field/phone_text_field.dart';
import 'auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthServices authServices = AuthServices();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp() async {
    await authServices.signUpUsers(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      name: nameController.text.trim(),
      phoneNumber: phoneController.text.trim(),
    );
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: signupKey,
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
                    'Sign up',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  // name Text Field
                  NameTextField(controller: nameController),
                  const SizedBox(height: 10),
                  // Email Text Field
                  EmailTextField(
                    controller: emailController,
                  ),
                  const SizedBox(height: 10),
                  // phone no text field
                  PhoneTextField(controller: phoneController),
                  // Password Text Field
                  const SizedBox(height: 5),
                  PasswordTextField(
                    controller: passwordController,
                  ),
                  const SizedBox(height: 30),
                  // sigu up button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent.shade700),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                          Future.delayed(const Duration(seconds: 1));
                        });
                        final message = await authServices.signUpUsers(
                            email: emailController.text,
                            name: nameController.text,
                            phoneNumber: phoneController.text,
                            password: passwordController.text);
                        setState(() {
                          isLoading = false;
                        });

                        if (message!.contains('Success')) {
                          setState(() {
                            isLoading = false;
                            emailController.clear();
                            nameController.clear();
                            passwordController.clear();
                            phoneController.clear();
                          });
                        }
                        Utils().mySnackbar(
                            context: context,
                            message: message,
                            bgColor: Colors.black);
                      },
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Sign-up',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already Have An Account? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const SignInScreen()),
                            ),
                          );
                        },
                        child: Text(
                          'Sign-in',
                          style: TextStyle(
                            color: Colors.amberAccent.shade700,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
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
