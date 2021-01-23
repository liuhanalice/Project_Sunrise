import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "You did it!";
    if (resultScore >= 35) {
      resultText =
          "Great! You are awsome!\n\n Your Sunrise Score: $resultScore";
    } else if (resultScore >= 28) {
      resultText = "Not Bad! \n\n Your Sunrise Score: $resultScore";
    } else if (resultScore >= 20) {
      resultText =
          "Need some improvements! \n\n Your Sunrise Score: $resultScore";
    } else if (resultScore >= 11) {
      resultText =
          "It's time to notice your mental health! \n\n Your Sunrise Score: $resultScore";
    } else {
      resultText = "Attention needed! \n\n Your Sunrise Score: $resultScore";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            color: Colors.orange[300],
            onPressed: resetHandler,
            child: Text(
              "Restart Test",
              style: TextStyle(fontSize: 15),
            ),
            textColor: Colors.red[800],
          ),
        ],
      ),
    );
  }
}
