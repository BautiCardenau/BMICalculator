import 'package:bmicalculatorflutter/reusable_card.dart';
import 'package:bmicalculatorflutter/sex_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = kStartingHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          colour: selectedGender == Gender.male
                              ? kContainersColor
                              : kInactiveContainersColor,
                          cardChild: SexCard(FontAwesomeIcons.mars, 'MALE'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? kContainersColor
                              : kInactiveContainersColor,
                          cardChild: SexCard(FontAwesomeIcons.venus, 'FEMALE')),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kContainersColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "HEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: kLabelNumbersStyle),
                          Text(
                            "cm",
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: kMinHeight,
                        max: kMaxHeight,
                        activeColor: kActiveSliderColor,
                        inactiveColor: kInactiveSliderColor,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(colour: kContainersColor),
                    ),
                    Expanded(child: ReusableCard(colour: kContainersColor)),
                  ],
                ),
              ),
              Container(
                color: kBottomBarColor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: kBottomBarHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
