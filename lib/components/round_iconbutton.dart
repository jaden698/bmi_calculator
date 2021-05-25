import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:onPressed,
      child:Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      fillColor:Color(0xFF4C4F5E),
      shape: CircleBorder(),
      elevation: 0,
    );
  }
}