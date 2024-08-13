import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary_row.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return QuestionsSummaryRow(data: data);
          }).toList(),
        ),
      ),
    );
  }
}
