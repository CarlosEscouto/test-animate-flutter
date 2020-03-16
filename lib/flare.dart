import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:test_video/video.dart';

class Flare extends StatefulWidget {

  final bool isLoading;
  final VoidCallback indicatedCompletion;
  Flare(this.isLoading, {this.indicatedCompletion});

  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<Flare> 
  implements FlareController {

    PageController _controller = PageController(initialPage: 1);

    @override
    Widget build(BuildContext context) {

    final List<Widget> list = [
      Video(),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(255, 255, 255, 1),
      )
    ];

    final PageView pageView = PageView(
      children: list,
      controller: _controller,
      onPageChanged: (int index) => setState(() => print(index)),
    );

    return Scaffold(
      bottomNavigationBar: FlareActor(
        "assets/navbar.flr",
        alignment:Alignment.bottomCenter,
        // fit:BoxFit.contain,
        animation: '0',
        // controller: this,
      ),
      body: pageView
    );
  }

  ValueNotifier<bool> isActive;
  // ActorAnimation _animations;
  // double _animationTime = 0.0;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // _animationTime += _animations.duration;
    // _animations.apply(_animationTime, artboard, 1.0);

    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    // _animations = artboard.getAnimation("Animations");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

}