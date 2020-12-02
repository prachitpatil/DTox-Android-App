import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


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
                      child: Form(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(

                            children: <Widget>[
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "username@email.com",
                                  labelText: "Email",
                                  border: OutlineInputBorder(),
                                ),

                              ),
                              SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              RaisedButton(
                                padding: EdgeInsets.all(12.0),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Text("Login",
                                style: TextStyle(
                                  letterSpacing: 2.0,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo[800],
                                ),
                                ),
                                color: Colors.lightGreenAccent[400],
                                textColor: Colors.blueGrey[800],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Not a User?",
                                  style: TextStyle(
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo
                                  ),),
                                  RaisedButton.icon(onPressed: () {
                                    Navigator.pushNamed(context, '/signup');
                                  },
                                      icon: Icon(Icons.person_add,
                                        color: Colors.amberAccent,
                                      ),
                                      label: Text('Register',
                                      style: TextStyle(
                                        letterSpacing: 2.0,
                                          fontWeight: FontWeight.bold,
                                        color: Colors.amberAccent
                                      ),
                                      ),
                                  color: Colors.indigo,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
