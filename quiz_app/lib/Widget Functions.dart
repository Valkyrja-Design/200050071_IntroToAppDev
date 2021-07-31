import 'package:flutter/material.dart';

Widget Wrong(){
  return Container(
    color: Colors.grey[850],
    child: Icon(
      Icons.close,
      color: Colors.red,
    ),
  );
}

Widget Correct(){
  return Container(
    color: Colors.grey[850],
    child: Icon(
      Icons.check,
      color: Colors.green,
    ),
  );
}