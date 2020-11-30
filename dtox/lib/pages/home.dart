import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:percent_indicator/percent_indicator.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Timer timer;

  double percent = 0;
  static int timeInMinute = 25;
  static int timeInSecond = timeInMinute * 60;
  int time2 = timeInMinute;
  int sec2 = 0;
  String quote = "Let's start a Focus Session";

  _StartTimer() {
    int time = timeInMinute * 60;
    double secPercent = (time / 100);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
          if (time % secPercent == 0) {
            if (percent < 1) {
              percent += 0.01;
            }
            else {
              percent = 1;
            }
          }
        }
        else {
          percent = 0;
          timeInMinute = 25;
          timer.cancel();
        }
      });
    });

        time2--;
        sec2 = 59;
    timer = Timer.periodic(Duration(minutes: 1), (timer) {
      time2--;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      sec2--;
      if(sec2 == 0){
        sec2 = 59;
      }
      if(time2 == 0 && sec2 == 0) {
        timer.cancel();
        Navigator.pushNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('D-Tox',
        style: TextStyle(
          letterSpacing: 2.0,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            //colors: [Colors.black, Colors.grey[800]],
            colors: [Colors.indigoAccent[400], Colors.blue],
            begin: FractionalOffset(0.5,1),
          )
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                percent: percent,
                animation: true,
                animateFromLastPercent: true,
                radius: 280.0,
                lineWidth: 20.0,
                progressColor: Colors.white,
                center: Text(
                  '$time2:$sec2',
                  style: TextStyle(
                      color: Colors.white,
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),

                  )
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            gradient: LinearGradient(
                              //colors: [Colors.black, Colors.grey[800]],
                              colors: [Colors.blueAccent, Colors.lightBlueAccent],
                              begin: FractionalOffset(0.3,1),
                            )
                        ),
                        child: Center(
                          child: Text(
                            '$quote',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Focus Time:',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              //color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '25 minutes',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              //color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Break Time:',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              //color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '5 minutes',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              //color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                        child: RaisedButton(
                          onPressed: _StartTimer,
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Start Focusing!',
                              style: TextStyle(
                                letterSpacing: 2.0,
                                fontSize: 28.0,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white,

                              ),
                            ),
                          ),
                        ),
                      ),
                      //Button (to be built)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),


      ),

    );
  }
}





