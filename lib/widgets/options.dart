import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzet/controller/quiz_controller.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.text,
    required this.press,
    required this.index,
  });

  final String text;
  final VoidCallback press;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (qnController) {
        Color getRightColor(){
          if(qnController.isAnswered){
            if(index==qnController.correctAns){
              return Colors.purple;
            }
            else if(index == qnController.selectedAns &&
            qnController.selectedAns != qnController.correctAns){
              return Colors.red;
            }
          }
          return Colors.black.withOpacity(.75);
        }
        IconData getRightIcon(){
          return getRightColor() == Colors.red ? Icons.close : Icons.done;
        }
        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black26,
                width: 2,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: getRightColor() ==
                              Colors.black.withOpacity(.75)?
                          Colors.transparent: getRightColor(),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: getRightColor())
                      ),
                      child: Icon(
                          getRightColor() ==
                              Colors.black.withOpacity(.75)?
                          null : getRightIcon(), size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      text,
                      style: GoogleFonts.roboto(
                        color: getRightColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}