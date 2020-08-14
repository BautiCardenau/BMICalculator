import 'package:bmicalculatorflutter/calculator.dart';
import 'package:bmicalculatorflutter/screens/results_page.dart';
import '../components/bottom_bar.dart';
import '../components/round_icon_button.dart';
import 'file:///D:/Flutter/Practica/bmicalculator/bmicalculator_flutter/lib/components/reusable_card.dart';
import 'file:///D:/Flutter/Practica/bmicalculator/bmicalculator_flutter/lib/components/sex_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = kStartingHeight;
  int weight = 60;
  int age = 18;

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
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: kThumbColor,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kInactiveSliderColor,
                            overlayColor: kOverlayColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                          value: height.toDouble(),
                          min: kMinHeight,
                          max: kMaxHeight,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kContainersColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "WEIGHT",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kLabelNumbersStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: ReusableCard(
                      colour: kContainersColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kLabelNumbersStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              BottomBar(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  Calculator calculator =
                      Calculator(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calculator.calculateBMI(),
                              resultText: calculator.getResult(),
                              interpretation: calculator.getInterpretation(),
                            )),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
