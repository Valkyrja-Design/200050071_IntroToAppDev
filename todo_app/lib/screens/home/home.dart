import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/todolist.dart';
import 'package:todo_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/services/database.dart';

class Home extends StatelessWidget {
  final Function? Switch;
  String? uid;
  Home({this.Switch, this.uid});
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: Database().data,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text(
            'Todo List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
                this.Switch!();
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              label: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        body: TodoList(this.uid),
      ),
    );
  }
}
