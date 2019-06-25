import 'package:flutter_web/material.dart';
import 'constants.dart';

class IconWidget extends StatelessWidget {
  final IconData iconData;
  final String label;

  IconWidget({@required this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelStyle,
        )
      ],
    );
  }
}

class ReusefullCard extends StatelessWidget {
  ReusefullCard({@required this.colour, this.cardChild, this.onPressed});
  final Color colour;

  final Widget cardChild;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        child: cardChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)), // 圆角
      ),
    );
  }
}
