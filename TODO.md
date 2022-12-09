# TODO

- [ ] write out manifesto

- [X] simple widget with persistence
  - [X] Database functionality / persistence
    - [X] Database Problem solved! use isar
    - [X] <https://pub.dev/packages/isar>
      - [X] One list of Records per widget Type
      - [ ] Also persist settings (eg. Dark Mode)
      - [ ] Helper Classes for Rendering
  - [ ] UI functionality / look
    - [ ] Colors should depend on theme
    - [ ] Save specific Accent Color for each TrackerWidget
    - [ ] ui should look like fitbit app
  - [ ] MVP

- [ ] [Dark Theme](https://medium.flutterdevs.com/implement-dark-mode-in-flutter-using-provider-158925112bf9)
  - [ ] <https://pub.dev/packages/adaptive_theme>

- [ ] widgets in development
  - [ ] daily (and/or periodic) reminder
    - [ ] ui: calendar icon, title, underneath title: x day streak, plus button
    - [ ] on_click -> open daily_reminder_statistics_route
    - [ ] on_click on plus button -> add the day to successful days list
    - [ ] get reminder at a specific time

- [ ] planned widgets
  - [ ] DailyLogTracker
    - [ ] Write at least one sentence per day at a specific time
    - [ ] like bereal just for private jorunal entries
    - [ ] send notification
    - [ ] enter text screen

Done

- [X] [Reference](https://docs.flutter.dev/cookbook/persistence/sqlite)
  - [X] pagckage: sqflite only works on android and macos, not on windows or web so a new solution to persistence should be analyzed
  - [X] solution: use package [drift (all plattforms)](https://drift.simonbinder.eu/docs/getting-started/)
