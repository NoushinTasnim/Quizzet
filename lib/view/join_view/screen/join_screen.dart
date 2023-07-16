import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzet/constants.dart';
import 'package:quizzet/view/quiz_screen.dart';
import '../../../models/question.dart';
import '../widget/inc_dec_btn.dart';
import '../widget/per_ques_time.dart';

class JoinScreen extends StatefulWidget {
  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  String displayName = '';
  int numOfQuestions = 20;
  bool isLoading = false; // Added isLoading flag

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: kbgBoxDeco,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 2,
                ),
                Text(
                  'Let\'s Play Quiz',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter Your Name Below',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                TextField(
                  style: GoogleFonts.robotoMono(
                      color: Colors.black, fontSize: 16),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white54,
                    hintText: 'Display Name',
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (val) {
                    displayName = val;
                  },
                ),
                Spacer(),
                PerQuesTime(),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IncDecBtnWidget(
                        onTap: () {
                          setState(() {
                            if (numOfQuestions > 10) numOfQuestions -= 5;
                          });
                        },
                        icon: Icons.remove,
                      ),
                      Text(
                        "$numOfQuestions Questions",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IncDecBtnWidget(
                        onTap: () {
                          setState(() {
                            if (numOfQuestions < 50) numOfQuestions += 5;
                          });
                        },
                        icon: Icons.add,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: kBtnDec,
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          isLoading =
                          true; // Set isLoading to true when fetching data
                        });

                        await fetchTriviaData(numOfQuestions);

                        setState(() {
                          isLoading =
                          false; // Set isLoading to false after fetching data
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Start Quiz',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                if(isLoading)
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.purple.withOpacity(0.2),
                      color: Colors.white,
                    ),
                  ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}