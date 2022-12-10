import 'package:ares/models/tracker.dart';
import 'package:ares/utils/extensions.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
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

// Create a Form widget.
class AddTrackerForm extends StatefulWidget {
  const AddTrackerForm({super.key});

  @override
  AddTrackerFormState createState() {
    return AddTrackerFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class AddTrackerFormState extends State<AddTrackerForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;
  TrackerType dropdownValue = TrackerType.daily;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Material(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Tracker",
                style: Theme.of(context).textTheme.headline4,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Tracker Title';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Title',
                ),
                onChanged: (value) => title = value,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Tracker Description';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Description',
                ),
                onChanged: (value) => description = value,
              ),
              DropdownButtonFormField(
                value: dropdownValue,
                items: TrackerType.values
                    .map<DropdownMenuItem<TrackerType>>((TrackerType value) {
                  return DropdownMenuItem<TrackerType>(
                    value: value,
                    child: Text(
                      "${value.name.toTitleCase()}",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
                onChanged: (Object? value) {
                  setState(() {
                    dropdownValue = value! as TrackerType;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        // TODO actually add tracker
                        const SnackBar(content: Text('Added Tracker')),
                      );

                      switch (dropdownValue) {
                        case TrackerType.daily:
                          // TODO add tracker
                          print("TODO add tracker");
                          break;
                      }

                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
