import 'package:flutter/material.dart';
import 'package:your_type_mbti/home.dart';
import 'package:your_type_mbti/results.dart';
import 'package:your_type_mbti/service/answer_service.dart';
import 'package:your_type_mbti/service/result.dart';
import 'package:your_type_mbti/util/app_color.dart';
import 'package:your_type_mbti/util/app_textstyle.dart';
import 'package:your_type_mbti/widget/app_result_detail.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  AnswerService answerService = AnswerService();
  int findMbti() {
    var typeScoreList = answerService.typeScoreList;
    var result = answerService.getResult(typeScoreList);
    print("RESULT = $result");
    int idx = 0;
    for (int i = 0; i < Results.mbtiResults.length; i++) {
      if (Results.mbtiResults[i]["type"] == result) {
        idx = i;
      }
    }
    return idx;
  }

  @override
  Widget build(BuildContext context) {
    int index = findMbti();
    print("INDEX = $index");
    print(Results.mbtiResults[index]['description']);

    String description = Results.mbtiResults[index]["description"];
    List<String> weaknesses = Results.mbtiResults[index]["weaknesses"];
    List<String> characteristics =
        Results.mbtiResults[index]["characteristics"];

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Results.mbtiResults[index]["type"] ?? "MBTI",
              textAlign: TextAlign.center,
              style: AppTextstyle.koPtBold45(),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              Results.mbtiResults[index]?["img"] ?? 'assets/images/ENTP.png',
              width: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Results.mbtiResults[index]["desc"].length,
                  itemBuilder: (context, index) {
                    var desc = Results.mbtiResults[index]["desc"][index];
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
      Text(text),
    ],
  );
}
