import 'package:flutter/material.dart';

int itemCount = 5;
List<bool> selected = <bool>[];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    for (var i = 0; i < itemCount; i++) {
      selected.add(false);
    }
    super.initState();
  }

  Icon firstIcon = Icon(
    Icons.radio_button_on, // Icons.favorite
    color: Colors.blueAccent, // Colors.red
    size: 35,
  );
  Icon secondIcon = Icon(
    Icons.radio_button_unchecked, // Icons.favorite_border
    color: Colors.grey,
    size: 35,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              return IconButton(
                icon: selected.elementAt(index) ? firstIcon : secondIcon,
                onPressed: () {
                  try {
                    // your code that you want this IconButton do
                    setState(() {
                      selected[index] = !selected.elementAt(index);
                    });
                    print('tap on ${index + 1}th IconButton ( change to : ');
                    print(selected[index] ? 'active' : 'deactive' + ' )');
                  } catch (e) {
                    print(e);
                  }
                },
              );
            }),
      ),
    );
  }
}
