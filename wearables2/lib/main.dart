import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wearables2/tts.dart';
import 'package:wearables2/watch_face.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TtsProvider(),
      child: MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: WatchFace(),
        ),
      ),
    );
  }
}
