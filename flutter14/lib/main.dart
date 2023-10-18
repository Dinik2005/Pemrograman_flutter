import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitur TextField"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              autocorrect: false, //membenarkan typo b.inggris
              autofocus: false, //meminta mengisi tanpa di klik
              enableSuggestions: true, // sama autocorrect
              enableInteractiveSelection: false, // utk paste kalimat yg di copy
              // enabled: false,//utk meng on/off
              // obscureText: true, //seperti password bulat2
              obscuringCharacter: '=', //menganti bulat2
              keyboardType: TextInputType.number, //utk nomor saja
              readOnly: false,//untuk memunculkan keyboard
              //readOnly: true,//untk mematikan keyboard
            ),
          ),
        ),
      ),
    );
  }
}
