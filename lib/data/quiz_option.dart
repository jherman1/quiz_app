import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/data/flutter_questions.dart' as flutter_questions;
import 'package:quiz_app/data/movie_questions.dart' as movie_questions;

enum QuizOption {
  flutter('Flutter Quiz', flutter_questions.questions),
  movie('Movie Quiz', movie_questions.questions);

  const QuizOption(this.name, this.questions);
  final String name;
  final List<QuizQuestion> questions;
}
