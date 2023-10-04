import 'package:flutter/material.dart';
import 'package:your_type_mbti/question_page.dart';

void main() {
  runApp(const MyApp());
  int idx = 8;
  String resultType1 = "";
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  int e = 0;
  int f = 0;

  // return a++;
  // return b++;


  var type = [
    {
      "type1": ["e", "i"]
    },
    {
      "type2": ["s", "n"]
    },
    {
      "type3": ["t", "f"]
    },
    {
      "type4": ["j", "p"]
    }
  ];

  if (idx % 7 == 2 || idx % 7 == 3) {
    int typeNum = 0;
    int typeNIdx = 0;
    if (a>b) {
      typeNIdx = 1;
    } else {typeNIdx = 2;}
    resultType1 = type[][typeNIdx];

  }

  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PretendardRegular'),
      home: QuestionPage(),
    );
  }
}
