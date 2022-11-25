import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db.dart';

class DailyTaskWidget extends StatefulWidget {
  const DailyTaskWidget({super.key, required this.title});

  final String title;

  @override
  State<DailyTaskWidget> createState() => _DailyTaskWidgetState();
}

class _DailyTaskWidgetState extends State<DailyTaskWidget> {
  final _isar = Isar.openSync([DailyTaskRecordSchema]);
  late bool _checkable = _canCheck();

  // TODO Read if can check from db, and only update on init and when pressed

  bool _canCheck() {
    var now = DateTime.now();
    var today = DateTime.utc(now.year, now.month, now.day);
    int recordsSinceToday =
        _isar.dailyTaskRecords.filter().timeStampGreaterThan(today).countSync();
    return recordsSinceToday == 0;
  }

  void _check() {
    if (!_checkable) {
      print("can't check");
      return;
    }
    print("can check");

    _isar.writeTxnSync(() {
      final dailyTaskRecord = DailyTaskRecord()..timeStamp = DateTime.now();
      _isar.dailyTaskRecords.putSync(dailyTaskRecord);
    });

    setState(() {
      _checkable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var checkIcon = _checkable
        ? const Icon(Icons.crop_square_rounded)
        : const Icon(Icons.check);
    return IconButton(
      icon: checkIcon,
      tooltip: 'Check',
      onPressed: _check,
      iconSize: 40,
    );
  }
}
