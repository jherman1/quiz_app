import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_option.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.activeQuiz,
      required this.chosenAnswers,
      required this.onRestartQuiz,
      required this.onReturnHome});

  final QuizOption activeQuiz;
  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;
  final void Function() onReturnHome;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': activeQuiz.questions[i].text,
        'correct_answer': activeQuiz.questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = activeQuiz.questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['correct_answer'] == data['user_answer'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestartQuiz,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh_outlined),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton.icon(
              onPressed: onReturnHome,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.home_sharp),
              label: const Text(
                'Return Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
