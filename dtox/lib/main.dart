import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
//      initialRoute: '/',
//      routes: {
//        '/': (context) => Loading(),
//        '/home': (context) => Home(),
//        '/locate': (context) => Locate(),
//      },

        home: Pomodoro(),
    ));

class Pomodoro extends StatefulWidget {
  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {

  double percent = 0;
  static int timeInMinute = 25;
  static int timeInSecond = timeInMinute * 60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.black],
              begin: FractionalOffset(0.5,0.95)
            )
          ),
        ),
      ),
    );
  }
}
