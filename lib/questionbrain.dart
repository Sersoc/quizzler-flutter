import 'package:quizzler/question.dart';

class Questionbrain {
  List<Question> _questions = [
    Question(
        questionText: 'Some cats are actually allergic to humans',
        questionAnswer: true),
    Question(questionText: 'You can lead a cow down stairs but not up stairs.',questionAnswer: false),
    Question(questionText: 'Approximately one quarter of human bones are in the feet.',questionAnswer:  true),
    Question(questionText:  'A slug\'s blood is green.',questionAnswer:  true),
    
  ];

  String getQuestion(int num){
    return _questions[num].questionText;
  }

  bool getResult(int num,bool answer){
    return _questions[num].questionAnswer == answer;
  }
  int getLength(){
    return _questions.length;
  }
}
