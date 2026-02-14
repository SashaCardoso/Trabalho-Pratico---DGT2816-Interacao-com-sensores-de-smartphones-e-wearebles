import 'package:audio_session/audio_session.dart';

class AudioHelper {
  final session = AudioSession.instance;
  late final AndroidAudioManager audioManager;

  AudioHelper() {
    audioManager = AndroidAudioManager();
  }

  void setDeviceAddedListener(Function() callback) {
    audioManager.setAudioDevicesAddedListener((devices) {
      callback();
    });
  }
}