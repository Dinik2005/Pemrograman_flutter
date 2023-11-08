import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Comparison',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now;

  Future<void> _showMaterialDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _showCupertinoDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 200,
          child: CupertinoDatePicker(
            initialDateTime: selectedDate,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                selectedDate = newDateTime;
              });
            },
          ),
        );
      },
    );
  }

  _showMaterialAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Material Alert'),
          content: Text('This is a Material Design Alert Dialog.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  _showCupertinoAlertDialog() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Cupertino Alert'),
          content: Text('This is a Cupertino Design Alert Dialog.'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Design Comparison'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selected Date: ${selectedDate.toLocal()}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showMaterialDatePicker,
              child: Text('Material Date Picker'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showCupertinoDatePicker,
              child: Text('Cupertino Date Picker'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showMaterialAlertDialog,
              child: Text('Material Alert Dialog'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showCupertinoAlertDialog,
              child: Text('Cupertino Alert Dialog'),
            ),
          ],
        ),
     ),
);
}
}
