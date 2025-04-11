import 'package:get/get.dart';
import '/../models/song_model.dart';
import 'package:just_audio/just_audio.dart';
import '/../service/audio_handler.dart';

class PlayerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  var currentSong = Rxn<Song>();
  var isPlaying = false.obs;
  var position = Duration.zero.obs;
  var duration = Duration(seconds: 1).obs;

  void playSong(Song song) async {
    currentSong.value = song;
    try {
      await _audioPlayer.setAsset(song.audioUrl);
      _audioPlayer.play();
      isPlaying.value = true;
      _listenToProgress();
    } catch (e) {
      print("Error loading asset audio: $e");
    }
  }

  void pauseSong() {
    _audioPlayer.pause();
    isPlaying.value = false;
  }

  void resume() {
    isPlaying.value = true;
    _audioPlayer.play();
  }

  void stop() {
    _audioPlayer.stop();
    isPlaying.value = false;
    currentSong.value = null;
  }

  void reset() async {
    await _audioPlayer.stop();
    await _audioPlayer.seek(Duration.zero);
    await _audioPlayer.play();
    isPlaying.value = true;
  }

  void seekTo(Duration position) {
    _audioPlayer.seek(position);
  }

  void _listenToProgress() {
    _audioPlayer.durationStream.listen((d) {
      if (d != null) duration.value = d;
    });
    _audioPlayer.positionStream.listen((p) {
      position.value = p;
    });
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
