import 'package:flutter/material.dart';
import '../../db.dart';

class IncrementTrackerWidget extends StatefulWidget {
  const IncrementTrackerWidget({super.key});

  @override
  _IncrementTrackerState createState() => _IncrementTrackerState();
}

class _IncrementTrackerState extends State<IncrementTrackerWidget> {
  late Future<List<IncrementTrackerRecord>> _future =
      database.select(database.incrementTrackerRecords).get();
  final database = MyDatabase();

  Future<void> _addRecord() async {
    await database.into(database.incrementTrackerRecords).insert(
        IncrementTrackerRecordsCompanion.insert(timeStamp: DateTime.now()));
    setState(() {
      _future = database.select(database.incrementTrackerRecords).get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayLarge!,
      textAlign: TextAlign.center,
      child: FutureBuilder<List<IncrementTrackerRecord>>(
        future: _future, // a previously-obtained Future<String> or null
        builder: (BuildContext context,
            AsyncSnapshot<List<IncrementTrackerRecord>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Material(
                color: Colors.transparent,
                shape: CircleBorder(
                    side: BorderSide(
                  color: Colors.black,
                  width: 3,
                )),
                child: Icon(Icons.check_rounded, color: Colors.black, size: 50),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Upper",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "Lower",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  Row()
                ],
              ),
              Center(
                child: Text("Entries: ${snapshot.data!.length}",
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.exposure_plus_1),
                tooltip: 'Increment',
                onPressed: _addRecord,
                iconSize: 40,
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: OutlinedButton(
              child: Row(
                children: children,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const IncrementTrackerWidgetRoute()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class IncrementTrackerWidgetRoute extends StatelessWidget {
  const IncrementTrackerWidgetRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IncrementTracker Statistics"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
