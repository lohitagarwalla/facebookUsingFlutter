import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_shop/small_object_classes/like_and_commenet_info.dart';
import 'package:furniture_shop/small_object_classes/uplaoder_info.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:furniture_shop/small_object_classes/caption_widget.dart';
import 'package:furniture_shop/small_object_classes/like_comment_share_buttons.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool liked = false;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            UploaderInfo(
              icon: FontAwesomeIcons.globeAfrica,
              name: 'Lohit Agarwalla',
              time: '3 hrs.',
              imageString: 'images/profile_pic_small.jpg',
            ),
            CaptionWidget(
              caption: 'Big Bucky Bunny',
            ),
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            LikeAndCommentInfo(
              likedPerson: 'Mrinmoy Mahanta',
              likeCount: '56',
              commentCount: '5',
            ),
            LikeCommentShareButton(
              liked: liked,
              onTap: () {
                setState(() {
                  liked = !liked;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
