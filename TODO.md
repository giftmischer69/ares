# TODO

- [ ] write out manifesto

- [ ] simple widget with persistence
  - [ ] Database functionality / persistence
    - [ ] Database Problem solved! use isar
    - [ ] <https://pub.dev/packages/isar>
      - [ ] One list of Records per widget Type
      - [ ] Also persist settings (eg. Dark Mode)
  - [ ] UI functionality / look
  - [ ] MVP

- [ ] ui should look like fitbit app

- [ ] widgets in development
  - [ ] daily (and/or periodic) reminder
    - [ ] ui: calendar icon, title, underneath title: x day streak, plus button
    - [ ] on_click -> open daily_reminder_statistics_route
    - [ ] on_click on plus button -> add the day to successful days list
    - [ ] get reminder at a specific time
    - [ ] TODO: Support for multiple instances of this widget
      - [X] Problem: Need a database table with records: id, widget_id, timestamp.
      - [X] Problem: This has to be limited to n slots or somehow dynamically created
      - [X] Possible Solution: have an extra field: blob (json) for additional dynamic widget data per record
      - [X] Possible Solution: use [NoSQL DB (eg. hive)](https://pub.dev/packages/hive) and only store dynamic JSON
      - [ ] Implementation

- [ ] planned widgets

Done

- [X] [Reference](https://docs.flutter.dev/cookbook/persistence/sqlite)
  - [X] pagckage: sqflite only works on android and macos, not on windows or web so a new solution to persistence should be analyzed
  - [X] solution: use package [drift (all plattforms)](https://drift.simonbinder.eu/docs/getting-started/)
