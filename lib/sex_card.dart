import 'package:flutter/material.dart';
import 'constants.dart';

class SexCard extends StatelessWidget {
  final IconData SexCardIcon;
  final String SexCardText;

  SexCard(this.SexCardIcon, this.SexCardText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          SexCardIcon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          SexCardText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
