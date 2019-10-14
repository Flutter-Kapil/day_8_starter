import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Icon icon;
  final Function callback;

  RoundButton({this.icon, this.callback});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      fillColor: Color(0xFF4C5FE),
      shape: CircleBorder(),
      elevation: 6,
      constraints: BoxConstraints(),
      onPressed: callback,
    );
  }
}
