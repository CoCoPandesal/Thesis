import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';

/// Audio recording service that captures pitch data from microphone
class AudioService {
  final AudioRecorder _recorder = AudioRecorder();
  final StreamController<PitchResult?> _resultsController =
      StreamController<PitchResult?>.broadcast();
  bool _isRecording = false;

  /// Stream of pitch detection results
  Stream<PitchResult?> get results => _resultsController.stream;

  /// Start recording and pitch detection
  Future<bool> start() async {
    try {
      // Request microphone permission
      final status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }

      // Check if already recording
      if (await _recorder.isRecording()) {
        await _recorder.stop();
      }

      // Configure and start recording
      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.pcm16bits,
          sampleRate: 44100,
          numChannels: 1,
        ),
        path: '', // Don't save to file, just stream
      );

      _isRecording = true;

      // Start processing audio stream
      _processAudioStream();

      return true;
    } catch (e) {
      debugPrint('AudioService.start() error: $e');
      return false;
    }
  }

  /// Stop recording
  Future<void> stop() async {
    _isRecording = false;
    try {
      if (await _recorder.isRecording()) {
        await _recorder.stop();
      }
    } catch (e) {
      debugPrint('AudioService.stop() error: $e');
    }
  }

  /// Dispose resources
  void dispose() {
    _isRecording = false;
    _resultsController.close();
    _recorder.dispose();
  }

  /// Process audio stream and detect pitch
  void _processAudioStream() async {
    // This is a simplified pitch detection
    // In production, you'd use a proper pitch detection algorithm
    final stream = await _recorder.startStream(
      const RecordConfig(
        encoder: AudioEncoder.pcm16bits,
        sampleRate: 44100,
        numChannels: 1,
      ),
    );

    stream.listen(
      (buffer) {
        // Simple pitch detection simulation
        // Replace with actual pitch detection algorithm
        final amplitude = _calculateAmplitude(buffer);
        if (amplitude > 0.01) {
          // Simulate pitch detection
          final frequency = _detectPitch(buffer);
          _resultsController.add(
            PitchResult(
              frequency: frequency,
              amplitude: amplitude,
              timestamp: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        } else {
          _resultsController.add(null);
        }
      },
      onError: (error) {
        debugPrint('Audio stream error: $error');
        _resultsController.add(null);
      },
    );
  }

  /// Calculate amplitude from audio buffer
  double _calculateAmplitude(List<int> buffer) {
    if (buffer.isEmpty) return 0.0;

    double sum = 0.0;
    for (int i = 0; i < buffer.length; i += 2) {
      if (i + 1 < buffer.length) {
        final sample = (buffer[i] | (buffer[i + 1] << 8)).toSigned(16);
        sum += sample * sample;
      }
    }

    return (sum / (buffer.length / 2)).clamp(0.0, 1.0);
  }

  /// Simple pitch detection (placeholder)
  /// Replace with YIN or autocorrelation algorithm
  double _detectPitch(List<int> buffer) {
    // Placeholder: return simulated frequency
    // In production, implement proper pitch detection
    return 440.0; // A4 note
  }

  bool get isRecording => _isRecording;
}

/// Pitch detection result
class PitchResult {
  final double frequency;
  final double amplitude;
  final int timestamp;

  PitchResult({
    required this.frequency,
    required this.amplitude,
    required this.timestamp,
  });

  @override
  String toString() =>
      'PitchResult(frequency: ${frequency.toStringAsFixed(1)} Hz, amplitude: ${amplitude.toStringAsFixed(3)})';
}
