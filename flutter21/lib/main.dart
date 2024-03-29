import 'package:flutter/material.dart';
import 'package:flutter23/pages/gellery_page.dart';
import 'package:flutter23/pages/home_page.dart';
import 'package:flutter23/pages/photo_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Routes Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.nameRoute,
      routes: {
        HomePage.nameRoute: (context) => HomePage(),
        GalleryPage.nameRoute: (context) => GalleryPage(),
        PhotoPage.nameRoute: (context) => PhotoPage(),
      },
    );
  }
}
