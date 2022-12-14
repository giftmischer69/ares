import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ares/models/tracker.dart';

class TrackerProvider with ChangeNotifier {
  TrackerProvider({required this.isar}) {
    init();
  }

  final Isar isar;

  List<Tracker> _trackers = [];

  List<Tracker> get trackers => _trackers;

  void init() {
    _trackers = isar.trackers.where().findAllSync();
    notifyListeners();
  }

  void addTracker(Tracker tracker) {
    isar.writeTxnSync(() {
      isar.trackers.putSync(tracker);
    });
    _trackers.add(tracker);

    notifyListeners();
  }

  void deleteTracker(Tracker tracker) {
    isar.writeTxnSync(() {
      bool deleted = isar.trackers.deleteSync(tracker.id);
      if (deleted) _trackers.remove(tracker);
      notifyListeners();
    });
  }
  /*
  void toggleImp(int id) async {
    await isar!.writeTxn(() {
      Tracker? todo = await isar.trackers.get(id);
      todo!.isImportant = !todo.isImportant;
      await isar.trackers.put(todo);
      int todoIndex = trackers.indexWhere((todo) => todo.id == id);
      trackers[todoIndex].isImportant = todo.isImportant;
      notifyListeners();
    });
  }
  */
}
