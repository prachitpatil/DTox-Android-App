import 'dart:async';
import 'package:dtox/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:percent_indicator/percent_indicator.dart';


class Home extends StatefulWidget {

  final User user;


  const Home({Key key, this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Timer timer;

  double percent = 0;
  static int timeInMinute = 25;
  static int timeInSecond = timeInMinute * 60;
  int time2 = timeInMinute;
  int time3 = 60;
  int sec2 = 0;
  String quote = "Don't expect a great day, create one!";
  bool _hasBeenPressed = false;

  _StartTimer() {
    _hasBeenPressed = !_hasBeenPressed;
    if(_hasBeenPressed) {
      int time = timeInMinute * 60;
      double secPercent = (time / 100);
      time2--;
      sec2 = 59;
      // timer = Timer.periodic(Duration(minutes: 1), (timer) {
      //   time3++;
      //   if(time2 != 0) {
      //     time2--;
      //   }
      //
      // });
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if(time2 > 0) {
            sec2--;
          }
          else if(time3 != 0) {
            time3--;
            if(sec2 > 0) {
              sec2--;
            }

          }
          if(sec2 == 0 && time2 == 0 && time3 == 0) {
            sec2 = 0;
          }
          if(sec2 == 0 && time2 != 0){
            sec2 = 59;
            time2--;
          }
          if (time > 0) {
            time--;
            if (time % secPercent == 0 && time3 != 0) {
              if (percent < 1) {
                percent += 0.01;
              }
              else {
                percent = 1;
              }
            }
          }
          else {
            timer.cancel();
            percent = 0;
            timeInMinute = 25;
            time2 = timeInMinute;
            sec2 = 0;
            _hasBeenPressed = false;
            Navigator.pushNamed(context, '/option');
          }
        });
      });


      // timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //   sec2--;
      //   if(sec2 == 0){
      //     sec2 = 59;
      //   }
      //   if(time2 == 0 && sec2 == 0) {
      //     timer.cancel();
      //     Navigator.pushNamed(context, '/login');
      //   }
      // });
    }
    else{
      setState(() {
        percent = 0;
        timeInMinute = 25;
        time2 = timeInMinute;
        sec2 = 0;
        timer.cancel();
      });
    }
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
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: () {
            _signOut().whenComplete(() {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginPage()));
            });
          },)
        ],
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
                              letterSpacing: 1.2,
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
                          color: _hasBeenPressed?Colors.redAccent:Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              _hasBeenPressed ? 'Give Up!' : 'Start Focusing!',
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

  Future _signOut() async {
    await _auth.signOut();
  }

}





