import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key});

  @override
  _Pantalla2State createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  double _volume = 1.0; // Control de volumen
  double _seekValue = 0.0; // Control de avance del video

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador del video
    _controller = VideoPlayerController.network(
      'https://www.w3schools.com/html/mov_bbb.mp4', // URL del video
    )
      ..initialize().then((_) {
        setState(() {}); // Actualiza la UI una vez que el video esté listo
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera el controlador al salir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproductor de Video'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Vista previa del video
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          else
            const Center(child: CircularProgressIndicator()),

          const SizedBox(height: 20),

          // Controles del reproductor
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                      _isPlaying = false;
                    } else {
                      _controller.play();
                      _isPlaying = true;
                    }
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop),
                onPressed: () {
                  setState(() {
                    _controller.pause();
                    _controller.seekTo(const Duration(seconds: 0));
                    _isPlaying = false;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.replay_10),
                onPressed: () {
                  setState(() {
                    final position = _controller.value.position;
                    _controller.seekTo(position - const Duration(seconds: 10));
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.forward_10),
                onPressed: () {
                  setState(() {
                    final position = _controller.value.position;
                    _controller.seekTo(position + const Duration(seconds: 10));
                  });
                },
              ),
            ],
          ),

          // Control de volumen
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Volumen'),
              Slider(
                value: _volume,
                min: 0.0,
                max: 1.0,
                onChanged: (value) {
                  setState(() {
                    _volume = value;
                    _controller.setVolume(_volume);
                  });
                },
              ),
            ],
          ),

          // Control de progreso del video
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Progreso'),
              Slider(
                value: _seekValue,
                min: 0.0,
                max: _controller.value.duration.inSeconds.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _seekValue = value;
                    _controller.seekTo(Duration(seconds: value.toInt()));
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
