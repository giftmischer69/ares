import 'dart:math';

import 'package:ares/models/tracker_record.dart';
import 'package:ares/utils/datetime_utils.dart';
import 'package:flutter/material.dart';

class CircularSegmentedProgressIndicator extends StatelessWidget {
  const CircularSegmentedProgressIndicator({super.key, required this.records});

  final List<TrackerRecord> records;

  @override
  Widget build(BuildContext context) {
    // list bool for checked each day of the week
    // 0 -> monday
    var now = DateTime.now();
    var latestMonday = now.subtract(Duration(days: now.weekday - 1)).intoDay();

    print(latestMonday.day);

    var checkedDays = <bool>[];
    for (var index in List.generate(8, (i) => i)) {
      var isChecked = records
              .where((element) =>
                  element.timeStamp
                      .isAfter(latestMonday.add(Duration(days: index))) &&
                  element.timeStamp
                      .isBefore(latestMonday.add(Duration(days: index + 1))))
              .isEmpty
          ? false
          : true;
      checkedDays.add(isChecked);
    }

    var numberOfSegments = checkedDays.length;

    var seperatorValues = <double>[];
    var indicatorColors = <Color>[];
    var indicatorValues = <double>[];

    // 3 + 1 = 4
    var lastValue = 0.0;
    for (var isChecked in checkedDays) {
      var seperatorValue = (1 / (numberOfSegments + 1)) / 3 + lastValue;
      var indicatorValue = (1 / (numberOfSegments + 1)) + seperatorValue;
      lastValue = indicatorValue;

      seperatorValues.add(seperatorValue);
      indicatorColors.add(isChecked ? Colors.green : Colors.grey);
      indicatorValues.add(indicatorValue);
    }
    return Transform.rotate(
      angle: -2 * pi * (seperatorValues[0] / 2),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          for (var index in List.generate(numberOfSegments, (i) => i).reversed)
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  value: indicatorValues[index],
                  color: indicatorColors[index],
                  backgroundColor: Colors.transparent,
                ),
                CircularProgressIndicator(
                  value: seperatorValues[index],
                  color: Colors.white,
                  backgroundColor: Colors.transparent,
                ),
              ],
            )
        ],
      ),
    );
  }
}
