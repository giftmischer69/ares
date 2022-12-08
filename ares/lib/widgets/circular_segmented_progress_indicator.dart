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
    var checkedDays = <bool>[true, false, false, true, false, true, false];
    int counter = 0;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        for (var index in checkedDays)
          CircularProgressIndicator(
            value: (7 - counter) / 7,
            color: index
                ? Colors.yellow.withGreen(((255 / 7) * (7 - counter++)).toInt())
                : Colors.transparent,
            backgroundColor: Colors.transparent,
          )
      ],
    );
  }
}
