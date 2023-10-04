class AnswerService {
  int questionNum = 0; // 매개변수로 받기
  int typeNum = 0;
  int a = 0; // 매개변수로 받기
  int b = 0; // 매개변수로 받기
  String resultTypeN = "";
  String resultType = "";
  String selectAnswer = "";

  List<List<String>> type = [
    ["E", "I"],
    ["S", "N"],
    ["T", "F"],
    ["J", "P"]
  ];

  // 각 리스트의 인덱스 0과 1은 각 타입의 a와 b의 점수
  var typeScoreList = [
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
  ];

  void plusScore() {
    var typeNum = getType(questionNum);

    if (selectAnswer == "a") {
      typeScoreList[typeNum][0]++;
    }
    if (selectAnswer == "b") {
      typeScoreList[typeNum][1]++;
    }
  }

  // 어떤 타입을 가르는 문항인지 확인
  int getType(int questionNum) {
    if (questionNum % 7 == 1) {
      typeNum = 1;
    }
    if (questionNum % 7 == 2 || questionNum % 7 == 3) {
      typeNum = 2;
    }
    if (questionNum % 7 == 4 || questionNum % 7 == 5) {
      typeNum = 3;
    }
    if (questionNum % 7 == 6 || questionNum % 7 == 7) {
      typeNum = 4;
    }
    return typeNum;
  }

  // 사용자의 선택을 토대로 어떤 타입 값인지 산출
  void getTypeValue(int a, int b, String resultTypeN, List<List<String>> type,
      int typeNum, String resultType) {
    if (a > b) {
      resultTypeN = type[typeNum][1];
    } else if (b > a) {
      resultTypeN = type[typeNum][2];
    } else if (a == b) {
      resultType = "동점";
    }

    print("TYPE은 $resultTypeN");

    //e+s+t+p 식으로 합쳐준다.
    resultType += resultTypeN;

    print("지금까지 결과는 $resultType");
  }
}
