import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Direct extends StatefulWidget {
  const Direct({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Direct();
  }
}

class _Direct extends State<Direct> {
  //
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'l8PMl7tUDIE',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );
  //
  //https://youtube.com/live/Z68wBvGn2c8?feature=share
  //

  @override
  void initState() {
    super.initState();
    //
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(
        "https://youtube.com/live/Z68wBvGn2c8?feature=share");
    //
    _controller = YoutubePlayerController(
      initialVideoId: 'Z68wBvGn2c8',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    print(videoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Column(
            children: [
              // some widgets
              player,
              //some other widgets
            ],
          );
        },
      ),
    );
  }
}
