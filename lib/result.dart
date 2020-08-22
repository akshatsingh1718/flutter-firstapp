import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You did it';
    if (totalScore <= 8) {
      resultText =
          'You have to get more scores. Your score is ' + totalScore.toString();
    } else if (totalScore <= 15) {
      resultText = 'You have to get little more scores. Your score is ' +
          totalScore.toString();
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            onPressed: resetHandler,
            color: Colors.yellowAccent,
            textColor: Colors.red,
            child: Text('Reset Quiz!'),
          ),
        ],
      ),
    );
  }
}
