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

  bool _canCheck() {
    var now = DateTime.now();
    var today = DateTime.utc(now.year, now.month, now.day);
    int recordsSinceToday =
        _isar.dailyTaskRecords.filter().timeStampGreaterThan(today).countSync();
    return recordsSinceToday == 0;
  }

  void _check() {
    if (!_checkable) {
      return;
    }

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
        ? const Icon(Icons.check_box_outline_blank)
        : const Icon(Icons.check_box_outlined);
    return Card(
      child: ListTile(
        leading: const FlutterLogo(size: 56.0),
        title: const Text('Title'),
        subtitle: const Text('Here is a second line'),
        trailing: IconButton(
          icon: checkIcon,
          tooltip: 'Check',
          onPressed: _check,
          iconSize: 40,
        ),
        onTap: () => print("TODO route to DailyWidgetRoute"),
      ),
    );
  }
}
