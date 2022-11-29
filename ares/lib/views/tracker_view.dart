import 'package:ares/models/tracker.dart';
import 'package:ares/provider/tracker_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrackerView extends StatefulWidget {
  const TrackerView(
      {super.key,
      required this.tracker,
      required this.context,
      required this.notifyParent});

  final Tracker tracker;
  final BuildContext context;
  final Function() notifyParent;

  @override
  State<TrackerView> createState() => _TrackerViewState();
}

class _TrackerViewState extends State<TrackerView> {
  @override
  Widget build(BuildContext context) {
    switch (widget.tracker.type) {
      case TrackerType.daily:
        return DailyTrackerView(
          tracker: widget.tracker,
          context: widget.context,
          notifyParent: widget.notifyParent,
        );
      case TrackerType.rule:
        return Text("Rule Tracker: ${widget.tracker.title}");
      case TrackerType.increment:
        return Text("Increment Tracker: ${widget.tracker.title}");
      default:
        return ErrorWidget(
          Exception(
            "Could not load Tracker: ${widget.tracker.toString()}",
          ),
        );
    }
  }
}

class DailyTrackerView extends StatefulWidget {
  const DailyTrackerView(
      {super.key,
      required this.tracker,
      required this.context,
      required this.notifyParent});

  final Tracker tracker;
  final BuildContext context;
  final Function() notifyParent;

  @override
  State<DailyTrackerView> createState() => _DailyTrackerViewState();
}

class _DailyTrackerViewState extends State<DailyTrackerView> {
  @override
  Widget build(BuildContext context) {
    // widget.context
    // widget.tracker

    return ListTile(
      leading: const Icon(Icons.calendar_month),
      title: Text(widget.tracker.title),
      subtitle: Text(widget.tracker.description),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  context.read<TrackerProvider>().deleteTracker(widget.tracker);
                  widget.notifyParent();
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
