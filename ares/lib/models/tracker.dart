import 'package:isar/isar.dart';

part 'tracker.g.dart';

@Collection()
class Tracker {
  int id = Isar.autoIncrement;

  late DateTime timeStamp;

  late String data = "";

  late bool isImportant = false;
}
