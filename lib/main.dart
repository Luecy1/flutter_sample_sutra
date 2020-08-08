import 'package:flutter/material.dart';
import 'package:flutter_sample_sutra/screen/event_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        accentColor: Colors.pink[800],
        brightness: Brightness.light,
      ),
      home: EventListScreen(),
    );
  }
}
