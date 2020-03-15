import 'package:test_video/flare.dart';
import 'package:test_video/video.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Flare(),
      home: Video(),
    );
  }

}