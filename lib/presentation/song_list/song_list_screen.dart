import 'package:flutter/material.dart';
import '/../models/song_model.dart';
import 'package:get/get.dart';
import '/../controller/player_controller.dart';
import '/../widgets/song_title.dart';

class SongListScreen extends StatelessWidget {
  final List<Song> songs = [
    Song(
      title: 'Make You Feel My Love',
      artist: 'Shane Filan',
      album: 'Album 1',
      imageUrl: 'assets/images/make_u_feel_my_love.jpg',
      audioUrl: 'assets/audio/make_u_feel_my_love.mp3',
    ),
    Song(
      title: 'You Are The Reason',
      artist: 'Calum Scott',
      album: 'Album 2',
      imageUrl: 'assets/images/you_are_the_reason.jpg',
      audioUrl: 'assets/audio/you_are_the_reason.mp3',
    ),
    Song(
      title: 'Comthru',
      artist: 'Jeremy Zucker',
      album: 'Album 3',
      imageUrl: 'assets/images/comethru.jpg',
      audioUrl: 'assets/audio/comethru.mp3',
    ),
    Song(
      title: 'Phép màu',
      artist: 'Minh Tốc',
      album: 'Album 4',
      imageUrl: 'assets/images/phep_mau.jpg',
      audioUrl: 'assets/audio/phep_mau.mp3',
    ),
    Song(
      title: 'Hành khúc ngày và đêm',
      artist: 'Trọng Tấn',
      album: 'Album 5',
      imageUrl: 'assets/images/hanh_khuc.jpg',
      audioUrl: 'assets/audio/hanh_khuc.mp3',
    ),
    Song(
      title: 'Mẹ Yêu Con',
      artist: 'Anh Trai Say Hi',
      album: 'Album 6',
      imageUrl: 'assets/images/me_yeu_con.jpg',
      audioUrl: 'assets/audio/me_yeu_con.mp3',
    ),
    Song(
      title: 'Ngáo Ngơ',
      artist: 'Anh Trai Say Hi',
      album: 'Album 7',
      imageUrl: 'assets/images/ngao_ngo.jpg',
      audioUrl: 'assets/audio/ngao_ngo.mp3',
    ),
    Song(
      title: 'Tháp Rơi Tự Do',
      artist: '跳楼机',
      album: 'Album 8',
      imageUrl: 'assets/images/thap_roi_tu_do.jpg',
      audioUrl: 'assets/audio/thap_roi_tu_do.mp3',
    ),
    Song(
      title: 'Tình Đầu Quá Chén',
      artist: 'Quang Hùng MasterD',
      album: 'album 9',
      imageUrl: 'assets/images/tinh_dau_qua_chen.jpg',
      audioUrl: 'assets/audio/tinh_dau_qua_chen.mp3',
    ),
    Song(
      title: 'Trống Cơm',
      artist: 'Anh trai Vượt Ngàn Chông Gai',
      album: 'album 10',
      imageUrl: 'assets/images/trong_com.jpg',
      audioUrl: 'assets/audio/trong_com.mp3',
    ),
    Song(
      title: '34+35',
      artist: 'Arina Grande',
      album: 'album 11',
      imageUrl: 'assets/images/34_35.jpg',
      audioUrl: 'assets/audio/34_35.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Songs')),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return SongTitle(song: songs[index]);
        },
      ),
    );
  }
}
