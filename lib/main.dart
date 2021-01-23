import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // can be rebuild

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // stay still

  final _questions = const [
    {
      "questionText": "1. How are you feeling today physically?",
      "answers": [
        {"text": "Amazing", "score": 10},
        {"text": "Great", "score": 8},
        {"text": "Alright", "score": 6},
        {"text": "Meh", "score": 4},
        {"text": "Not Great", "score": 2},
        {"text": "Terrible...", "score": 0}
      ],
    },
    {
      "questionText": "2. How are you feeling today mentally?",
      "answers": [
        {"text": "Amazing", "score": 10},
        {"text": "Great", "score": 8},
        {"text": "Alright", "score": 6},
        {"text": "Meh", "score": 4},
        {"text": "Not Great", "score": 2},
        {"text": "Terrible...", "score": 0}
      ],
    },
    {
      "questionText": "3. Did you eat and drink well today?",
      "answers": [
        {"text": "Yes", "score": 10},
        {"text": "OK", "score": 5},
        {"text": "No", "score": 0},
      ],
    },
    {
      "questionText": "4. How did you sleep?",
      "answers": [
        {"text": "Amazing", "score": 10},
        {"text": "Great", "score": 8},
        {"text": "Alright", "score": 6},
        {"text": "Meh", "score": 4},
        {"text": "Not Great", "score": 2},
        {"text": "Terrible...", "score": 0}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionIndex += 1;
    });
    //print("Answer Chosen");
    if (_questionIndex < _questions.length) {
      //print("more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Project Sunrise"),
          backgroundColor: Colors.red[700],
        ),
        body: _questionIndex < _questions.length
            ? Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "How are you?\nTake 1 minute to reflect on your day!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange[700],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Quiz(
                        answerQuestion: _answerQuestion,
                        questions: _questions,
                        questionIndex: _questionIndex),
                  ],
                ),
              )
            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
