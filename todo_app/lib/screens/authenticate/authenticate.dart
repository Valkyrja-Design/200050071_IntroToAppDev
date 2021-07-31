import 'package:flutter/material.dart';
import 'package:todo_app/screens/authenticate/SignIn.dart';
import 'package:todo_app/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  final Function? Switch;

  Authenticate({this.Switch});
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignInPage = true;

  void toggle() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignInPage
        ? SignIn(toggle: toggle, Switch: widget.Switch)
        : Register(toggle: toggle);
  }
}
