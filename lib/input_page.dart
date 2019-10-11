import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  double height = 180;
  Gender gender;
  Color activeCardColor = Color(0xFF1D1F31); // Color(0xFF1D1F31)
  Color inactiveCardColor = Color(0xFF111328); //Color(0xFF111328)
  Color activeTextColor = Colors.white;
  Color inactiveTextColor = Colors.white70;

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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    color: gender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 100,
                          color: gender == Gender.male
                              ? activeTextColor
                              : inactiveTextColor,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                              fontSize: 28,
                              color: gender == Gender.male
                                  ? activeTextColor
                                  : inactiveTextColor),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    color: gender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.venus,
                            size: 100,
                            color: gender == Gender.female
                                ? activeTextColor
                                : inactiveTextColor),
                        Text(
                          "Female",
                          style: TextStyle(
                              fontSize: 28,
                              color: gender == Gender.female
                                  ? activeTextColor
                                  : inactiveTextColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReUsableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Height',
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${height.toInt()}',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Text('cm', style: TextStyle(color: Colors.white70))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Slider(
                        min: 110,
                        max: 250,
                        value: height,
                        onChanged: (newheight) {
                          setState(() {
                            height = newheight;
                            print("height:${height.toInt()} ");
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(),
                ),
                Expanded(
                  child: ReUsableCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReUsableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  ReUsableCard({this.color = const Color(0xFF1D1F31), this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
