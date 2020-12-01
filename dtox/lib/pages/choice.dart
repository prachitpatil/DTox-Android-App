import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChoicePage extends StatefulWidget {
  @override
  _ChoicePageState createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {

  _doNothing() {

  }

  _loadQuiz() {
    Navigator.pushNamed(context, '/quiz');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Image.asset("assets/bg1.jpg",
              fit: BoxFit.fill,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(

                    children: <Widget>[
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 30.0 ),
                              child: RaisedButton(
                                onPressed: _loadQuiz(),
                                color: Colors.cyanAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Take a Quiz',
                                    style: TextStyle(
                                      letterSpacing: 2.0,
                                      fontSize: 28.0,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[800],

                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '-OR-',
                              style: TextStyle(
                                letterSpacing: 2.0,
                                //fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 30.0 ),
                              child: RaisedButton(
                                onPressed: _doNothing,
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Read some News',
                                    style: TextStyle(
                                      letterSpacing: 2.0,
                                      fontSize: 28.0,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[800],

                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],

                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}