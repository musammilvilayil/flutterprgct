import 'package:flutter/material.dart';
import '../../core/services/speech_service.dart';
import '../../core/settings/app_settings.dart';

class SpeechScreen extends StatefulWidget { const SpeechScreen({super.key, required this.settings}); final AppSettings settings; @override State<SpeechScreen> createState() => _SpeechScreenState(); }
class _SpeechScreenState extends State<SpeechScreen> {
  final _service = SpeechService(); final _controller = TextEditingController(); String? _error;
  @override void dispose() { _service.dispose(); _controller.dispose(); super.dispose(); }
  Future<void> _listen() async { setState(() => _error = null); if (_service.isListening) { await _service.stopListening(); if (mounted) setState(() {}); return; } final ready = await _service.startOfflineRecognition((text) { _controller.text = text; if (mounted) setState(() {}); }); if (!ready && mounted) setState(() => _error = 'Offline speech recognition is unavailable. Install an offline language pack in Android Settings, then try again.'); }
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Speech')), body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    const Text('Speech recognition is requested in on-device mode; Android must have a matching offline language installed.'), const SizedBox(height: 16),
    Expanded(child: TextField(controller: _controller, maxLines: null, expands: true, onChanged: (_) => setState(() {}), decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Recognized or typed text'))),
    if (_error != null) Padding(padding: const EdgeInsets.only(top: 12), child: Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error))), const SizedBox(height: 12),
    Wrap(spacing: 12, runSpacing: 8, children: [FilledButton.icon(onPressed: _listen, icon: Icon(_service.isListening ? Icons.stop : Icons.mic), label: Text(_service.isListening ? 'Stop listening' : 'Listen offline')), OutlinedButton.icon(onPressed: _controller.text.trim().isEmpty ? null : () => _service.speak(_controller.text), icon: const Icon(Icons.volume_up), label: const Text('Read aloud')), TextButton(onPressed: () { _controller.clear(); setState(() {}); }, child: const Text('Clear'))])
  ])));
}
