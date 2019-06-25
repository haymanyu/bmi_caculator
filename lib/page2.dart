import 'package:bmi_caculate/reusefulwidget.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web/painting.dart';
import 'constants.dart';

// weight = MyHomePage().

class Page2 extends StatelessWidget {
  final String resultBMI;
  final String resultText;
  final String interpretation;

  Page2({this.resultBMI, this.resultText, this.interpretation});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('BMI 计算器'),
      //   actions: <Widget>[Icon(Icons.menu)],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'BMI 计算器',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('计算结果: ', style: TextStyle(fontSize: 40),),
          ),

          Expanded(
            child: ReusefullCard(
              colour: kInActivityColor,
              cardChild: Column(
              
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Center(child:Text(resultBMI, style: kNumberStyle,))),
                  Expanded(child: Center(child:Text(resultText, style: TextStyle(fontSize: 30),))),
                  Expanded(child: Center(child:Text(interpretation, style: TextStyle(fontSize: 30),))),
    
          

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, '/');
            },
            child: Container(
              child:
                  Center(child: Text('重新计算', style: TextStyle(fontSize: 30))),
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
      ),
    );
  }
}
