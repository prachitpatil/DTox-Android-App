import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Avatar'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),

      body:
      Padding(
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
        child: Column( //C1

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row( //C1>R1
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                CircleAvatar(
                  backgroundImage: AssetImage('assets/Wolverine.jpg'),
                  radius: 70.0,
                ),

                SizedBox(width: 25.0),

                Column( //C1>R1>C1'
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'NAME',
                      style: TextStyle(
                        color: Colors.grey[400],
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      'Wolverine',
                      style: TextStyle(
                        color: Colors.amber,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),  //C1'

              ],
            ), //R1
            Divider(
              height: 40.0,
              color: Colors.grey[600],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column( //C1>C1'
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: TextStyle(
                        color: Colors.grey[400],
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        color: Colors.amber,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ), //C1'
                Column(
                  children: <Widget>[
                    Text(
                      'Interest',
                      style: TextStyle(
                        color: Colors.grey[400],
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      'Coding',
                      style: TextStyle(
                        color: Colors.amber,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: 30.0,
              color: Colors.grey[600],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column( //C1>C1'
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Skin',
                      style: TextStyle(
                        color: Colors.grey[400],
                        letterSpacing: 2.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_pin,
                      ),
                      color: Colors.blue,
                      iconSize: 50.0,
                    ),
                  ],
                ), //C1'
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RaisedButton.icon(
                      onPressed: () {
                        setState(() {
                          //level += 1;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_upward,
                      ),
                      label: Text('Upgrade'),
                      color: Colors.deepPurpleAccent[100],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.beenhere,
                          ),
                          color: Colors.lightGreenAccent,
                        ),
                        Text(
                          'Maxed Out',
                          style: TextStyle(
                            color: Colors.tealAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Divider(
              height: 30.0,
              color: Colors.grey[400],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column( //C1>C1'
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Acquired Skills',
                      style: TextStyle(
                        color: Colors.grey[400],
                        letterSpacing: 2.0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Skill',
                          style: TextStyle(
                            color: Colors.amber,
                            letterSpacing: 2.0,
                            fontSize: 21.0,
                          ),

                        ),
                      ],
                    ), //C1'
                    Column(
                      children: <Widget>[
                        Text(
                          'LEVEL',
                          style: TextStyle(
                            color: Colors.grey[400],
                            letterSpacing: 2.0,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Skill',
                              style: TextStyle(
                                color: Colors.amber,
                                letterSpacing: 2.0,
                                fontSize: 21.0,
                              ),

                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),

                Divider(
                  height: 30.0,
                  color: Colors.grey[400],
                ),

                Column(
                  children: <Widget>[
                    Text('Skill',
                      style: TextStyle(
                        color: Colors.amber,
                        letterSpacing: 2.0,
                        fontSize: 21.0,
                      ),

                    ),

                  ],
                ),
              ],//C1
            ),
          ],
        ),
      ),
    );
  }
}
