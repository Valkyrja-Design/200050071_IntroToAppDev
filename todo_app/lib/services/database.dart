import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/services/todo.dart';
import 'package:todo_app/services/userdata.dart';

class Database {
  final String? uid;

  Database({this.uid});

  final CollectionReference todo =
      FirebaseFirestore.instance.collection('todo');

  Future updateData({String? desc, String? date, String? time}) async {
    return await todo.doc('$desc')
        //.doc(uid)
        .set({'desc': desc, 'date': date, 'time': time});
  }

  Future deleteData({String? uid}) async {
    return await todo.doc(uid).delete();
  }

  List<Todo> _todoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      dynamic data = doc.data();
      return Todo(date: data['date'], desc: data['desc'], time: data['time']);
    }).toList();
  }

  Stream<List<Todo>> get data {
    return todo.snapshots().map(_todoListFromSnapshot);
  }

  Userdata _userdataFromDocumentSnapshots(DocumentSnapshot snapshot) {
    dynamic data = snapshot.data();
    return Userdata(
        uid: uid, desc: data['desc'], time: data['time'], date: data['date']);
  }

  // Stream<Userdata> get userData {
  //   return todo.doc(uid).snapshots().map(_userdataFromDocumentSnapshots);
  // }
}
