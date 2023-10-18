// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_type_mbti/home.dart';
import 'package:your_type_mbti/results.dart';
import 'package:your_type_mbti/util/app_color.dart';
import 'package:your_type_mbti/util/app_textstyle.dart';
import 'package:your_type_mbti/widget/app_result_detail.dart';

class ResultPage extends StatefulWidget {
  ResultPage({super.key, required this.typeScoreList});

  List<List<int>> typeScoreList;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String result = "";

  List<List<String>> type = [
    ["E", "I"],
    ["S", "N"],
    ["T", "F"],
    ["J", "P"]
  ];

  int findMbti(List<List<int>> typeScoreList) {
    // print("findmbti.typescorelist : $typeScoreList");
    var result = getResult(typeScoreList);
    print("RESULT = $result");
    int idx = 0;
    for (int i = 0; i < Results.mbtiResults.length; i++) {
      if (Results.mbtiResults[i]["type"] == result) {
        // print("findMbti.type = ${Results.mbtiResults[i]["type"]}");
        idx = i;
        break;
      }
    }
    print("findmbti.idx = $idx");
    return idx;
  }

  // 사용자의 최종 결과 타입
  String getResult(List<List<int>> typeScoreList) {
    if (result.length != 0) {
      result = "";
    }

    for (int i = 0; i < typeScoreList.length; i++) {
      int scoreA = typeScoreList[i][0];
      int scoreB = typeScoreList[i][1];

      if (scoreA > scoreB) {
        result += type[i][0];
      }
      if (scoreA < scoreB) {
        result += type[i][1];
      }
      if (scoreA == scoreB) {
        int idx = Random().nextInt(2);
        result += type[i][idx];
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    int typeIdx = findMbti(widget.typeScoreList);
    print("typeIdx = $typeIdx");
    print("description = ${Results.mbtiResults[typeIdx]['description']}");

    String description = Results.mbtiResults[typeIdx]["description"];
    List<String> weaknesses = Results.mbtiResults[typeIdx]["weaknesses"];
    List<String> characteristics =
        Results.mbtiResults[typeIdx]["characteristics"];

    Map<String, dynamic> desc = Results.mbtiResults[typeIdx]["desc"][0];

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Results.mbtiResults[typeIdx]["type"] ?? "MBTI",
              textAlign: TextAlign.center,
              style: AppTextstyle.koPtBold45(),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              Results.mbtiResults[typeIdx]["img"] ?? 'assets/images/ENTP.png',
              width: 250,
            ),
            Padding(
                padding: const EdgeInsets.all(40.0),
                child: ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBulletText(desc["desc1"]),
                      _buildBulletText(desc["desc2"]),
                      _buildBulletText(desc["desc3"]),
                      _buildBulletText(desc["desc4"]),
                    ],
                  ),
                )
                // child: ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   // itemCount: Results.mbtiResults[typeIdx]["desc"].length,
                //   itemCount: 1,
                //   itemBuilder: (context, index) {
                //
                //     Map<String, dynamic> desc =
                //         Results.mbtiResults[typeIdx]["desc"][0];

                //     return ListTile(
                //       subtitle: Column(
                //         children: [
                //           _buildBulletText(desc["desc1"]),
                //           _buildBulletText(desc["desc2"]),
                //           _buildBulletText(desc["desc3"]),
                //           _buildBulletText(desc["desc4"]),
                //         ],
                //       ),
                //     );
                //   },
                // ),
                ),
            AppResultDetail(
              description: description,
              weaknesses: weaknesses
                  .map((characteristic) => '• $characteristic')
                  .join('\n\n'),
              characteristics: characteristics
                  .map((characteristic) => '• $characteristic')
                  .join('\n\n'),
            ),
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
      Text(
        text,
        // softWrap: true,
      ),
    ],
  );
}
