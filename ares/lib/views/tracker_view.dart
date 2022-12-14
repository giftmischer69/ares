import 'package:ares/models/tracker.dart';
import 'package:ares/models/tracker_record.dart';
import 'package:ares/provider/tracker_provider.dart';
import 'package:ares/provider/tracker_record_provider.dart';
import 'package:ares/utils/extensions.dart';
import 'package:ares/widgets/circular_segmented_progress_indicator.dart';
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

  int calculateStreak(List<TrackerRecord> trackerRecords) {
    if (trackerRecords.isEmpty) {
      return 0;
    }

    var today = DateTime.now().intoDay();
    int recordsToday = trackerRecords
        .where((element) => element.timeStamp.isAfter(today))
        .length;
    int recordsYesterday = trackerRecords
        .where((element) =>
            element.timeStamp.isAfter(today.subtract(const Duration(days: 1))))
        .length;

    if (recordsToday == 0 && recordsYesterday == 0) {
      // latest record has to be today or yesterday
      return 0;
    }

    trackerRecords.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));
    trackerRecords = trackerRecords.reversed.toList();

    int streak = 1;
    // if the latest record was at yesterdays date
    // https://stackoverflow.com/a/70727527/16357605
    for (final pair
        in IterableZip([trackerRecords, trackerRecords.sublist(1)])) {
      // pair[0] = index
      // pair[1] = entry before index
      if (!isDuringDayBefore(pair[0].timeStamp, pair[1].timeStamp)) {
        return streak;
      }
      streak++;
    }
    return streak;
  }

  bool calculateCanCheck(List<TrackerRecord> trackerRecords) {
    if (trackerRecords.isEmpty) {
      return true;
    }

    var today = DateTime.now().intoDay();
    int recordsToday = trackerRecords
        .where((element) => element.timeStamp.isAfter(today))
        .length;

    if (recordsToday == 0) {
      return true;
    } else if (recordsToday == 1) {
      return false;
    } else if (recordsToday > 1) {
      throw Exception(
          "more than one record for today, recordsToday:$recordsToday");
    } else {
      throw Exception("should never be reached, recordsToday:$recordsToday");
    }
  }

  List<TrackerRecord> calculateRecordsThisWeek(
      List<TrackerRecord> trackerRecords) {
    var lastMonday = DateTime.now()
        .subtract(Duration(days: DateTime.now().weekday - 1))
        .intoDay();

    var records = trackerRecords
        .where((element) => element.timeStamp.isAfter(lastMonday))
        .toList();
    return records;
  }

  @override
  Widget build(BuildContext context) {
    // TODO add CircularSegmentedProgressIndicator around left icon
    // - [ ] toggle right (and left) icon when a record for today is present
    // - [ ] Icon and CircularSegmentedProgressIndicator should have the
    //        same, theme dependent, accent color
    // - [ ] CircularSegmentedProgressIndicator Seperators should have the
    //        right, theme dependent, background color
    // TODO add tasks somehow with different screen
    // TODO detail task page, with description and editing etc
    // TODO Statistics View for DailyWidget with https://pub.dev/packages/table_calendar weekly/monthly views

    var trackerRecords = getTrackerRecords(context);

    var streak = calculateStreak(trackerRecords);
    var canCheck = calculateCanCheck(trackerRecords);
    var recordsThisWeek = calculateRecordsThisWeek(trackerRecords);

    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.white)),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CircularSegmentedProgressIndicator(
              records: recordsThisWeek,
            ),
            SizedBox(
              child: Icon(
                Icons.calendar_month,
                color: canCheck ? Colors.grey : Colors.green,
              ),
            ),
          ],
        ),
      ),
      title: Text(widget.tracker.title),
      subtitle: Text("Streak: $streak Days ????"),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // IconButton(
            //   // debug button

            //   onPressed: () {
            //     trackerRecords.forEach(
            //         context.read<TrackerRecordProvider>().deleteRecord);

            //     List.generate(10, (i) {
            //       var other =
            //           DateTime.now().subtract(Duration(days: 2 * i + 1));

            //       var record = TrackerRecord()
            //         ..timeStamp = other
            //         ..parent.value = widget.tracker;

            //       context.read<TrackerRecordProvider>().addRecord(record);
            //     });

            //     widget.notifyParent();
            //   },
            //   icon: const Icon(Icons.developer_mode),
            // ),
            IconButton(
              onPressed: () {
                if (!canCheck) {
                  return;
                }

                var record = TrackerRecord()
                  ..timeStamp = DateTime.now()
                  ..parent.value = widget.tracker;

                context.read<TrackerRecordProvider>().addRecord(record);
                widget.notifyParent();
              },
              icon: canCheck ? const Icon(Icons.add) : const Icon(Icons.check),
            ),
            IconButton(
              onPressed: () {
                context.read<TrackerProvider>().deleteTracker(widget.tracker);

                for (var element in trackerRecords) {
                  context.read<TrackerRecordProvider>().deleteRecord(element);
                }

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
