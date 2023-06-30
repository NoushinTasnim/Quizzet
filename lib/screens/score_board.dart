import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzet/controller/quiz_controller.dart';

import '../constants.dart';
import '../widgets/result_widgets.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    QuizController _quizController = Get.put(QuizController());
    print(_quizController.numOfCorrectAns);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kbgBoxDeco,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(60),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.25),
                  //borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(2,2),
                      color: Colors.purple.withOpacity(0.25),
                    )
                  ]
              ),
              child: Column(
                children: [
                  Text(
                    'Score',
                    style: GoogleFonts.robotoMono(
                      fontSize: 24,
                      color: Colors.white54,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${_quizController.numOfCorrectAns *10}/${_quizController.questions.length*10}',
                    style: GoogleFonts.robotoMono(
                        fontSize: 42,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: resultWidgets(
                        quizController: _quizController,
                        col: Colors.purple.withOpacity(0.9),
                        text1: '${_quizController.questions.length}',
                        text: 'Total Question',
                      ),
                    ),
                    Expanded(
                      child: resultWidgets(
                        quizController: _quizController,
                        col: Colors.black.withOpacity(0.7),
                        text1: '${((_quizController.numOfAns/ _quizController.questions.length)*100).toInt()}%',
                        text: 'Completation',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: resultWidgets(
                        quizController: _quizController,
                        col: Colors.green.withOpacity(0.9),
                        text1: '${_quizController.numOfCorrectAns}',
                        text: 'Correct',
                      ),
                    ),
                    Expanded(
                      child: resultWidgets(
                        quizController: _quizController,
                        col: Colors.red.withOpacity(0.9),
                        text1: '${_quizController.numOfAns - _quizController.numOfCorrectAns}',
                        text: 'Wrong',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}