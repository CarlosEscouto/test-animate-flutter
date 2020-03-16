import 'dart:async';
import 'dart:math';

import 'package:test_video/flare.dart';
import 'package:test_video/video.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  bool _isLoading;
  @override
  void initState() {
    // Start loading...
    _isLoading = true;

    // This would be based off of some async action, for now just complete
    // loading after some random time between 1 and 3 seconds.
    // We use a random time to show that the animation will wait for the loop
    // to complete properly.
    Timer(Duration(milliseconds: 1000+Random().nextInt(2000)), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Flare(_isLoading, indicatedCompletion: () => print('Carlos')),
      // home: Video(),
    );
  }

}