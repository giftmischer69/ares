import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

abstract class Tracker extends Widget {
  const Tracker({super.key});
  Id getId();
  Tracker fromJson(String instanceJson);
  String toJson();
}
