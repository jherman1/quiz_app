import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/flutter_questions.dart';
import 'package:quiz_app/results_screen.dart';

import 'package:quiz_app/data/quiz_option.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  QuizOption activeQuiz =
      QuizOption.values[0]; //initializes to first quiz (flutter)

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseQuiz(QuizOption quiz) {
    // selectedQuiz = quizOptions.singleWhere((option) => option['quiz_name'] == quiz);
    activeQuiz = quiz;
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(
      () {
        selectedAnswers = [];
        activeScreen = 'questions-screen';
      },
    );
  }

  void returnHome() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(
        startQuiz: switchScreen,
        quizOptions: QuizOption.values,
        onSelectQuiz: chooseQuiz);

    if (activeScreen == 'questions-screen') {
      screenWidget =
          QuestionsScreen(activeQuiz: activeQuiz, onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        activeQuiz: activeQuiz,
        chosenAnswers: selectedAnswers,
        onRestartQuiz: restartQuiz,
        onReturnHome: returnHome,
      );
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 101, 43, 193),
            Color.fromARGB(255, 46, 15, 96)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        // child: activeScreen,
        child: screenWidget,
      )),
    );
  }
}
