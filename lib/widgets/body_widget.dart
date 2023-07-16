import 'package:flutter/material.dart';
import 'package:quizzet/widgets/progress_bar.dart';
import 'package:quizzet/widgets/question_answer.dart';

import '../constants.dart';
import '../controller/quiz_controller.dart';

class bodyWidget extends StatelessWidget {
  const bodyWidget({
    super.key,
    required QuizController questionController,
  }) : _questionController = questionController;

  final QuizController _questionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kbgBoxDeco,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Expanded(
                    child: PageView.builder(
                      // Block swipe to next qn
                      physics: NeverScrollableScrollPhysics(),
                      controller: _questionController.pageController,
                      onPageChanged: _questionController.updateQuesNum,
                      itemBuilder: (context, index) => QuestionAnswerCard(
                        question: _questionController.questions[index],
                        ques_no: index+1,
                        total_ques: _questionController.questions.length,
                      ),
                      itemCount: _questionController.questions.length,
                    ),
                  ),
                  ProgressBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}