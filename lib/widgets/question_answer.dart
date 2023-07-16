import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzet/models/question.dart';
import '../controller/quiz_controller.dart';
import 'options.dart';
import 'question_card.dart';

class QuestionAnswerCard extends StatelessWidget {
  const QuestionAnswerCard({
    super.key,
    required this.question,
    required this.ques_no,
    required this.total_ques,
  });

  final Question question;
  final int ques_no;
  final int total_ques;

  @override
  Widget build(BuildContext context) {
    QuizController _controller = Get.put(QuizController());
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            bottom: 16,
            right: 16,
            left: 16,
            top: 50
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QuestionCard(
              question: question,
              ques_no: ques_no,
              total_ques: total_ques,),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ...List.generate(
                    question.options.length,
                        (index) => Option(
                            index: index,
                            text: question.options[index],
                            press: () => _controller.checkAns(question, index)
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}