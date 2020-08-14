import 'package:flutter/material.dart';
import '../constants.dart';

class BottomBar extends StatelessWidget {
  BottomBar({@required this.buttonTitle, @required this.onTap});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kCalculateButtonStyle,
          ),
        ),
        color: kBottomBarColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomBarHeight,
      ),
    );
  }
}
