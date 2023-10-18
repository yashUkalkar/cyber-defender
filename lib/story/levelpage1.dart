import 'package:cyberapp/nav.dart';
import 'package:cyberapp/story/4to7/level1/l1page1.dart';
import 'package:cyberapp/story/4to7/level1/l1page2.dart';
import 'package:cyberapp/story/4to7/level1/l2page1.dart';
import 'package:cyberapp/story/8to11/level1/l2page1s2.dart';
import 'package:flutter/material.dart';

class LvlPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Levels"),
        leading: BackButton(
          onPressed: () => {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => Navbar(),
                transitionsBuilder: (c, a1, a2, child) => FadeTransition(
                  opacity: a1,
                  child: child,
                ),
                transitionDuration: Duration(seconds: 1),
              ),
              (route) => true,
            )
          },
          color: Colors.white, // <-- SEE HERE
        ),
        backgroundColor: Colors.black, // 1
        elevation: 0, // 2
      ),
      body: Container(
        alignment: Alignment.center,

        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/level/levelpage1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.35,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.10,
                        top: MediaQuery.of(context).size.height * 0.10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => L1Page1(),
                              transitionsBuilder: (c, a1, a2, child) =>
                                  FadeTransition(
                                opacity: a1,
                                child: child,
                              ),
                              transitionDuration: Duration(seconds: 1),
                            ),
                            (route) => true,
                          );

                          //code to execute when this button is pressed.
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/level/level1.png'),
                              opacity: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.15,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.10,
                        top: MediaQuery.of(context).size.height * 0.10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => L2Page1S2(),
                              transitionsBuilder: (c, a1, a2, child) =>
                                  FadeTransition(
                                opacity: a1,
                                child: child,
                              ),
                              transitionDuration: Duration(seconds: 1),
                            ),
                            (route) => true,
                          );
                          //code to execute when this button is pressed.
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              opacity: 1,
                              image:
                                  AssetImage('assets/images/level/level2.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      left: MediaQuery.of(context).size.width * 0.45,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.10,
                              top: MediaQuery.of(context).size.height * 0.10),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: GestureDetector(
                              onTap: () {
                                //code to execute when this button is pressed.
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 0.5,
                                    image: AssetImage(
                                        'assets/images/level/level3.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      left: MediaQuery.of(context).size.width * 0.45,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.12,
                              top: MediaQuery.of(context).size.height * 0.10),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: GestureDetector(
                              onTap: () {
                                //code to execute when this button is pressed.
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 0.5,
                                    image: AssetImage(
                                        'assets/images/level/level4.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
