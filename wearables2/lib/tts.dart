import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsProvider with ChangeNotifier {
  final FlutterTts flutterTts = FlutterTts();

  Future<bool> speak(String text) async {
    var isComplete = false;
    flutterTts.setCompletionHandler(() {
      isComplete = true;
    });
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(text);
    return isComplete;
  }
}