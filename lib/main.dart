// Packages
import 'package:cyberapp/nav.dart';
import 'package:cyberapp/quiz/quiz_question.dart';
import 'package:cyberapp/story/4to7/level1/l1page1.dart';
import 'package:cyberapp/story/8to11/level1/l2page1.dart';
import 'package:cyberapp/story/levelpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Pages
import 'package:cyberapp/start.dart';
import 'auth/auth.dart';
import 'package:cyberapp/story/story_home.dart';
import 'quiz/quiz_home.dart';

void main() async {
  // Firebase init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Development servers
//   if (kDebugMode) {
//    try {
//      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
//      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//    } catch (e) {
//      // ignore: avoid_print
//      print(e);
//    }
//  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Navbar(),
        '/level': (context) => LvlPage1(),
        '/quizquestion': (context) => QuizQuestion(),
        '/auth': (context) => const AuthPage(),
        '/story': (context) => const StoryHomePage(),
        '/4to7': (context) => L1Page1(),
        '/8to11': (context) => L2Page1(),
        '/quiz': (context) => const QuizHomePage(),
      },
    );
  }
}
