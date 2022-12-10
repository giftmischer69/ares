import 'package:isar/isar.dart';

part 'tracker.g.dart';

@Collection()
class Tracker {
  Id id = Isar.autoIncrement;

  late String title;

  late String description;

  @enumerated
  late TrackerType type;

  @enumerated
  late ThemeColor color;
}

enum TrackerType { daily, rule, increment, log }

enum ThemeColor { backgrond, red, blue, green, yellow }
