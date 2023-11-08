import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DateTime _selectDate;

  void _setState(DateTime date) {
    setState(() {
      _selectDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Date Picker"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              _selectDate != null ? _selectDate.toString() : 'Select Date',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: _selectDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                    selectableDayPredicate: (day) {
                      return day.isBefore(DateTime.now().subtract(Duration(
                        days: 2,
                      )));
                    },
                  ).then((value) {
                    if (value != null) {
                      _setState(value);
                    }
                  });
                }),
          ]),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DateTime>('_selectDate', _selectDate));
  }
}
