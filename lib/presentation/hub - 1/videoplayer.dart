import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends GetView<VideoPlayerController> {
  // Extend GetView

  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final VideoPlayerController _videoPlayerController =
        VideoPlayerController.network(videoUrl);
    final ChewieController _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false, // Set to true if you want the video to loop
    );

    return Scaffold(
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
