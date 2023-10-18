import 'package:cyberapp/story/8to11/level1/l2page4.dart';
import 'package:cyberapp/story/8to11/level1/l2page4v2.dart';
import 'package:flutter/material.dart';

// Style
import 'package:cyberapp/helpers/style.dart';

class L2Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/story/8to11/level1/Level2Page3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.65,
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.22,
                    width: width * 0.90,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius:
                          BorderRadius.circular(20), //border corner radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1), //color of shadow
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: width * 0.10,
                                    top: height * 0.02,
                                    bottom: width * 0.06),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "I received a call, the stranger is asking me\nfor personal information. Should I give \nthe person?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.08,
                                  right: width * 0.08,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: height * 0.06,
                                      width: width * 0.30,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (c, a1, a2) =>
                                                  L2Page4(),
                                              transitionsBuilder:
                                                  (c, a1, a2, child) =>
                                                      FadeTransition(
                                                opacity: a1,
                                                child: child,
                                              ),
                                              transitionDuration:
                                                  Duration(seconds: 1),
                                            ),
                                            (route) => false,
                                          );

                                          //code to execute when this button is pressed.
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.yellow,
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            ),
                                            color: Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  "Give",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.06,
                                      width: width * 0.30,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (c, a1, a2) =>
                                                  L2Page4v2(),
                                              transitionsBuilder:
                                                  (c, a1, a2, child) =>
                                                      FadeTransition(
                                                opacity: a1,
                                                child: child,
                                              ),
                                              transitionDuration:
                                                  Duration(seconds: 1),
                                            ),
                                            (route) => false,
                                          );

                                          //code to execute when this button is pressed.
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.yellow,
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            ),
                                            color: Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  "Do not Give",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
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
