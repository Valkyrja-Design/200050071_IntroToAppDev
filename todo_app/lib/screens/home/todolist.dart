import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/home/Creation.dart';
import 'package:todo_app/services/database.dart';
import 'package:todo_app/services/todo.dart';

class TodoList extends StatefulWidget {
  String? uid = '';
  TodoList(String? uid) {
    this.uid = uid;
  }

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  String? id;
  Database? database;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.uid;
    database = Database(uid: id);
  }

  @override
  Widget build(BuildContext context) {
    void _showCreateScreen() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: CreationForm(dataBase: this.database),
            );
          });
    }

    List<Todo>? todoList = Provider.of<List<Todo>?>(context) ?? [];

    int length = todoList.length;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateScreen(),
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          final item =
              '${todoList[index].desc} ${todoList[index].date} ${todoList[index].time}';
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) async {
              // Remove the item from the data source.

              setState(() {
                database!.deleteData(uid: '${todoList[index].desc}');
                todoList.removeAt(index);
              });

              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
            },
            child: Card(
              color: Colors.blue[800],
              margin: EdgeInsets.all(6),
              child: ListTile(
                title: Text(
                  '${todoList[index].desc}',
                ),
                subtitle:
                    Text('${todoList[index].date} ${todoList[index].time}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
