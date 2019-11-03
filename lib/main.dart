import 'package:flutter/material.dart';
import './card.dart';
import './addRemove.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Caculator',
      theme: ThemeData.dark().copyWith(
          sliderTheme: SliderThemeData(
              activeTrackColor: Colors.red[900],
              thumbColor: Colors.red[900],
              inactiveTrackColor: Colors.grey[500])),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // String gender;
  double height = 130;
  int weight = 0;
  int age = 0;
  String gender = 'male';

  void selectGender(value) {
    setState(() {
      gender = value;
    });
  }

  Widget renderGender() {
    return Expanded(
      flex: 1,
      child: Row(
        children: <Widget>[
          Expanded(
            child: DSCard(
              color: gender == 'male' ? Color(0xFF222222) : Color(0xFEEEEEE),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                onPressed: () {
                  selectGender('male');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.accessibility, size: 100),
                    Text("Male", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: DSCard(
              color: gender == 'female' ? Color(0xFF222222) : Color(0xFEEEEEE),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                onPressed: () {
                  selectGender('female');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.accessibility, size: 100),
                    Text(
                      "Female",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  heightController(value) {
    setState(() {
      height = value;
    });
  }

  void weightController(String type) {
    setState(() {
      if (type == 'increase') {
        weight++;
      } else if (type == 'decrease' && weight > 0) {
        weight--;
      }
    });
  }

  void ageController(String type) {
    setState(() {
      if (type == 'increase') {
        age++;
      } else if (type == 'decrease' && age > 0) {
        age--;
      }
    });
  }

  Widget renderHeight() {
    return Expanded(
      flex: 1,
      child: DSCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Height"),
            Text("${height.floor()}cm",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            Slider(
              min: 130,
              max: 250,
              value: height,
              divisions: 250,
              onChanged: (value) => heightController(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderWeightAge() {
    return Expanded(
      flex: 1,
      child: Row(
        children: <Widget>[
          Expanded(
            child: DSCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Weight",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  AddRemove(weightController, weight)
                ],
              ),
            ),
          ),
          Expanded(
            child: DSCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Age",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  AddRemove(ageController, age)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Caculator")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              renderGender(),
              renderHeight(),
              renderWeightAge(),
              RaisedButton(
                  child: Text("CALCULATE"),
                  onPressed: () {
                    // add caculation
                    double bmi = weight / (height * height) * 10000;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(bmi)));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
