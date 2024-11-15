import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_option.dart';

class QuizSelectDropdown extends StatefulWidget {
  const QuizSelectDropdown(
      {super.key, required this.quizOptions, required this.onSelectQuiz});

  final List<QuizOption> quizOptions;
  final void Function(QuizOption quiz) onSelectQuiz;

  @override
  State<QuizSelectDropdown> createState() {
    return _QuizSelectDropdownState();
  }
}

class _QuizSelectDropdownState extends State<QuizSelectDropdown> {
  void chooseQuiz(QuizOption quiz) {
    widget.onSelectQuiz(quiz);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      label: const Text('Quiz'),
      onSelected: (option) {
        chooseQuiz(option);
      },
      dropdownMenuEntries: widget.quizOptions.map<DropdownMenuEntry>(
        (QuizOption option) {
          return DropdownMenuEntry(value: option, label: option.name);
        },
      ).toList(),
    );
  }
}
