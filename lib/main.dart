import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import '/../presentation/song_list/song_list_screen.dart';
import '/../presentation/song_detail/song_detail_screen.dart';
import '/../controller/player_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() => {
        Get.put(PlayerController()),
      }),
      home: SongListScreen(),
      getPages: [
        GetPage(name: '/detail', page: () => SongDetailScreen()),
      ],
    );
  }
}

