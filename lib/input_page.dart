import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Container dummy = Container(
    margin: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Color(0xFF1D1F31),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  );

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
                    onTap: () {
                      print('male clicked');
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
                    onTap: () {
                      print('Female cicked');
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
                      alignment: Alignment.center,
                      child: Text('HEIGHT'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Text('180'), Text('cm')],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Text('slider'),
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
