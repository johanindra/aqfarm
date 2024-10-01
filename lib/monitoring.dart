import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MonitoringScreen extends StatefulWidget {
  @override
  _MonitoringScreenState createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;

  @override
  void initState() {
    super.initState();
    // URL video dari YouTube
    final videoId1 = YoutubePlayer.convertUrlToId(
        "https://youtu.be/N1jiCKMMgeA?feature=shared");
    final videoId2 = YoutubePlayer.convertUrlToId(
        "https://youtu.be/8VX-iuy34yY?feature=shared");

    // Inisialisasi controller dengan video ID
    _controller1 = YoutubePlayerController(
      initialVideoId: videoId1!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    _controller2 = YoutubePlayerController(
      initialVideoId: videoId2!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Monitor Kamera",
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Video Monitoring",
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              // ),
              // SizedBox(height: 20),
              // Card untuk video pertama
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kamera 1 : Amoniak Sensor",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      YoutubePlayer(
                        controller: _controller1,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Color(0xFF62CDFA),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Card untuk video kedua
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kamera 2 : Ketinggian Air",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      YoutubePlayer(
                        controller: _controller2,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Color(0xFF62CDFA),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
