import 'package:ares/models/tracker.dart';
import 'package:ares/models/tracker_record.dart';
import 'package:ares/provider/tracker_provider.dart';
import 'package:ares/provider/tracker_record_provider.dart';
import 'package:ares/utils/datetime_utils.dart';
import 'package:collection/collection.dart';
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
  List<TrackerRecord> getTrackerRecords(BuildContext context) {
    return context
        .read<TrackerRecordProvider>()
        .records
        .where((element) => element.parent.value != null)
        .where((element) => element.parent.value!.id == widget.tracker.id)
        .toList();
  }

  bool isDuringDayBefore(DateTime a, DateTime b) {
    // a isDuringDayBefore b
    var aDay = a.intoDay();
    var bDay = b.intoDay();

    var difference = aDay.difference(bDay);
    var result = difference.compareTo(const Duration(days: 1)) == 0;

    return result;
  }

  int calculateStreak(List<TrackerRecord> records) {
    if (records.isEmpty) {
      print("streak is 0, no records");
      return 0;
    }

    var today = DateTime.now().intoDay();
    int recordsToday =
        records.where((element) => element.timeStamp.isAfter(today)).length;
    int recordsYesterday = records
        .where((element) =>
            element.timeStamp.isAfter(today.subtract(const Duration(days: 1))))
        .length;

    if (recordsToday == 0 && recordsYesterday == 0) {
      // latest record has to be today or yesterday
      print("streak is 0, no records today or yesterday");
      return 0;
    }

    records.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));
    records = records.reversed.toList();

    int streak = 1;
    // if the latest record was at yesterdays date
    // https://stackoverflow.com/a/70727527/16357605
    for (final pair in IterableZip([records, records.sublist(1)])) {
      // pair[0] = index
      // pair[1] = entry before index

      if (!isDuringDayBefore(pair[0].timeStamp, pair[1].timeStamp)) {
        return streak;
      }
      streak++;
    }
    return streak;
  }

  @override
  Widget build(BuildContext context) {
    // TODO add record functionality
    // TODO add CircularProgressIndicator around left icon
    // TODO toggle right (and left) icon when a record for today is present
    // TODO detail task page, with description and editing etc
    // TODO add tasks somehow with different screen

    var trackerRecords = getTrackerRecords(context);

    var streak = calculateStreak(trackerRecords);

    return ListTile(
      leading: const Icon(Icons.calendar_month),
      title: Text(widget.tracker.title),
      subtitle: Text("streak: $streak 🔥"),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              // debug button
              onPressed: () {
                print("populating ${widget.tracker.id}");

                trackerRecords.forEach(
                    context.read<TrackerRecordProvider>().deleteRecord);

                List.generate(10, (i) {
                  var other = DateTime.now().subtract(Duration(days: i + 1));

                  print("pop: i:$i other:${other}");

                  var record = TrackerRecord()
                    ..timeStamp = other
                    ..parent.value = widget.tracker;

                  context.read<TrackerRecordProvider>().addRecord(record);
                });

                widget.notifyParent();
              },
              icon: const Icon(Icons.developer_mode),
            ),
            IconButton(
              onPressed: () {
                print("TODO ADD RECORD ${widget.tracker.id}");
                var record = TrackerRecord()
                  ..timeStamp = DateTime.now()
                  ..parent.value = widget.tracker;

                context.read<TrackerRecordProvider>().addRecord(record);
                widget.notifyParent();
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                // TODO also delete all records for this tracker
                // when tracker is deleted

                var thisTrackerRecords = context
                    .read<TrackerRecordProvider>()
                    .records
                    .where((element) => element.parent.value != null)
                    .where((element) =>
                        element.parent.value!.id == widget.tracker.id);

                for (var element in thisTrackerRecords) {
                  context.read<TrackerRecordProvider>().deleteRecord(element);
                }

                context.read<TrackerProvider>().deleteTracker(widget.tracker);

                widget.notifyParent();
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
