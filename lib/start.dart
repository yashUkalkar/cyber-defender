// Packages
import 'package:cyberapp/main.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:audioplayers/audioplayers.dart';

// Pages
import 'package:cyberapp/settings.dart';
import 'package:cyberapp/shop.dart';
import 'package:cyberapp/user_requests.dart';

// Style
import 'package:cyberapp/helpers/style.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    // To show error if no internet
    bool _isSnackbarActive = false;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomText(
                          text: "0",
                          fontSize: 25,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/coin_icon.png"),
                        radius: 15,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowUpList(
                      direction: Direction.vertical,
                      curve: Curves.easeInBack,
                      animationDuration: Duration(milliseconds: 1500),
                      delayBetween: Duration(milliseconds: 200),
                      children: [
                        // Game name
                        CustomText(
                          text: "Cyber\nDefender",
                          titleFont: true,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 7,
                        ),
                        SizedBox(height: 20),

                        // App logo
                        Icon(
                          Icons.shield_outlined,
                          size: 200,
                          color: AppColors.text,
                        ),
                        Divider(
                          height: 100,
                          thickness: 0.5,
                          color: Colors.blue[900],
                          indent: 30,
                          endIndent: 30,
                        ),

                        CustomText(text: "Select game mode"),
                        SizedBox(height: 25),

                        // Game mode buttons
                        ModeButton(
                          text: "STORY MODE",
                          onPressed: () {
                            Navigator.pushNamed(context, "/story");
                          },
                        ),
                        ModeButton(
                          text: "MULTIPLAYER MODE",
                          onPressed: () async {
                            if (await InternetConnectionChecker()
                                .hasConnection) {
                              Navigator.pushNamed(context, "/auth");
                            } else if (!_isSnackbarActive) {
                              setState(() {
                                _isSnackbarActive = true;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.error,
                                      duration: Duration(seconds: 3),
                                      content: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text:
                                                  "Multiplayer mode requires internet!",
                                              fontSize: 13,
                                            ),
                                            Icon(
                                              Icons
                                                  .signal_wifi_connected_no_internet_4_outlined,
                                              color: AppColors.text,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .closed
                                  .then((value) => setState(
                                      () => _isSnackbarActive = false));
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Game mode button
class ModeButton extends StatelessWidget {
  const ModeButton({
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
