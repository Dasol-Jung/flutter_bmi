import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;
  Color _resultColor;

  ResultPage(this.bmi, this.result, this.interpretation) {
    if (result == 'Overweight')
      _resultColor = Colors.red[400];
    else if (result == 'Normal')
      _resultColor = Colors.green[600];
    else _resultColor = Colors.yellow[700];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Caculator")),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$bmi",
                      style: TextStyle(
                        fontSize: 100,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                        bottom: 50,
                      ),
                      child: Text(
                        "$result",
                        style: TextStyle(
                          fontSize: 35,
                          color: _resultColor,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "$interpretation",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight : FontWeight.w100
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80.0,
                child: RaisedButton(
                    color: Colors.red[900],
                    child: Text(
                      "GO BACK",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 8),
                    ),
                    onPressed: () {
                      // add caculation
                      Navigator.pop(context);
                    })),
          ],
        ),
      ),
    );
  }
}
