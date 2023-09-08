// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoScreen extends StatefulWidget {
  final String video;
  const VideoScreen({super.key, required this.video});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ChewieController? _chewieController;
  late VideoPlayerController videoPlayerController;
  Future intitVideo() async {
    videoPlayerController = VideoPlayerController.network(widget.video);
    await videoPlayerController.initialize();
    _chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    intitVideo();
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController?.dispose();
    videoPlayerController.pause();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: _chewieController != null
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(controller: _chewieController!),
                )
              : CircularProgressIndicator(
                  color: Colors.deepOrange,
                )),
    );
  }
}
