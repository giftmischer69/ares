import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ares/models/tracker_record.dart';

class TrackerRecordProvider with ChangeNotifier {
  TrackerRecordProvider({required this.isar}) {
    init();
  }
  final Isar isar;

  List<TrackerRecord> _records = [];

  List<TrackerRecord> get records => _records;

  void init() {
    _records = isar.trackerRecords.where().findAllSync();
    notifyListeners();
  }

  void addRecord(TrackerRecord record) {
    isar.writeTxnSync(() {
      isar.trackerRecords.putSync(record);
    });
    _records.add(record);

    notifyListeners();
  }

  void deleteRecord(TrackerRecord record) {
    isar.writeTxnSync(() {
      bool deleted = isar.trackerRecords.deleteSync(record.id);
      if (deleted) _records.remove(record);
      notifyListeners();
    });
  }
}
