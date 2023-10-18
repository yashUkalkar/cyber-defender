import 'package:audioplayers/audioplayers.dart';
import 'package:cyberapp/start.dart';
import 'package:cyberapp/story/levelpage1.dart';
// import 'package:cyberapp/story/levels.dart';
import 'package:flutter/material.dart';

// Style
import 'package:cyberapp/helpers/style.dart';

class L1Page8S2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,

        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/story/8to11/level1/level2Page11 (2).png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.62,
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      AudioPlayer(playerId: "sus").stop();
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => LvlPage2(),
                          transitionsBuilder: (c, a1, a2, child) =>
                              FadeTransition(
                            opacity: a1,
                            child: child,
                          ),
                          transitionDuration: Duration(seconds: 1),
                        ),
                        (route) => false,
                      );

                      //code to execute when this button is pressed.
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.90,
                      height: height * 0.20,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius:
                            BorderRadius.circular(20), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.1), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                            //first paramerter of offset is left-right
                            //second parameter is top to down
                          ),
                          //you can set more BoxShadow() here
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "MORAL",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "\nInstall antivirus in device ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "\n+",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "\nAlways use strong password to stay safe ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
