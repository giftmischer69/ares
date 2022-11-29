import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ares/views/tracker_view.dart';
import 'package:ares/models/tracker.dart';
import 'package:ares/provider/tracker_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StatefulWidget> {
  void refresh() {
    setState(() {});
  }

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
                  return TrackerView(
                    context: context,
                    tracker: tracker,
                    notifyParent: refresh,
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
                ..type = TrackerType.daily;
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
