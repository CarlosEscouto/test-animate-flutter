import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Flare extends StatefulWidget {
  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<Flare> {
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      "assets/navbar.flr",
      alignment:Alignment.bottomCenter,
      fit:BoxFit.contain,
      animation:"0",
    );
  }
}