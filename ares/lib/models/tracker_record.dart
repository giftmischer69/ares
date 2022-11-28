import 'package:isar/isar.dart';
import 'package:ares/models/tracker.dart';

part 'tracker_record.g.dart';

@Collection()
class TrackerRecord {
  Id id = Isar.autoIncrement;

  late DateTime timeStamp;

  final parent = IsarLink<Tracker>();
}
