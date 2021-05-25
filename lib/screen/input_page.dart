import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screen/result_page.dart';
import '../components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components//icon_content.dart';
import 'package:bmi_calculator/components/reusable_code.dart';
import 'package:bmi_calculator/constants.dart';
//import '../round_iconbutton.dart';
import 'package:bmi_calculator/components/round_iconbutton.dart';
//import 'package:bmi_calculator/result_page.dart';

enum Gender{male,female}
class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Gender selectedGender;
  int heigh=180;
  int weight=60;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:Row(
            children: <Widget>[
              Expanded(child:ReusableCard(
                onPressed:(){
                  setState(() {
                    selectedGender=Gender.male;
                  });
                },
                color:(selectedGender==Gender.male)?kActiveCardColor:kInactiveCardColor,
                child: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'Male',
                ),
              )),
              Expanded(child: ReusableCard(
                onPressed: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                },
                color:(selectedGender==Gender.female)?kActiveCardColor:kInactiveCardColor,
                child: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'Female',
                ),
              ),
              ),
            ],
          ),),
          Expanded(child:ReusableCard(
              color:kActiveCardColor,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGH',style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(heigh.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm',
                      style: kLabelTextStyle,),
                    ],
                  ),
                  Slider(
                    value: heigh.toDouble(),
                    activeColor:Colors.pinkAccent,
                    inactiveColor:Colors.grey,
                    min: 120,
                    max: 220,
                    onChanged:(double newValue){
                      setState(() {
                        heigh=newValue.round();
                      });
                    },
                  ),
                ],
              ),
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:
              ReusableCard(
                  color:kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(weight.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                            setState(() {
                              weight++;
                            });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
              ),
              Expanded(child:ReusableCard(color:kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(age.toString(),style: kNumberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
              ),
            ],
          ),),
              BottomButton(val:'Calculate',
                onTap:(){
                CalculatorBrain calc=CalculatorBrain(height:heigh ,weight: weight);
                Navigator.push(context,MaterialPageRoute(builder: (context){return ResultPage(bmiResult: calc.calculateBmi(),bmiResultText: calc.getResult(),bmiInterpretation: calc.getInterpretation(),);}));
                },),
        ],
      ),
    );
  }
}







