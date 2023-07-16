import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/quiz_controller.dart';
import '../widgets/app_bar.dart';
import '../widgets/body_widget.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizController _questionController = Get.put(QuizController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(_questionController),
      body: bodyWidget(questionController: _questionController),
    );
  }
}