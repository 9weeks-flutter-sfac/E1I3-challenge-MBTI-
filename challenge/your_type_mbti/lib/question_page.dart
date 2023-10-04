import 'package:flutter/material.dart';
import 'package:your_type_mbti/questions.dart';
import 'package:your_type_mbti/service/answer_service.dart';
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

  int totalPage() {
    return Questions.mbtiQuestions.length;
  }

  AnswerService answerService = AnswerService();

  void nextPage() {
    if (currentPage < totalPage() - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
      setState(() {
        currentPage++;
      });
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
                    Text(Questions.mbtiQuestions[index]['num'], style: AppTextstyle.koPtBold36(),),
                    SizedBox(
                      width: 5,
                    ),
                    Center(child: Text('/${Questions.mbtiQuestions.length}', style: AppTextstyle.koPtBold20()))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(Questions.mbtiQuestions[index]['question'], style: AppTextstyle.koPtRegular20(),),
                const SizedBox(
                  height: 30,
                ),
                AppElevatedButton(
                  onPressed: () {
                    nextPage();
                  },
                  options: Questions.mbtiQuestions[index]['options'][0]['a'],
                ),
                AppElevatedButton(
                  onPressed: () {
                    nextPage();
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