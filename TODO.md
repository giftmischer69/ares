# TODO

- [ ] write out manifesto

- [ ] simple widget with persistence
  - [ ] [Reference](https://docs.flutter.dev/cookbook/persistence/sqlite)
    - [ ] pagckage: sqflite only works on android and macos, not on windows or web so a new solution to persistence should be analyzed

- [ ] ui should look like fitbit app

- [ ] widgets in development
  - [ ] daily (and/or periodic) reminder
    - [ ] ui: calendar icon, title, underneath title: x day streak, plus button
    - [ ] on_click -> open daily_reminder_statistics_route
    - [ ] on_click on plus button -> add the day to successful days list
    - [ ] get reminder at a specific time
    - [ ] TODO: Support for multiple instances of this widget
      - [ ] Problem: Need a database table with records: id, widget_id, timestamp.
      - [ ] Problem: This has to be limited to n slots or somehow dynamically created
      - [ ] Possible Solution: have an extra field: blob (json) for additional dynamic widget data per record
      - [ ] Possible Solution: use NoSQL DB and only store dynamic JSON

- [ ] planned widgets
