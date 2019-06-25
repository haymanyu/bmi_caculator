import 'package:bmi_caculate/my_icons.dart';
import 'package:bmi_caculate/page2.dart';
import 'package:flutter_web/material.dart';
import 'my_icons.dart';
import 'reusefulwidget.dart';
import 'constants.dart';
import 'dart:math';

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 180;
  int weight = 70;
  int age = 20;

  String resultbmi;
  String resulttext;
  String interpretation;

  double _bmi;

  String bmiCal () {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi > 25) {
      resulttext = '偏重';
    } else if (_bmi <= 18.5) {
      resulttext = '偏瘦';
    } else {
      resulttext = '正常';
    }
    return resulttext;
  }

  String getinterpretation ( ) {

    if (_bmi > 25) {
      interpretation = '注意多做运动, 少食多餐';
    } else if (_bmi <= 18.5) {
      interpretation = '注意加餐, 补充营养';
    } else {
      interpretation = '继续保持';
    }
    return interpretation;

  }




  Gender gender;
  @override
  Widget build(BuildContext context) {
    resultbmi = bmiCal();
    resulttext = getResult();
    interpretation = getinterpretation();


    return Scaffold(
        appBar: AppBar(
          title: Text('BMI 计算器'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusefullCard(
                      onPressed: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      cardChild: IconWidget(
                        iconData: MyIcons.male,
                        label: 'MALE',
                      ),
                      colour: gender == Gender.male
                          ? kActivityColor
                          : kInActivityColor,
                    ),
                  ),
                  Expanded(
                    child: ReusefullCard(
                      onPressed: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      cardChild: IconWidget(
                        iconData: MyIcons.female,
                        label: 'FEMALE',
                      ),
                      colour: gender == Gender.female
                          ? kActivityColor
                          : kInActivityColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusefullCard(
                colour: kActivityColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text('cm', style: kLabelStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          // inactiveTrackColor: Colors.grey,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15,
                          ),
                          thumbColor: Color(0xFFEB1555),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Color(0x15EB1555)),
                      child: Slider(
                        value: height.toDouble(),
                        max: 220,
                        min: 120,
                        onChanged: (newVlaue) {
                          setState(() {
                            height = newVlaue.round();
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
                    child: ReusefullCard(
                      colour: kActivityColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            '$weight',
                            style: kNumberStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusefullCard(
                      colour: kActivityColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          Text(
                            '$age',
                            style: kNumberStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/result');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2(
                    resultBMI: resultbmi,
                    resultText: resulttext,
                    interpretation: interpretation,
                  )),
                );
              },
              child: Container(
                child:
                    Center(child: Text('开始计算', style: TextStyle(fontSize: 30))),
                margin: EdgeInsets.only(top: 5),
                height: kBottomContainerHeight.toDouble(),
                width: double.infinity,
                // color: Colors.red,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: kBottomContainerColor,
                ),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
