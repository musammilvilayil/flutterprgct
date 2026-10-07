import 'package:flutter/material.dart';
import '../../core/settings/app_settings.dart';
import '../settings/settings_screen.dart';
import '../speech/speech_screen.dart';
import '../vision/vision_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.settings});
  final AppSettings settings;

  static const _features = <({String title, String subtitle, IconData icon})>[
    (title: 'Sign Language', subtitle: 'Supported hand gestures only', icon: Icons.sign_language),
    (title: 'Speech', subtitle: 'Offline speech-to-text and text-to-speech', icon: Icons.mic),
    (title: 'OCR', subtitle: 'Read printed text using the camera', icon: Icons.document_scanner),
    (title: 'Object Detection', subtitle: 'Describe nearby objects in real time', icon: Icons.center_focus_strong),
    (title: 'Face Recognition', subtitle: 'Only locally enrolled people can be identified', icon: Icons.face),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Universal Accessibility Assistant'), actions: [
        IconButton(tooltip: 'Settings', icon: const Icon(Icons.settings), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen(settings: settings))))
      ]),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Offline accessibility tools', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            const Text('Core processing stays on the device. Each tool requests permission only when opened.'),
            const SizedBox(height: 20),
            ..._features.map((feature) => Card(
              child: ListTile(
                minVerticalPadding: 16,
                leading: Icon(feature.icon, size: 32),
                title: Text(feature.title),
                subtitle: Text(feature.subtitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => switch (feature.title) {
                  'Speech' => SpeechScreen(settings: settings),
                  'OCR' => const VisionScreen(mode: VisionMode.ocr),
                  'Object Detection' => const VisionScreen(mode: VisionMode.object),
                  'Sign Language' => const VisionScreen(mode: VisionMode.sign),
                  _ => const VisionScreen(mode: VisionMode.face),
                })),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
