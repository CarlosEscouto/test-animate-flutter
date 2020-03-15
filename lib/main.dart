import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(VideoApp());

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

///
/// CONTROLLER DO FLARE - NÃO ESTA USANDO ...
/// 
//class FlareControl extends FlareController {
//   @override
//   bool advance(a, b) {
//     return true;
//   }
//   @override
//   initialize(FlutterActorArtboard a) {}
//   @override
//   setViewTransform(a) {}
// }

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    /// 
    /// Controller por arquivo
    /// 
    _controller = VideoPlayerController.asset(
      'assets/flamengo.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    
    ///
    /// Implementação por link
    /// 
    // VideoPlayerController.network(
    //     'https://www.w3schools.com/html/mov_bbb.mp4')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
  }

  /// 
  /// Build do Flare
  /// 
  // @override
  // Widget build(BuildContext context) {
  //   return new FlareActor(
  //     "assets/fastbuy-delivery-1.flr",
  //     alignment:Alignment.center,
  //     fit:BoxFit.contain,
  //     animation:"Animations",
  //   );
  // }

  ///
  /// Build do Video
  /// 
  @override
  Widget build(BuildContext context) {
    _controller.play();

    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: _controller.value.initialized
            ? Container(
              width: 500, // Certo é usar MediaQuery
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ))
            : Container(
              color: Color.fromRGBO(0, 60, 200, 1),
            ),
            ),
            Center(
              heightFactor: 30,
              child: Container(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      // _controller.value.isPlaying
                      //     ? _controller.pause()
                      //     : _controller.play();
                    });
                  },
                  child: Text('Entrar', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  height: 45,
                  textColor: Color.fromRGBO(167, 1, 4, 1),
                  color: Color.fromRGBO(255, 255, 255, 1),
                  shape: StadiumBorder(),
                  minWidth: 350, // Certo é usar MediaQuery
                ),
                padding: EdgeInsets.fromLTRB(0, 500, 0, 0),
              )
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }
}