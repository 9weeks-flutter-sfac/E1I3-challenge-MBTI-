import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_type_mbti/service/questions.dart';
import 'package:your_type_mbti/results_page.dart';
import 'package:your_type_mbti/util/app_textstyle.dart';
import 'package:your_type_mbti/widget/app_elevated_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  PageController pageController = PageController();
  int currentPage = 0;
  int typeNum = 0;

  int totalPage() {
    return Questions.mbtiQuestions.length;
  }

  List<List<int>> typeScoreList = [
    [0, 0], // E-I
    [0, 0], // S-N
    [0, 0], // T-F
    [0, 0], // J-P
  ];

  void plusScore(String selectAnswer, int questionNum) {
    // 어떤 타입 문항인지 찾기
    typeNum = getQuestionType(questionNum);

    if (selectAnswer == "a") {
      typeScoreList[typeNum][0]++;
    }
    if (selectAnswer == "b") {
      typeScoreList[typeNum][1]++;
    }
  }

  // 어떤 타입을 가르는 문항인지 확인
  int getQuestionType(int questionNum) {
    if (questionNum <= 7) {
      if (questionNum == 1) {
        typeNum = 0;
      }
      if (questionNum == 2 || questionNum == 3) {
        typeNum = 1;
      }
      if (questionNum == 4 || questionNum == 5) {
        typeNum = 2;
      }
      if (questionNum == 6 || questionNum == 6) {
        typeNum = 3;
      }
    } else {
      if (questionNum % 7 == 1) {
        typeNum = 0;
      }
      if (questionNum % 7 == 2 || questionNum % 7 == 3) {
        typeNum = 1;
      }
      if (questionNum % 7 == 4 || questionNum % 7 == 5) {
        typeNum = 2;
      }
      if (questionNum % 7 == 6 || questionNum % 7 == 0) {
        typeNum = 3;
      }
    }
    return typeNum;
  }

  void nextPage(List<List<int>> typeScoreList) {
    if (currentPage < totalPage() - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
      setState(() {
        currentPage++;
      });
    } else {
      // 현재 페이지가 마지막 페이지일 때 결과 페이지로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPage(
                typeScoreList:
                    typeScoreList)), // ResultPage는 결과 페이지의 이름으로 변경해야 함
      );
    }
  }

// void pageNumber(){
//   Questions.mbtiQuestions[index]['number'];
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Question ${currentPage + 1} / ${totalPage()}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView.builder(
          itemCount: Questions.mbtiQuestions.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Questions.mbtiQuestions[index]['num'],
                      style: AppTextstyle.koPtBold36(),
                    ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Center(
                        child: Text('  / ${Questions.mbtiQuestions.length}',
                            style: AppTextstyle.koPtBold20()))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Questions.mbtiQuestions[index]['question'],
                  style: AppTextstyle.koPtRegular20(),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppElevatedButton(
                  onPressed: () {
                    setState(() {
                      plusScore("a", index + 1);

                      print(typeScoreList);
                    });
                    nextPage(typeScoreList);
                  },
                  options: Questions.mbtiQuestions[index]['options'][0]['a'],
                ),
                AppElevatedButton(
                  onPressed: () {
                    setState(() {
                      plusScore("b", index + 1);

                      print(typeScoreList);
                    });

                    nextPage(typeScoreList);
                  },
                  options: Questions.mbtiQuestions[index]['options'][1]['b'],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
