import 'package:flutter/material.dart';
import './card.dart';
import './addRemove.dart';
import './result.dart';
import './bmiCalculator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  double height = 130.0;
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
            child: GestureDetector(
              onTap: () {
                selectGender('male');
              },
              child: DSCard(
                color: gender == 'male' ? Color(0xFF222222) : Color(0xFEEEEEE),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.mars, size: 100.0),
                    Text("Male", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                selectGender('female');
              },
              child: DSCard(
                color:
                    gender == 'female' ? Color(0xFF222222) : Color(0xFEEEEEE),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.venus, size: 100),
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
              divisions: 120,
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
      appBar: AppBar(
          title: Text(
        "BMI Caculator",
        style: TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.w500, letterSpacing: 6),
      )),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            renderGender(),
            renderHeight(),
            renderWeightAge(),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80.0,
              child: RaisedButton(
                  color: Colors.red[900],
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 8),
                  ),
                  onPressed: () {
                    // add caculation
                    BMICalculator calculator = BMICalculator(height : height, weight : weight);
                    String bmi = calculator.getBMI();
                    String result = calculator.getResult();
                    String interpretation = calculator.getInterpretation();
                       
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(bmi, result, interpretation)));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
