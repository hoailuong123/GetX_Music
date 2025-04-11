import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/../controller/player_controller.dart';
import '/../models/song_model.dart';

class SongTitle extends StatelessWidget {
  final Song song;
  SongTitle({required this.song});
  final playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        song.imageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(
        song.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${song.artist} - ${song.album}',
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      onTap: () {
        final current = playerController.currentSong.value;
        if (current == null || current.title != song.title) {
          playerController.playSong(song);
        }
        playerController.currentSong.value = song;
        Get.toNamed('/detail');
      },
      trailing: Obx(() {
        final isPlaying = playerController.isPlaying.value;
        final isCurrent =
            playerController.currentSong.value?.title == song.title;

        if (isCurrent) {
          return IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              if (isPlaying) {
                playerController.pauseSong();
              } else {
                playerController.resume();
              }
            },
          );
        } else {
          return Icon(Icons.play_arrow);
        }
      }),
    );
  }
}
