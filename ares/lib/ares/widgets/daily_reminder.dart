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

  IconData checkIcon = Icons.check_box_outline_blank_rounded;

  //DateTime last_check = DateTime.utc(1969, 7, 20, 20, 18, 04);
  bool canCheck = true;

  Future<bool> _canCheck() async {
    List<DailyReminderRecord> records = await _future;
    if (records.isEmpty) return true;

    records.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));

    DateTime now = DateTime.now();
    DateTime today = DateTime.utc(now.year, now.month, now.day);

    canCheck = records.first.timeStamp.isBefore(today);

    if (canCheck) {
      checkIcon = Icons.check_box_outline_blank_rounded;
    } else {
      checkIcon = Icons.check_box;
    }
    return canCheck;
  }

  Future<void> _check() async {
    print("can check: ${await _canCheck()}");
    bool __canCheck = await _canCheck();
    if (!__canCheck) {
      // already checked today
      return;
    }
    await database.into(database.dailyReminderRecords).insert(
        DailyReminderRecordsCompanion.insert(timeStamp: DateTime.now()));
    setState(() {
      _future = database.select(database.dailyReminderRecords).get();
      canCheck = __canCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DailyReminderRecord>>(
      future: _future, // a previously-obtained Future<String> or null
      builder: (BuildContext context,
          AsyncSnapshot<List<DailyReminderRecord>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Material(
              color: Colors.transparent,
              shape: const CircleBorder(
                side: BorderSide(
                  //color: Colors.black,
                  width: 3,
                ),
              ),
              child: Icon(checkIcon,
                  //color: Colors.black,
                  size: 40),
            ),
            const Spacer(),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Upper",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "Lower",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Lower Text",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                )
              ],
            ),
            Center(
              child: Text("Entries: ${snapshot.data!.length}",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            const Spacer(),
            IconButton(
              icon: (canCheck)
                  ? const Icon(Icons.check_box_outline_blank_rounded)
                  : const Icon(Icons.check_box),
              tooltip: 'Check',
              onPressed: _check,
              iconSize: 40,
            ),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            ),
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ];
        }
        return Center(
          child: OutlinedButton(
            child: Row(
              children: children,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DailyReminderWidgetRoute()),
              );
            },
          ),
        );
      },
    );
  }
}

// Meditation / Stretches / Vitamins

class DailyReminderWidgetRoute extends StatelessWidget {
  const DailyReminderWidgetRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DailyReminder Statistics"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
