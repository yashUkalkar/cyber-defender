import 'package:cyberapp/story/8to11/level1/l2page8.dart';
import 'package:flutter/material.dart';

// Style
import 'package:cyberapp/helpers/style.dart';

class L2Page7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,

        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/story/8to11/level1/Level2Page7.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.30,
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.25,
                    width: width * 0.9,
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
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: width * 0.08,
                                    top: height * 0.02,
                                    bottom: width * 0.06),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Dog: \n\nContact for CYBER SECURITY Services NOW!\n I got the plate number it is link to IT Services.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                height: height * 0.06,
                                width: width * 0.60,
                                child: GestureDetector(
                                  onLongPress: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (c, a1, a2) => L2Page8(),
                                        transitionsBuilder:
                                            (c, a1, a2, child) =>
                                                FadeTransition(
                                          opacity: a1,
                                          child: child,
                                        ),
                                        transitionDuration:
                                            Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  child: Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            "Press and Hold to Report",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
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
