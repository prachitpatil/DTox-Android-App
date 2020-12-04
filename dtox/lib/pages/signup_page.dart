import 'package:dtox/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  bool _isSuccess;
  String _userEmail;

  @override

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override


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
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(

                              children: <Widget>[
                                TextFormField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    hintText: "FirstName LastName",
                                    labelText: "Name",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Name cannot be empty';
                                    }
                                    return null;
                                  },

                                ),
                                SizedBox(
                                  height: 25,
                                ),
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
                                    padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),

                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      _registerAccount();
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
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
                                    Text("Already a User?",
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


    void _registerAccount() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
    email: _emailController.text,
    password: _passwordController.text,
    ))
        .user;

    if (user != null) {
    if (!user.emailVerified) {
    await user.sendEmailVerification();
    }
    await user.updateProfile(displayName: _nameController.text);
    final user1 = _auth.currentUser;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => Home(
    user: user1,
    )));
    } else {
    _isSuccess = false;
    }
    }


}


