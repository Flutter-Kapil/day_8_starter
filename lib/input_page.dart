import 'package:day_8_starter/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'round_button.dart';
import 'reusable_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

const defaultUpperTextStyle = TextStyle(fontSize: 15, color: Colors.white70);
const defaultLowerTextStyle =
    TextStyle(fontSize: 35, fontWeight: FontWeight.bold);

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender gender;
  Color activeCardColor = Color(0xFF1D1F31);
  Color inactiveCardColor = Color(0xFF111328);
  TextStyle inactiveTextStyle = TextStyle(fontSize: 22, color: Colors.white60);
  TextStyle activeTextStyle = TextStyle(fontSize: 22, color: Colors.white);
  Color activeTextColor = Colors.white;
  Color inactiveTextColor = Colors.white60;
  int height = 183;
  int weight = 74;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars,
                            size: 70,
                            color: gender == Gender.male
                                ? activeTextColor
                                : inactiveTextColor),
                        Text(
                          'MALE',
                          style: gender == Gender.male
                              ? activeTextStyle
                              : inactiveTextStyle,
                        )
                      ],
                    ),
                    color: gender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    // if(gender== 0){
                    // return activeCardColor;
                    // } else{
                    // return inavctiveCardColor
                    //}
                    tapCallback: () {
                      setState(() {
                        gender = Gender.male;
                      });
                      print('Male selected');
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 70,
                          color: gender == Gender.female
                              ? activeTextColor
                              : inactiveTextColor,
                        ),
                        Text(
                          'FEMALE',
                          style: gender == Gender.female
                              ? activeTextStyle
                              : inactiveTextStyle,
                        )
                      ],
                    ),
                    color: gender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.female;
                      });

                      print('Female selected');
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: defaultUpperTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: defaultLowerTextStyle),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData().copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 14.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 20.0,
                      ),
                      thumbColor: Color(0XFFEB1555),
                      overlayColor: Color(0X29EB1555),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      min: 110,
                      max: 210,
                      value: height.toDouble(),
                      inactiveColor: Color(0XFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: defaultUpperTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(weight.toString(), style: defaultLowerTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundButton(
                              icon: Icon(
                                Icons.remove,
                                size: 38,
                              ),
                              callback: () {
                                weight = weight - 1;
                                setState(() {});
                              },
                            ),
                            RoundButton(
                              icon: Icon(
                                Icons.add,
                                size: 38,
                              ),
                              callback: () {
                                weight = weight + 1;
                                setState(() {});
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: defaultUpperTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(age.toString(), style: defaultLowerTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundButton(
                              icon: Icon(Icons.add, size: 38),
                              callback: () {
                                age++;
                                setState(() {});
                              },
                            ),
                            RoundButton(
                              icon: Icon(Icons.remove, size: 38),
                              callback: () {
                                age--;
                                setState(() {});
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              child: Text("CALCULATE YOUR  BMI"),
              color: Colors.pink,
              onPressed: () {
                double bmi = weight / ((height / 100) * (height / 100));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmi: bmi,
                            )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
