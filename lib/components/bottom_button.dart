import 'package:flutter/material.dart';
//import 'result_page.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {
  final String val;
  final Function onTap;
  BottomButton({@required this.val,@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child: Center(child: Text(val,style: kLargeButtonTextStyle,)),
        color: kBottomCardColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}