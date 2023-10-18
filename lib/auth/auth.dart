// Packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Pages
import 'signin.dart';
import '../quiz/quiz_home.dart';

// Style
import '../helpers/style.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  // @override
  // Widget build(BuildContext context) => StreamBuilder<User?>(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: ((context, snapshot) {
  //         if (snapshot.hasData) {
  //           return QuizHomePage();
  //         } else {
  //           return SignInPage();
  //         }
  //       }),
  //     );

  @override
  Widget build(BuildContext context) {
    return QuizHomePage();
  }
}
