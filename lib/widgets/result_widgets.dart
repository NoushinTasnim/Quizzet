
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/quiz_controller.dart';

class resultWidgets extends StatelessWidget {
  const resultWidgets({
    super.key,
    required QuizController quizController,
    required this.text,
    required this.col,
    required this.text1,
  }) : _quizController = quizController;

  final QuizController _quizController;
  final String text;
  final String text1;
  final Color col;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.95),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0,2),
            color: Colors.black.withOpacity(0.5),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: GoogleFonts.roboto(
              fontSize: 36,
              color: col,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            text,
            style: GoogleFonts.robotoMono(
              fontSize: 14,
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
