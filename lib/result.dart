import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  ResultPage(this.bmi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Caculator")),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(10), child: Text("$bmi")),
      ),
    );
  }
}
