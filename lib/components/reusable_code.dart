import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({ @required this.color,this.child,this.onPressed});
  final Color color;
  final Widget child;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:color,
        ),
      ),
    );
  }
}