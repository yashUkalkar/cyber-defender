// Packages
import 'package:audioplayers/audioplayers.dart';
import 'package:cyberapp/story/4to7/level1/l1page1.dart';
import 'package:cyberapp/story/8to11/level1/l2page1.dart';
import 'package:cyberapp/story/levels.dart';
import 'package:flutter/material.dart';

// Style
import 'package:cyberapp/helpers/style.dart';

class StoryHomePage extends StatelessWidget {
  const StoryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: "Select your age range",
                fontSize: 24,
              ),
              SizedBox(height: 50),
              AgeRangeButton(
                text: "4 to 7 yrs",
                onPressed: () {
                  Navigator.pushNamed(context, '/level');
                },
              ),
              AgeRangeButton(
                text: "8 to 11 yrs",
                onPressed: () {
                  Navigator.pushNamed(context, '/8to11');
                },
              ),
              AgeRangeButton(
                text: "12 to 17 yrs",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Age range selection button
class AgeRangeButton extends StatelessWidget {
  const AgeRangeButton({
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
          AudioPlayer().play(AssetSource('audio/button.mp3'));
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
