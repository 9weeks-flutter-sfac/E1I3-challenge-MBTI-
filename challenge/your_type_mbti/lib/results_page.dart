// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:your_type_mbti/home.dart';
import 'package:your_type_mbti/results.dart';
import 'package:your_type_mbti/util/app_color.dart';
import 'package:your_type_mbti/util/app_textstyle.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int currentIndex = 0;
  // var data = Results.mbtiResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Results.mbtiResults[currentIndex]?["type"] ?? "MBTI",
              textAlign: TextAlign.center,
              style: AppTextstyle.koPtBold45(),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              Results.mbtiResults[currentIndex]?["img"] ??
                  'assets/images/ENTP.png',
              width: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Results.mbtiResults[currentIndex]["desc"].length,
                  itemBuilder: (context, index) {
                    var desc = Results.mbtiResults[currentIndex]["desc"][index];
                    return ListTile(
                        subtitle: Column(
                      children: [
                        _buildBulletText(desc["desc1"]),
                        _buildBulletText(desc["desc2"]),
                        _buildBulletText(desc["desc3"]),
                        _buildBulletText(desc["desc4"]),
                      ],
                    ));
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context){
                    return Container(
                      height: 200,
                color: Colors.amber,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Modal BottomSheet'),
                        ElevatedButton(
                          child: const Text('닫기'),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColor.pinkRed,
                  // primary: Color(0xFFF7797D),
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Container(
                  width: 180,
                  height: 54,
                  child: Center(
                    child: Text(
                      "자세히 보기",
                      textAlign: TextAlign.center,
                      style: AppTextstyle.koPtSemiBold20(color: Colors.white),
                    ),
                  ),
                )),
                const SizedBox(
                  height: 10,
                ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColor.pinkRed,
                  // primary: Color(0xFFF7797D),
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Container(
                  width: 180,
                  height: 54,
                  child: Center(
                    child: Text(
                      "다시하기",
                      textAlign: TextAlign.center,
                      style: AppTextstyle.koPtSemiBold20(color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}

Widget _buildBulletText(String text) {
  return Row(
    children: [
      Icon(Icons.arrow_right),
      SizedBox(width: 8),
      Text(text),
    ],
  );
}
