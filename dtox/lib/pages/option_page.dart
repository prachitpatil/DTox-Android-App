import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OptionPage extends StatefulWidget {
  @override
  _OptionPageState createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {

  _doNothing() {

  }

  _loadQuiz() {
    Navigator.pushNamed(context, '/quiz');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose One"),
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
          child: Center(
          child: Container(
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            width: double.infinity,
            height: 240.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/quiz');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Take a Quiz',
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  '-OR-',
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 2.5,
                    color: Colors.blueGrey,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/news');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  color: Colors.pinkAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Read some News',
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    ),
    );
  }
}