import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


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
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(

                              children: <Widget>[
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: "username@email.com",
                                    labelText: "Email",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Email cannot be empty';
                                    }
                                    return null;
                                  },

                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Password cannot be empty';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                RaisedButton(
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 12.0, 20.0, 12.0),
                                  // onPressed: () async {
                                  //   if (_formKey.currentState.validate()) {
                                  //     _signInWithEmailAndPassword();
                                  //   }
                                  // },
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, '/home');
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Text("Login",
                                    style: TextStyle(
                                      letterSpacing: 2.0,
                                      fontSize: 18.0,
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
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[
                                    Text("Not a User?",
                                      style: TextStyle(
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo
                                      ),
                                    ),
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


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Home(
          user: user,
        );
      }));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Email & Password"),
      ));
    }
  }

}

