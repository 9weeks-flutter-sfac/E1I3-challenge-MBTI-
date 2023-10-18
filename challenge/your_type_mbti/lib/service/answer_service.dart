// import 'dart:math';

// class AnswerService {
//   int questionNum = 0; // 매개변수로 받기
//   int typeNum = 0;

//   String result = "";
//   // String selectAnswer = "";

//   List<List<String>> type = [
//     ["E", "I"],
//     ["S", "N"],
//     ["T", "F"],
//     ["J", "P"]
//   ];

//   // 각 리스트의 인덱스 0과 1은 각 타입의 a와 b의 점수
//   List<List<int>> typeScoreList = [
//     [0, 0], // E-I
//     [0, 0], // S-N
//     [0, 0], // T-F
//     [0, 0], // J-P
//   ];

//   String secondResult = "";

//   void plusScore(String selectAnswer, int questionNum) {
//     // 어떤 타입 문항인지 찾기
//     typeNum = getQuestionType(questionNum);

//     if (selectAnswer == "a") {
//       typeScoreList[typeNum][0]++;
//     }
//     if (selectAnswer == "b") {
//       typeScoreList[typeNum][1]++;
//     }
//   }

//   // 어떤 타입을 가르는 문항인지 확인
//   int getQuestionType(int questionNum) {
//     if (questionNum <= 7) {
//       if (questionNum == 1) {
//         typeNum = 0;
//       }
//       if (questionNum == 2 || questionNum == 3) {
//         typeNum = 1;
//       }
//       if (questionNum == 4 || questionNum == 5) {
//         typeNum = 2;
//       }
//       if (questionNum == 6 || questionNum == 6) {
//         typeNum = 3;
//       }
//     } else {
//       if (questionNum % 7 == 1) {
//         typeNum = 0;
//       }
//       if (questionNum % 7 == 2 || questionNum % 7 == 3) {
//         typeNum = 1;
//       }
//       if (questionNum % 7 == 4 || questionNum % 7 == 5) {
//         typeNum = 2;
//       }
//       if (questionNum % 7 == 6 || questionNum % 7 == 0) {
//         typeNum = 3;
//       }
//     }

//     return typeNum;
//   }

//   // 사용자의 최종 결과 타입
//   String getResult(List<List<int>> typeScoreList) {
//     if (result.length != 0) {
//       result = "";
//     }

//     for (int i = 0; i < typeScoreList.length; i++) {
//       int scoreA = typeScoreList[i][0];
//       int scoreB = typeScoreList[i][1];

//       if (scoreA > scoreB) {
//         result += type[i][0];
//       }
//       if (scoreA < scoreB) {
//         result += type[i][1];
//       }
//       if (scoreA == scoreB) {
//         int idx = Random().nextInt(2);

//         result += type[i][idx];
//       }
//     }

//     return result;
//   }
// }
