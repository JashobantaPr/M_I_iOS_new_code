import 'package:incentivesgit/core/app_export.dart';

class GeneralKnowledgeController extends GetxController {
  var currentQuestionIndex = 0.obs;
  var selectedAnswer = ''.obs;

  List<String> questions = [
    'Q1. Pandit Vishwa Mohan Bhatt, who has won the prestigious \'Grammy Awards\' is an exponent in which of the following musical instruments?',
    'Q2. What is the capital of France?',
    // Add more questions here...
  ];

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswer.value = '';
    }
  }

  void selectAnswer(String answer) {
    selectedAnswer.value = answer;
  }

   bool get isLastQuestion => currentQuestionIndex.value == questions.length - 1;
}
