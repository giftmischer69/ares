import 'package:ares/db.dart';
import 'package:flutter/material.dart';

import 'package:ares/ares/widgets/daily_reminder.dart';
import "ares/widgets/increment_tracker.dart";
import "ares/widgets/toggle_widget.dart";

Future<void> main() async => runApp(const MaterialApp(
      title: "ares",
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainRoute extends StatelessWidget {
  MainRoute({super.key});

  List<Widget> entries = <Widget>[
    IncrementTrackerWidget(),
    DailyReminderWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title Text"),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: entries[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
