import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/../controller/player_controller.dart';

class SongDetailScreen extends StatelessWidget {
  final PlayerController playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final song = playerController.currentSong.value;
      if (song == null) {
        return Scaffold(
          appBar: AppBar(title: Text('Song Details')),
          body: Center(child: Text('No song selected')),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(song.title),
          leading: BackButton(),
          actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
        ),
        body: Column(
          children: [
            Image.asset(
              song.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              song.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '${song.artist} - ${song.album}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return IconButton(
                    icon: Icon(
                      playerController.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      if (playerController.isPlaying.value) {
                        playerController.pauseSong();
                      } else {
                        playerController.resume();
                      }
                    },
                  );
                }),
                IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: () {
                    playerController.reset();
                  },
                ),
              ],
            ),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() {
                  final position = playerController.position.value;
                  return Text(
                    '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 16),
                  );
                }),
                Obx(() {
                  final position = playerController.position.value;
                  final duration = playerController.duration.value;
                  return Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      playerController.seekTo(Duration(seconds: value.toInt()));
                    },
                  );
                }),
                Obx(() {
                  final duration = playerController.duration.value;
                  return Text(
                    '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 16),
                  );
                }),
              ],
            ),
          ],
        ),
      );
    });
  }
}
