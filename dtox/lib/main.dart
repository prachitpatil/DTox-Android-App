
import 'package:dtox/pages/choice.dart';
import 'package:dtox/pages/news_page.dart';
import 'package:dtox/pages/quiz.dart';
import 'package:dtox/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:dtox/pages/home.dart';
import 'package:dtox/pages/login_page.dart';

void main() =>
    runApp(MaterialApp(
      initialRoute: '/choice',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => Home(),
        '/signup': (context) => SignupPage(),
        '/choice': (context) => ChoicePage(),
        '/quiz': (context) => QuizPage(),
        '/news': (context) => NewsPage(),

      },
    ));

