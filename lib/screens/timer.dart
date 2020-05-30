import 'package:intl/intl.dart';

import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SleekCircularSlider(
            appearance: CircularSliderAppearance(
              size: 250,
              customColors: CustomSliderColors(
                progressBarColor: Constants.accentColor,
                progressBarColors: null,
                trackColor: Constants.textColor,
              ),
              infoProperties: InfoProperties(
                mainLabelStyle: TextStyle(color: Constants.accentColor, fontSize: 40),
                modifier: (double value) {
                  DateTime seconds = DateTime.fromMillisecondsSinceEpoch(
                      (5 * 60 * 60 * 1000) + value.toInt() * (1000 * 60)
                  );
                  return DateFormat.Hm().format(seconds);
                },
              ),
            ),
            onChange: (double value) {
              print(value);
            },
          ),
        ],
      ),
    );
  }
}