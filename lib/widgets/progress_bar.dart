import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzet/constants.dart';
import 'package:quizzet/controller/quiz_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.white30,
          width: 2,
        ),
      ),
      child: GetBuilder<QuizController>(
        init: QuizController(),
        builder: (controller) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    alignment: Alignment.centerRight,
                    width: constraints.maxWidth*controller.animation.value,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.purple,
                          Colors.purpleAccent,
                        ],
                      ),
                      border: Border.all(
                        color: Colors.purpleAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${(controller.animation.value *kTimeout_time).round()} sec',
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Lottie.asset(
                        'images/timer.json',
                        width: 25,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
