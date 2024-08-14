import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class Play extends StatefulWidget {
  //Recupera o Id do video da tela anteriro
  final String video_id;
  Play({required this.video_id, Key? key}) : super(key: key);

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  //Cria o controller do youtube play
  late YoutubePlayerController _controller;

  bool _isRunning = true;

  //instância o controller
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video_id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  //caso feche o video o controle é encerrado e caso esteja em tela cheia volta ao padrão
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => handleVideoInteraction(),
      child: Container(
        color: const Color.fromARGB(255, 54, 54, 54),
        child: Center(
          //Widget para reproduzir o video
          child: Stack(
            children: [
              Center(
                child: YoutubePlayer(
                  controller: _controller,
                ),
              ),
              // if (!_isRunning)
              // Center(
              //   child: IconButton(
              //     onPressed: () => handleVideoInteraction(),
              //     icon: const Icon(
              //       Icons.play_arrow,
              //       color: Colors.white,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    ));
  }

  void handleVideoInteraction() {
    setState(() {
      _isRunning = !_isRunning;

      _isRunning ? _controller.pause() : _controller.play();
    });
  }
}
