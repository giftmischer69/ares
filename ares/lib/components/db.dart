import 'package:isar/isar.dart';

part 'db.g.dart';

@collection
class DailyTaskRecord {
  Id id = Isar.autoIncrement;

  DateTime? timeStamp;
}

// TODO find solution to the record<->instance linking problem
@collection
class IncrementTrackerRecord {
  Id id = Isar.autoIncrement;

  DateTime? timeStamp;

  final tracker = IsarLink<TrackerInstance>();
}

@collection
class TrackerInstance {
  Id id = Isar.autoIncrement;

  String? instanceJson;
}
