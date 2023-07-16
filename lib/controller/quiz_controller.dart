import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quizzet/constants.dart';
import 'package:quizzet/view/score_board.dart';

import '../models/question.dart';

class QuizController extends GetxController
with GetSingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;

  List<Question> _questions = sample_data;

  List<Question> get questions => this._questions;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  int _numOfAns = 0;
  int get numOfAns => this._numOfAns;

  @override
  void onInit() {
    _animationController = AnimationController(duration: Duration(seconds: kTimeout_time),vsync: this);
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController)
        ..addListener(() {
          update();
         });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex){
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if(_correctAns == _selectedAns)
      _numOfCorrectAns++;

    print(_numOfCorrectAns);

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 2), (){
      _numOfAns++;
     nextQuestion();
    });
  }

  void nextQuestion() {
    if(_questionNumber.value != _questions.length){
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.easeInCubic);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    }
    else{
      Get.to(ScoreBoard());
    }
  }

  void updateQuesNum(int index){
    _questionNumber.value = index + 1;
  }
}