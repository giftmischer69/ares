import 'package:isar/isar.dart';

part 'tracker.g.dart';

@Collection()
class Tracker {
  Id id = Isar.autoIncrement;

  late String title;

  late String description;

  @enumerated
  late TrackerType type;
}

enum TrackerType { daily, rule, increment }

@Collection()
class TrackerRecord {
  Id id = Isar.autoIncrement;

  late DateTime timeStamp;

  final parent = IsarLink<Tracker>();
}
