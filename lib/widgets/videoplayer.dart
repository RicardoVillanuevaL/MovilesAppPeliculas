import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String heroID;
  VideoPlayerScreen({Key? key, required this.heroID}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    final temp = widget.heroID;
    print(temp);
    String video = '';
    if (temp == '/2jVVDtDaeMxmcvrz2SNyhMcYtWc.jpg') { //VENOM
    video = 'https://drive.google.com/uc?export=view&id=1FFQrq5nkW8CkHta47qUCl9iwy14pBiCb';

    } else if ( temp == '/9VqajJXm29uprSaxOcEh7O0d6E9.jpg' ) { //SHANG SHI
      video  = 'https://drive.google.com/uc?export=view&id=1LbgSQjvQ8jRzX0i4NSRVbptRmSsZXSAZ';
    }
    else {
      video = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
    }
    _controller = VideoPlayerController.network(video);
    _initializeVideoPlayerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    // Asegúrate de hacer dispose del VideoPlayerController para liberar los recursos
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Trailer',style:  TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black) ,
      ),
      body: Center(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
