import 'package:ares/models/tracker_record.dart';
import 'package:ares/provider/tracker_record_provider.dart';
import 'package:ares/views/tracker_view.dart';
import 'package:ares/models/tracker.dart';
import 'package:ares/provider/tracker_provider.dart';

import 'package:flutter/material.dart';

import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final isar = initIsar();

  static Isar initIsar() {
    var isarInstance = Isar.getInstance();
    isarInstance ??= Isar.openSync([TrackerSchema, TrackerRecordSchema]);
    return isarInstance;
  }

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        InheritedProvider<TrackerProvider>(
          create: (_) => TrackerProvider(isar: widget.isar),
        ),
        InheritedProvider<TrackerRecordProvider>(
          create: (_) => TrackerRecordProvider(isar: widget.isar),
        ),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("ares"),
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
            child: const Icon(Icons.developer_mode),
            onPressed: () {
              final tracker = Tracker()
                ..title = "Stretches"
                ..description = "Do your stretches"
                ..type = TrackerType.daily;
              context.read<TrackerProvider>().addTracker(tracker);
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
