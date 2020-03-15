import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController
      // .network('https://www.w3schools.com/html/mov_bbb.mp4') // Link
      .asset('assets/flamengo.mp4') // Arquivo
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    
  }

  @override
  Widget build(BuildContext context) {
    _controller.play();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: _controller.value.initialized
            ? Container(
              width: MediaQuery.of(context).size.width,
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
                minWidth: MediaQuery.of(context).size.width - 40,
              ),
              padding: EdgeInsets.fromLTRB(0, 500, 0, 0),
            )
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }
}