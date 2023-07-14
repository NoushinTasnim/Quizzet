import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizzet/constants.dart';
import 'package:quizzet/controller/quiz_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
        builder: (controller){
        return Center(
          child: CircularPercentIndicator(
            radius: 50,
            lineWidth: 15,
            percent: controller.animation.value,
            backgroundColor: Colors.white.withOpacity(0.0),
            arcBackgroundColor: Colors.white,
            arcType: ArcType.HALF,
            linearGradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.purple.shade300,
                ]
            ),
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              '${(controller.animation.value *kTimeout_time).round()} sec',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        );
      }
    );
  }
}
