import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  RangeValues _values = RangeValues(0.3, 0.7);
  Gender gender;
  Color activeCardColor = Color(0xFF1D1F31); // Color(0xFF1D1F31)
  Color inactiveCardColor = Color(0xFF111328); //Color(0xFF111328)

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
                        ),
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 28),
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
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                        ),
                        Text(
                          "Female",
                          style: TextStyle(fontSize: 28),
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
                        'HEIGHT',
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '180',
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
                      child: RangeSlider(
                        values: _values,
                        onChanged: (RangeValues values) {
                          setState(() {
                            _values = values;
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
