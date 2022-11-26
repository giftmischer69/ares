import 'package:ares/models/tracker.dart';
import 'package:isar/isar.dart';

part 'record.g.dart';

@Collection()
class Record {
  int id = Isar.autoIncrement;

  late DateTime timeStamp;

  late String data = "";

  final parent = IsarLink<Tracker>();
}
