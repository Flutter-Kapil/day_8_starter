import 'package:day_8_starter/input_page.dart';
import 'package:flutter/material.dart';

const bmiRangeStyle = TextStyle(fontSize: 16, color: Colors.white70);
const resultCommentStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
);
const bmiStyle =
    TextStyle(fontSize: 70, color: Colors.white, fontWeight: FontWeight.bold);

class ResultPage extends StatelessWidget {
  final double bmi;
  ResultPage({this.bmi});

  String rangeText(double bmi) {
    if (bmi < 18.5)
      return 'underweight';
    else if (bmi >= 18.5 && bmi <= 24.9)
      return "Normal";
    else if (bmi >= 25 && bmi <= 29.9)
      return "Overweight";
    else
      return "Obese";
  }

  String commentText(double bmi) {
    if (bmi < 18.5)
      return "Don\'t startve yoursel. Having heatly meal is essential for your body";
    else if (bmi >= 18.5 && bmi <= 24.9)
      return "You have a normal body weight, good job";
    else if (bmi >= 25 && bmi <= 29.9)
      return "Your body weight is above Normal, try to go for a walk every day";
    else
      return "Make an exercise schedule and follow that to become healty";
  }

  Color rangeColor(double bmi) {
    if (bmi < 18.5)
      return Colors.yellow;
    else if (bmi >= 18.5 && bmi <= 24.9)
      return Colors.green;
    else if (bmi >= 25 && bmi <= 29.9)
      return Colors.orange;
    else
      return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULT"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Card(
              margin: EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    rangeText(bmi),
                    style: TextStyle(color: rangeColor(bmi), fontSize: 24),
                  ),
                  Text(
                    bmi.toStringAsPrecision(3),
                    style: bmiStyle,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "Normal BMI range:",
                          style: bmiRangeStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "18,5-25 Kg/m2",
                          style: resultCommentStyle,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    commentText(bmi),
                    style: resultCommentStyle,
                    softWrap: true,
                  ),
                  FlatButton(
                    child: Text("Save result"),
                    color: Color(0xFF4C5FE),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              child: Text("RE-CALCULATE YOUR  BMI"),
              color: Colors.pink,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
