import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/quiz_controller.dart';

AppBar buildAppBar(QuizController _questionController) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      MaterialButton(
        onPressed: (){
          _questionController.nextQuestion();
        },
        child: Text(
          'Skip',
          style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    ],
  );
}