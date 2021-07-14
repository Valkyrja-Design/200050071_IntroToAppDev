import 'package:flutter/material.dart';
import 'Questions.dart';
import 'Widget Functions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AllQuestions Qs = AllQuestions();
  int Question_number = 0;
  bool at_end=false;
  List<Widget> Status = [];

  bool Check(bool Ans) {
    if (Qs.Questions![Question_number].Answer == Ans) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz Time',
          ),
          backgroundColor: Colors.grey[800],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            setState(() {
              Status.clear();
              Question_number=0;
            });
          },
          child: Text(
            'Reset',
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          color: Colors.grey[850],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    Qs.Questions![Question_number].Question!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (Question_number==14 && !at_end){
                        if (Check(true)){
                          Status.add(Correct());
                        }
                        else{
                          Status.add(Wrong());
                        }
                        at_end=true;
                      }
                      else if (Check(true) && Question_number<14) {
                        Status.add(Correct());
                        Question_number += 1;
                      }
                      else if (Check(false) && Question_number<14){
                        Status.add(Wrong());
                        Question_number += 1;
                      }
                      else{}
                    });
                  },
                  child: Text(
                    'True',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightGreenAccent.shade400),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (Question_number==14 && !at_end){
                        if (Check(false)){
                          Status.add(Correct());
                        }
                        else{
                          Status.add(Wrong());
                        }
                        at_end=true;
                      }
                      else if (Check(false) && Question_number<14) {
                        Status.add(Correct());
                        Question_number += 1;
                      }
                      else if (Check(true) && Question_number<14){
                        Status.add(Wrong());
                        Question_number += 1;
                      }
                      else{}
                    });
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade400),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: Status,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}