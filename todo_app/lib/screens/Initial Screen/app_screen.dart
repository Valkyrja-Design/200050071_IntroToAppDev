import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/authenticate/SignIn.dart';
import 'package:todo_app/screens/authenticate/authenticate.dart';
import 'package:todo_app/screens/home/home.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool SignedIn = false;
  String? uid;
  void Switch({String? uid}) {
    setState(() {
      SignedIn = !SignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SignedIn
        ? Home(Switch: Switch, uid: uid)
        : Authenticate(Switch: Switch);
  }
}
