import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:hyll_test/core/core.dart';
import 'package:iconsax/iconsax.dart';

class AppVideoPlayer extends StatefulWidget {
  const AppVideoPlayer({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late final CachedVideoPlayerController _controller;
  bool _showControls = true;
  @override
  void initState() {
    super.initState();

    _controller = CachedVideoPlayerController.network(
      Uri.parse(widget.videoUrl).toString(),
    );
    _controller.setLooping(true);
    _controller.initialize().then((_) {
      setState(() {
        _controller.play();
        _showControls = !_showControls;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _showControls = !_showControls;
          });
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CachedVideoPlayer(_controller),
              ),
            ),
            Positioned(
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: !_showControls ? 0 : 1,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _showControls = !_showControls;
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Iconsax.pause_circle
                            : Iconsax.play_circle,
                        size: 60,
                        color: Colors.white,
                      )),
                ),
              ),
            )
          ],
        ),
      );
    }
    return const AppLoader();
  }
}
