import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Flare extends StatefulWidget {
  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<Flare> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.bottomCenter,
      child: FlareActor(
        "assets/navbar.flr",
        alignment:Alignment.center,
        fit:BoxFit.contain,
        animation:"3_1",
      ),
    );
  }
}