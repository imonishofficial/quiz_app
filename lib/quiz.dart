import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_prj/data/questions.dart';
import 'package:quiz_prj/question_screen.dart';
import 'package:quiz_prj/start_screen.dart';
import 'package:quiz_prj/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start';

  void switchScreen() {
    setState(() {
      activeScreen = 'question';
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      activeScreen = 'result';
    }
  });
  }
  void restartQuiz() {
  setState(() {
    selectedAnswers = [];
    activeScreen = 'start';
  });
}


  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers,onRestart:restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz Time",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w900),
          ),
          backgroundColor: const Color.fromARGB(255, 109, 2, 190),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 83, 17, 163),
                const Color.fromARGB(255, 151, 39, 212),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
