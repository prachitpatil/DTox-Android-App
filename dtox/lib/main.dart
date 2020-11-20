
import 'package:flutter/material.dart';
import 'package:dtox/pages/home.dart';
import 'package:dtox/pages/login_page.dart';

void main() =>
    runApp(MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => Home(),

      },
    ));

