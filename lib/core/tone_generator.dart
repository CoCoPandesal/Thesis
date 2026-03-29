import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

/// Simple tone generator for guide tones
class ToneGenerator {
  final AudioPlayer _player = AudioPlayer();
  bool _isDisposed = false;

  /// Play a tone at specified frequency
  /// Note: This is a simplified version. For accurate pitch generation,
  /// you may want to use a synthesizer plugin or pre-generated audio files
  Future<void> playTone(double frequencyHz, {required int durationMs}) async {
    if (_isDisposed) return;

    try {
      // For now, play a beep sound
      // In production, generate sine wave at frequencyHz
      await _player.setAsset('assets/sounds/beep.mp3');
      await _player.play();

      // Auto-stop after duration
      Future.delayed(Duration(milliseconds: durationMs), () {
        if (!_isDisposed && _player.playing) {
          _player.stop();
        }
      });
    } catch (e) {
      debugPrint('ToneGenerator.playTone() error: $e');
    }
  }

  /// Stop playing
  Future<void> stop() async {
    if (_isDisposed) return;
    try {
      await _player.stop();
    } catch (e) {
      debugPrint('ToneGenerator.stop() error: $e');
    }
  }

  /// Dispose resources
  void dispose() {
    _isDisposed = true;
    _player.dispose();
  }
}
