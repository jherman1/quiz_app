import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_select_dropdown.dart';
import 'package:quiz_app/data/quiz_option.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
      {super.key,
      required this.startQuiz,
      required this.quizOptions,
      required this.onSelectQuiz});

  final void Function() startQuiz;
  final List<QuizOption> quizOptions;
  final void Function(QuizOption quiz) onSelectQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Quiz App powered by Flutter!',
            style: GoogleFonts.lato(
                fontSize: 24, color: const Color.fromARGB(255, 177, 137, 222)),
          ),
          const SizedBox(height: 30),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          QuizSelectDropdown(
              quizOptions: quizOptions, onSelectQuiz: onSelectQuiz),
          const SizedBox(height: 100),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
