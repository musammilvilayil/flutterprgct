import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechService {
  SpeechService() : _tts = FlutterTts(), _stt = stt.SpeechToText();
  final FlutterTts _tts;
  final stt.SpeechToText _stt;

  Future<void> speak(String text) async {
    await _tts.stop();
    await _tts.setSpeechRate(0.45);
    await _tts.speak(text);
  }

  Future<void> stopSpeaking() => _tts.stop();

  Future<bool> startOfflineRecognition(void Function(String) onText) async {
    final ready = await _stt.initialize();
    if (!ready) return false;
    await _stt.listen(
      onResult: (result) => onText(result.recognizedWords),
      onDevice: true,
      partialResults: true,
      listenMode: stt.ListenMode.confirmation,
    );
    return true;
  }

  Future<void> stopListening() => _stt.stop();
  bool get isListening => _stt.isListening;
  void dispose() { _tts.stop(); _stt.cancel(); }
}
