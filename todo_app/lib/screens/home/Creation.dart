import 'package:flutter/material.dart';
import 'package:todo_app/services/database.dart';

class CreationForm extends StatefulWidget {
  Database? dataBase;

  CreationForm({this.dataBase});

  @override
  _CreationFormState createState() => _CreationFormState();
}

class _CreationFormState extends State<CreationForm> {
  final _formkey = GlobalKey<FormState>();
  String curr_desc = '';
  String curr_date = '';
  String curr_time = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          TextFormField(
            validator: (value) =>
                value!.isEmpty ? 'Enter Event Description' : null,
            decoration: InputDecoration(
              hintText: 'Event Description',
              fillColor: Colors.grey[100],
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink, width: 2.0),
              ),
            ),
            onChanged: (value) {
              setState(() {
                curr_desc = value;
              });
            },
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            validator: (value) {
              if (value == null) return 'Enter Event Date';
              if (value.length != 10) return 'Enter Correct Event Date';
              try {
                String day = value[0] + value[1];
                int iday = int.parse(day);
                if (iday > 31 || iday < 1) return 'Enter Correct Event Date';
                String month = value[3] + value[4];
                int imonth = int.parse(month);
                if (imonth < 1 || imonth > 12)
                  return 'Enter Correct Event Time';
                String year = value[6] + value[7] + value[8] + value[9];
                int iyear = int.parse(year);
                if (iyear < 2021) return 'Enter Correct Event Date';
                return null;
              } catch (e) {
                return 'Enter Correct Event Date';
              }
            },
            decoration: InputDecoration(
              hintText: 'Date(Format - DD/MM/YYYY',
              fillColor: Colors.grey[100],
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink, width: 2.0),
              ),
            ),
            onChanged: (value) {
              setState(() {
                curr_date = value;
              });
            },
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            validator: (value) {
              if (value == null)
                return 'Enter Event Time';
              else if (value.length != 8)
                return 'Enter Correct Event Time';
              else {
                String hour = value[0] + value[1];
                try {
                  int hr = int.parse(hour);
                  if (hr > 12) return 'Enter Correct Event Time';
                  if (value[2] != ':') return 'Enter Correct Event Time';
                  int minutes = int.parse(value[3] + value[4]);
                  if (minutes > 59) return 'Enter Correct Event Time';
                  if (value[5] != " ") return 'Enter Correct Event Time';
                  String AMorPM = value[6] + value[7];
                  if (!(AMorPM == 'AM' || AMorPM == 'PM')) {
                    return 'Enter Correct Event Time';
                  } else
                    return null;
                } catch (e) {
                  return 'Enter Correct Event Time';
                }
              }
            },
            decoration: InputDecoration(
              hintText: 'Event Time(Format - HH:MM AM/PM)',
              fillColor: Colors.grey[100],
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink, width: 2.0),
              ),
            ),
            onChanged: (value) {
              setState(() {
                curr_time = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            color: Colors.red,
            onPressed: () async {
              if (_formkey.currentState!.validate()) {
                widget.dataBase!.updateData(
                    date: curr_date, desc: curr_desc, time: curr_time);
                Navigator.pop(context);
              }
            },
            child: Text(
              'Create Event',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
