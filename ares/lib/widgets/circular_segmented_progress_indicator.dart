import 'package:ares/models/tracker_record.dart';
import 'package:flutter/material.dart';

class CircularSegmentedProgressIndicator extends StatelessWidget {
  const CircularSegmentedProgressIndicator({super.key, required this.records});

  final List<TrackerRecord> records;

  @override
  Widget build(BuildContext context) {
    // list bool for checked each day of the week
    // 0 -> monday
    // https://github.com/thisiskhan/thebrio_segmented_circle_border/blob/main/lib/thebri_segmented_circle_border.dart
    var checkedDays = <bool>[true, true, true];

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

    int counter = 0;
    return Stack(
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
    );
  }
}
