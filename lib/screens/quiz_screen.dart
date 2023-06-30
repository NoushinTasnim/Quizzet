import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../controller/quiz_controller.dart';
import '../widgets/progress_bar.dart';
import '../widgets/question_answer.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizController _questionController = Get.put(QuizController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
      ),
      body: Container(
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
              padding: EdgeInsets.all(16),
              child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProgressBar(),
                      SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: PageView.builder(
                          // Block swipe to next qn
                          physics: NeverScrollableScrollPhysics(),
                          controller: _questionController.pageController,
                          onPageChanged: _questionController.updateQuesNum,
                          itemBuilder: (context, index) => QuestionAnswerCard(
                            question: _questionController.questions[index],
                            ques_no: index + 1,
                            total_ques: _questionController.questions.length,
                          ),
                          itemCount: _questionController.questions.length,
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}