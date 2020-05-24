import 'package:flutter/material.dart';


class Result extends StatelessWidget {

  final int resultScore;
  final Function resethandler;

  Result(this.resultScore,this.resethandler);

  String get resultPhrase{
    String resultText ;
    if(resultScore <= 8)
    {
      resultText = 'You Are Awesome And Innocent';
    } 
    else if(resultScore <= 12)
    {
      resultText = 'Pretty Likable!';
    }
    else if(resultScore <= 16)
    {
      resultText = 'You Are ... Strange?!';
    }
    else
    {
      resultText = 'YOu Are So bad!';
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
            style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
            FlatButton(child: Text('Restart Quiz!',),onPressed: resethandler,textColor: Colors.blue,),
        ],
      ),
    );
  }
}
