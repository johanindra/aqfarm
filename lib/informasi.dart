import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InformasiScreen extends StatefulWidget {
  @override
  _InformasiScreenState createState() => _InformasiScreenState();
}

class _InformasiScreenState extends State<InformasiScreen> {
  // late YoutubePlayerController _controller1;
  // late YoutubePlayerController _controller2;

  // @override
  // void initState() {
  //   super.initState();
  //   // URL video dari YouTube
  //   final videoId1 = YoutubePlayer.convertUrlToId(
  //       "https://youtu.be/N1jiCKMMgeA?feature=shared");
  //   final videoId2 = YoutubePlayer.convertUrlToId(
  //       "https://youtu.be/8VX-iuy34yY?feature=shared");

  //   // Inisialisasi controller dengan video ID
  //   _controller1 = YoutubePlayerController(
  //     initialVideoId: videoId1!,
  //     flags: YoutubePlayerFlags(
  //       autoPlay: false,
  //       mute: false,
  //     ),
  //   );

  //   _controller2 = YoutubePlayerController(
  //     initialVideoId: videoId2!,
  //     flags: YoutubePlayerFlags(
  //       autoPlay: false,
  //       mute: false,
  //     ),
  //   );
  // }

  // @override
  // void dispose() {
  //   _controller1.dispose();
  //   _controller2.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // backgroundColor: Color(0xFF62CDFA),
        centerTitle: true,
      ),
      body: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Color(0xFF62CDFA), Color(0xFF2A9D8F)],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   ),
          // ),
          ),
    );
  }
}
