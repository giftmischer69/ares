import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ares/models/tracker.dart';
import 'package:ares/provider/tracker_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return InheritedProvider<TrackerProvider>(
      create: (_) => TrackerProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("ares"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: context.watch<TrackerProvider>().trackers.map(
                (tracker) {
                  var icon = Icon(Icons.question_mark);

                  switch (tracker.type) {
                    case TrackerType.daily:
                      icon = Icon(Icons.calendar_month);
                      break;
                    case TrackerType.increment:
                      icon = Icon(Icons.add);
                      break;
                    case TrackerType.rule:
                      icon = Icon(Icons.rule);
                      break;
                  }

                  return ListTile(
                    leading: icon,
                    title: Text(tracker.title),
                    subtitle: Text(tracker.description),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                context
                                    .read<TrackerProvider>()
                                    .deleteTracker(tracker);
                                setState(() {
                                  return;
                                });
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              final tracker = Tracker()
                ..title = "Stretches"
                ..description = "Do your stretches"
                ..type =
                    Random().nextBool() ? TrackerType.daily : TrackerType.rule;
              context.read<TrackerProvider>().addTracker(tracker);
              setState(() {
                return;
              });
            },
          ),
        );
      },
    );
  }
}
