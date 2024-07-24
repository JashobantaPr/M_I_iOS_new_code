import 'package:get/get.dart';

class MyScoreCardController extends GetxController {
  // Map to store selected answers for each question
  var selectedAnswerMap = {}.obs;

  void selectAnswer(String question, String answer) {
    selectedAnswerMap[question] = answer;
  }
}
