
import 'package:dtox/pages/choice.dart';
import 'package:dtox/pages/news_page.dart';
import 'package:dtox/pages/option_page.dart';
import 'package:dtox/pages/quiz.dart';
import 'package:dtox/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dtox/pages/home.dart';
import 'package:dtox/pages/login_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //runApp(MyApp());
//}

//void main() =>
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/home': (context) => Home(),
      '/signup': (context) => SignupPage(),
      '/choice': (context) => ChoicePage(),
      '/quiz': (context) => QuizPage(),
      '/news': (context) => NewsPage(),
      '/option': (context) => OptionPage(),

    },
  ));
}