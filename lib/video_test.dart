import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideo extends StatefulWidget {
  const MyVideo({Key? key}) : super(key: key);

  @override
  _MyVideoState createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  late VideoPlayerController _playerController;

  @override
  void initState() {
    _playerController = VideoPlayerController.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4");
    _playerController.addListener(() {setState(() {

    });});
    _playerController.setLooping(true);
    _playerController.initialize().then((_) => setState(() {}));
    _playerController.play();
    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppbar,
        body: _buildBody,
      ),
    );
  }



  get _buildAppbar {
    return AppBar(
      title: Text("Desktop Video"),
    );
  }

  get _buildBody {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: VideoPlayer(_playerController)
    );
  }
// get _buildBody{
//   return Container(
//     child:_playerController.value.isInitialized ? AspectRatio(
//       aspectRatio: _playerController.value.aspectRatio,
//       child: VideoPlayer(_playerController),
//     ) : CircularProgressIndicator(),
//   );
// }

}
