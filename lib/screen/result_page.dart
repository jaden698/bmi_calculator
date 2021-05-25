import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.bmiResultText,@required this.bmiInterpretation});
  final String bmiResult;
  final String bmiResultText;
  final String bmiInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text('Your Result:',style: kTitleTextStyle,textAlign: TextAlign.center,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(color: kActiveCardColor,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(bmiResult,style: kBMITextStyle),
                  Text(bmiInterpretation,style: kBodyTextStyle,textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          BottomButton(val:'Re-Calculate',onTap: (){Navigator.pop(context);}),
        ],
      ),
    );
  }
}
