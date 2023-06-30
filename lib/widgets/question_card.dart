import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzet/controller/quiz_controller.dart';
import 'package:quizzet/models/question.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(2, 3), // changes the position of the shadow
          ),
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Question ${ques_no}',
                      style: GoogleFonts.robotoMono(
                        color: Colors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '/${total_ques}',
                      style: GoogleFonts.robotoMono(
                        color: Colors.purple,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.5,
                  color: Colors.black54,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoMono(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}