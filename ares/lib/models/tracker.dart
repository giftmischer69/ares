import 'package:isar/isar.dart';

part 'tracker.g.dart';

@Collection()
class Tracker {
  Id id = Isar.autoIncrement;

  late String title;

  late String description;

  @enumerated
  late TrackerType type;

  late String colorHex;
}

enum TrackerType { daily, rule, increment, log }
