import 'package:audioplayers/audioplayers.dart';
import 'package:cyberapp/helpers/style.dart';
import 'package:cyberapp/story/4to7/level1/l1page2.dart';
import 'package:flutter/material.dart';

// Style

class L1Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioPlayer(playerId: "sus").play(
      AssetSource('audio/suspense_music.mp3'),
    );
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,

        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/story/4to7/level1/Level1Page1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(physics: NeverScrollableScrollPhysics(), children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.67,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child:

                  //code to execute when this button is pressed.

                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => L1Page2(),
                          transitionsBuilder: (c, a1, a2, child) =>
                              FadeTransition(
                            opacity: a1,
                            child: child,
                          ),
                          transitionDuration: Duration(seconds: 1),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.14,
                      width: MediaQuery.of(context).size.width * 0.40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
