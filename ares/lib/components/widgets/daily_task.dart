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
  late List<DailyTaskRecord> _records =
      _isar.dailyTaskRecords.where().findAllSync();

  var _canCheck = true;

  // TODO Read if can check from db, and only update on init and when pressed

  bool _canCheck() {
    var now = DateTime.now();
    var today = DateTime.utc(now.year, now.month, now.day);
    int recordsSinceToday =
        _isar.dailyTaskRecords.filter().timeStampGreaterThan(today).countSync();
    return recordsSinceToday == 0;
  }

  void _check() {
    if (!_canCheck()) {
      print("can't check");
      return;
    }
    print("can check");

    _isar.writeTxnSync(() {
      final dailyTaskRecord = DailyTaskRecord()..timeStamp = DateTime.now();
      _isar.dailyTaskRecords.putSync(dailyTaskRecord);
    });

    setState(() {
      _records = _isar.dailyTaskRecords.where().findAllSync();
    });
  }

  @override
  Widget build(BuildContext context) {
    var checkIcon = _canCheck() ? Icon(Icons.add) : Icon(Icons.check);
    return ListView.separated(
      itemCount: _records.length,
      itemBuilder: (context, index) {
        var record = _records[index];
        return Row(
          children: [
            SizedBox(
              height: 50,
              child: Text("id:${record.id} timeStamp:${record.timeStamp}"),
            ),
            IconButton(
              icon: checkIcon,
              tooltip: 'Increment',
              onPressed: _check,
              iconSize: 40,
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
