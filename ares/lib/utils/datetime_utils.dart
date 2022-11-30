extension DateTimeUtils on DateTime {
  DateTime intoDay() {
    return DateTime.utc(year, month, day);
  }
}
