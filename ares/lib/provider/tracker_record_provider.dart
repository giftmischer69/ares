import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ares/models/tracker_record.dart';

class TrackerRecordProvider with ChangeNotifier {
  TrackerRecordProvider() {
    init();
  }

  List<TrackerRecord> _records = [];

  List<TrackerRecord> get records => _records;

  late Isar isar;

  void init() {
    isar = Isar.openSync([TrackerRecordSchema]);
    _records = isar.trackerRecords.where().findAllSync();
    print("notifyListeners");
    notifyListeners();
  }

  void addRecord(TrackerRecord record) {
    isar.writeTxnSync(() {
      isar.trackerRecords.putSync(record);
    });
    _records.add(record);

    print("notifyListeners");
    notifyListeners();
  }

  void deleteTracker(TrackerRecord record) {
    isar.writeTxnSync(() {
      bool deleted = isar.trackerRecords.deleteSync(record.id);
      if (deleted) _records.remove(record);
      print("notifyListeners");
      notifyListeners();
    });
  }
}
