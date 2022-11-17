import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      title: "ares",
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MainRoute(),
    );
  }
}

class MainRoute extends StatelessWidget {
  const MainRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title Text"),
      ),
      body: const Center(
        child: Text(
          'Body Text',
        ),
      ),
    );
  }
}
