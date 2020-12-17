import 'package:flutter/material.dart';
import 'package:theme_toggle/theme_toggle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String theme = "Light";
  bool change = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
ThemeToggle(
  iconOffSize: 30,
  iconOnSize: 30,
  rotation: true,
  onChanged: (bool change) {
    setState(() {
      change = !change;
      change ? theme = 'Dark' : theme = 'Light';
    });
  },
),
            Text(theme),
          ],
        ),
      ),
    );
  }
}
