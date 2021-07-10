import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  _MyFirstAppState createState() => _MyFirstAppState();
}

class _MyFirstAppState extends State<MyFirstApp> {
  bool? isChecked = true;
  int? buttonCounter = 0;
  int selectedIndex = 0;

  List<Widget> _widgetOptions = [
    Text(
      'We are at Home',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'We are at IITB',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'We are at Work',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyFirstApp'),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        buttonCounter = buttonCounter! - 1;
                      });
                    },
                    child: Icon(
                      CupertinoIcons.minus,
                      color: Colors.white,
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        buttonCounter = buttonCounter! + 1;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$buttonCounter',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue;
                  });
                },
                title: Text(
                  'True or Not?',
                  style: TextStyle(color: Colors.blue),
                ),
                activeColor: Colors.white,
                checkColor: Colors.blue,
                tileColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${isChecked! ? 'True' : 'Not True'}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              _widgetOptions[selectedIndex],
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue[900],
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.school, color: Colors.blue[900]),
                label: 'College'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business, color: Colors.blue[900]),
                label: 'Work'),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
