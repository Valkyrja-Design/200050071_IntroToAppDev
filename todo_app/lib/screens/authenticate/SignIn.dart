import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:todo_app/screens/Initial%20Screen/Loading.dart';
import 'package:todo_app/services/auth.dart';

class SignIn extends StatefulWidget {
  Function? toggle;
  final Function? Switch;
  SignIn({this.toggle, this.Switch});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Auth _auth = Auth();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  //tracking text field

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              backgroundColor: Colors.blue[800],
              title: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter email' : null,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.grey[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pink, width: 2.0),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) => value!.length < 6
                          ? 'Enter a password atleast 6 characters long'
                          : null,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.grey[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pink, width: 2.0),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      color: Colors.blue[900],
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth.signIn(
                              email: email, password: password);

                          if (result == null) {
                            setState(() {
                              error = 'Failed to sign in';
                              loading = false;
                            });
                          } else {
                            setState(() {
                              widget.Switch!(uid: result.uid);
                            });
                          }
                        }
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      color: Colors.blue[900],
                      onPressed: () async {
                        await widget.toggle!();
                      },
                      child: Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
