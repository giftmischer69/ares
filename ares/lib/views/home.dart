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
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: context
                  .watch<TrackerProvider>()
                  .trackers
                  .map(
                    (tracker) => ListTile(
                      leading: Text(tracker.id.toString()),
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
                    ),
                  )
                  .toList(),
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
