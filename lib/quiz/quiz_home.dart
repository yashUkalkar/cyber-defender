// Package
import 'package:flutter/material.dart';

// Style
import '../helpers/style.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          text: "Start a Game",
          onPressed: () {},
        ),
      ),
    );
  }
}

// Custom button
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 60,
      ),
      child: MaterialButton(
        onPressed: () {
          this.onPressed();
        },
        child: CustomText(
          text: this.text,
        ),
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
        color: AppColors.accent,
        splashColor: Colors.black,
      ),
    );
  }
}
