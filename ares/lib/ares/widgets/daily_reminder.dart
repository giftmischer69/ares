import 'package:flutter/material.dart';
import '../../db.dart';

class DailyReminderWidget extends StatefulWidget {
  const DailyReminderWidget({super.key});

  @override
  _DailyReminderState createState() => _DailyReminderState();
}

class _DailyReminderState extends State<DailyReminderWidget> {
  final database = MyDatabase();
  late Future<List<DailyReminderRecord>> _future =
      database.select(database.dailyReminderRecords).get();

  //DateTime last_check = DateTime.utc(1969, 7, 20, 20, 18, 04);
  //bool can_check = true;

  Future<void> check() async {
    await database.into(database.dailyReminderRecords).insert(
        DailyReminderRecordsCompanion.insert(timeStamp: DateTime.now()));
    setState(() {
      _future = database.select(database.dailyReminderRecords).get();
    });
  }

  Widget build(BuildContext context) {
    return Text("Hello World");
  }
}


// Meditation / Stretches / Vitamins


