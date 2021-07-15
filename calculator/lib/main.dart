import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    final text= _controller.text;
    _controller.value = _controller.value.copyWith(
      text: text,
      selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  bool IsOperation(String c){
    List operations=["+","-","/","*"];
    for (int i=0;i<4;i++){
      if (c==operations[i]){
        return true;
      }
    }
    return false;
  }
  void Pressed0(){
    _controller.text=_controller.text+"0";
  }
  void Pressed1(){
    _controller.text=_controller.text+"1";
  }
  void Pressed2(){
    _controller.text=_controller.text+"2";
  }
  void Pressed3(){
    _controller.text=_controller.text+"3";
  }
  void Pressed4(){
    _controller.text=_controller.text+"4";
  }
  void Pressed5(){
    _controller.text=_controller.text+"5";
  }
  void Pressed6(){
    _controller.text=_controller.text+"6";
  }
  void Pressed7(){
    _controller.text=_controller.text+"7";
  }
  void Pressed8(){
    _controller.text=_controller.text+"8";
  }
  void Pressed9(){
    _controller.text=_controller.text+"9";
  }
  void Pressed_minus(){
    if (IsOperation(_controller.text[_controller.text.length-1])){
      return;
    }
    else {
      _controller.text = _controller.text + "-";
    }
  }
  void Pressed_plus(){
    if (IsOperation(_controller.text[_controller.text.length-1])){
      return;
    }
    else {
      _controller.text = _controller.text + "+";
    }
  }
  void Pressed_multiply(){
    if (IsOperation(_controller.text[_controller.text.length-1])){
      return;
    }
    else {
      _controller.text = _controller.text + "*";
    }
  }
  void Pressed_division(){
    if (IsOperation(_controller.text[_controller.text.length-1])){
      return;
    }
    else {
      _controller.text = _controller.text + "/";
    }
  }
  void Pressed_decimal(){
    if (IsOperation(_controller.text[_controller.text.length-1])){
      return;
    }
    else {
      _controller.text = _controller.text + ".";
    }
  }
  void Pressed_backspace(){
    String str=_controller.text;
    if (str=="Math Error!"){
      _controller.text="";
    }
    else if (str != null && str.length > 0) {
      str = str.substring(0, str.length - 1);
      _controller.text=str;
    }

  }
  String Answer(String value){
    List operations=[];
    if (value==""){
      return "";
    }
    else{
      List Numbers= value.split(new RegExp(r"['+','\-','*','/']"));
      for (int i=0;i<value.length;i++){
        if (IsOperation(value[i])){
          operations.add(value[i]);
        }
      }
      double first=double.parse(Numbers[0]);
      int j=1;
      double zero=0;
      for (int i=0;i<operations.length && j<Numbers.length;i++){
        if (operations[i]=="/" && double.parse(Numbers[j])==zero){
          return "Math Error!";
        }
        else{
          if (operations[i]=="+"){
            first=first+double.parse(Numbers[j]);
            j++;
          }
          else if (operations[i]=="-"){
            first-=double.parse(Numbers[j]);
            j++;
          }
          else if (operations[i]=="*"){
            first*=double.parse(Numbers[j]);
            j++;
          }
          else if (operations[i]=="/"){
            first/=double.parse(Numbers[j]);
            j++;
          }
        }
      }
      return first.toString();
    }
  }
  void Pressed_equalsTo(){
    String str=_controller.text;
    _controller.text=Answer(str);
  }
  void LongPressed_Backspace(){
    _controller.text="";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCalculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.yellow.shade600,
        ),
        body: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(0),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (String value) {},
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                    ),
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    textAlign: TextAlign.end,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.blue,
                    cursorHeight: 60,
                    cursorWidth: 2,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: Container(
                          color: Colors.grey[900],
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[900],
                            ),
                            onPressed: Pressed7,
                            child: Text(
                              '7',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue[200],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed8,
                          child: Text(
                            '8',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed9,
                          child: Text(
                            '9',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed_division,
                          child: Text(
                            '/',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed_backspace,
                          onLongPress: LongPressed_Backspace,
                          child: Icon(
                            Icons.backspace_outlined,
                            color: Colors.blue[200],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed4,
                          child: Text(
                            '4',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed5,
                          child: Text(
                            '5',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed6,
                          child: Text(
                            '6',

                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed_multiply,
                          child: Text(
                            '*',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            color: Colors.grey[900],
                            child: SizedBox(),
                        ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed1,
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed2,
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed3,
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed_minus,
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey[900],
                        child: SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed0,
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed_decimal,
                          child: Text(
                            '.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                          child: SizedBox(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed_plus,
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey[900],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                          ),
                          onPressed: Pressed_equalsTo,
                          child: Text(
                            '=',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
