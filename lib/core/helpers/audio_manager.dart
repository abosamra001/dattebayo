import 'package:just_audio/just_audio.dart';

class AudioManager {
  AudioManager._();

  static final AudioManager i = AudioManager._();

  AudioPlayer? _player;

  Future<void> play(String sound) async {
    _player ??= AudioPlayer();
    await _player!.setAsset(sound);

    // if (_player!.playing) return;
    await _player!.seek(Duration.zero);
    _player!.play();
  }

  Future<void> stop(String sound) async {
    await _player?.stop();
  }

  Future<void> dispose() async {
    await _player?.dispose();
    _player = null;
  }
}
