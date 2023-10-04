import 'package:flutter/material.dart';
import 'package:your_type_mbti/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PretendardRegular'),
      home: HomePage(),
    );
  }
}
