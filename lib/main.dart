import "package:flutter/material.dart";
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
    });
    _totalScore += score;
  }

  @override
  Widget build(BuildContext context) {
    // compile time constant
    // here 2nd const is for constant values
    // we can also write it as
    // var _questions = const [...]
    // but in this case we can do also question = []
    // It means that we are overwriting questio object
    const _questions = const [
      {
        'question': 'What you like the most?',
        'answers': [
          {'text': 'coding', 'score': 10},
          {'text': 'playing', 'score': 5},
          {'text': 'watching movies', 'score': 2},
          {'text': 'fishing', 'score': 8}
        ],
      },
      {
        'question': 'what\'s your favourate color?',
        'answers': [
          {'text': 'red', 'score': 10},
          {'text': 'blue', 'score': 2},
          {'text': 'green', 'score': 5},
          {'text': 'purple', 'score': 8}
        ],
      },
      {
        'question': 'What is your favourate language?',
        'answers': [
          {'text': 'c++', 'score': 10},
          {'text': 'python', 'score': 8},
          {'text': 'dart', 'score': 5},
          {'text': 'java', 'score': 1}
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
  // return MaterialApp(home: Text("Hello!"),);
}
