import 'package:flutter/material.dart';
import 'package:news_app/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white),
      ),
      home: HomePage(),
    );
  }
}
