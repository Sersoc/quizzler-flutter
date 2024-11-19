import 'package:flutter/material.dart';
import 'package:quizzler/questionbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Questionbrain questions = new Questionbrain();
void main() => runApp(Quizzler());


class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

Expanded CheckAnswer(bool answer) {
  Icon reIcon;
  if (answer) {
    reIcon = Icon(
      Icons.check,
      color: Colors.green,
    );
  } else {
    reIcon = Icon(
      Icons.close,
      color: Colors.red,
    );
  }
  return Expanded(child: reIcon);
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeeper = [];
  // List<String> questions = <String>[
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answers = <bool>[
  //   false,
  //   true,
  //   true,
  // ];
  void EndGame(){
    scoreKeeeper.clear();
    Alert(
      context: context,
      type: AlertType.error,
      title: "RFLUTTER ALERT",
      desc: "Ended!!",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions.getQuestion(num),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  scoreKeeeper.add(CheckAnswer(questions.getResult(num, true)));
                  if (num + 1 >= questions.getLength()) {
                    EndGame();
                    num = 0;
                  } else {
                    num++;
                  }
                });

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
  
                  scoreKeeeper
                      .add(CheckAnswer(questions.getResult(num, false)));
                  if (num + 1 >= questions.getLength()) {
                    EndGame();
                    num = 0;
                  } else {
                    num++;
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
