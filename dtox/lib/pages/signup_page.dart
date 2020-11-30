import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
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
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: "FirstName LastName",
                                    labelText: "Name",
                                    border: OutlineInputBorder(),
                                  ),

                                ),
                                SizedBox(
                                  height: 25,
                                ),
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

                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, '/login');
                                  },
                                  child: Text("SignUp",
                                    style: TextStyle(
                                      letterSpacing: 2.0,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo[800],
                                    ),
                                  ),
                                  color: Colors.amber[400],
                                  //hoverColor: Colors.purple,
                                  textColor: Colors.blueGrey[800],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Already an User?",
                                      style: TextStyle(
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple[800]
                                      ),),
                                    RaisedButton.icon(onPressed: () {
                                      //Navigator.pushNamed(context, '/login');
                                      Navigator.popAndPushNamed(context, '/login');
                                    },
                                      icon: Icon(Icons.person_add,
                                        color: Colors.deepPurple[800],
                                      ),
                                      label: Text('Login',
                                        style: TextStyle(
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepPurple[800]
                                        ),
                                      ),
                                      color: Colors.redAccent,
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
