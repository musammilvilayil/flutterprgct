import 'package:flutter/material.dart';
import '../shared/feature_placeholder_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _features = <({String title, String subtitle, IconData icon})>[
    (title: 'Sign Language', subtitle: 'Recognize supported signs on-device', icon: Icons.sign_language),
    (title: 'Object Detection', subtitle: 'Describe nearby objects in real time', icon: Icons.center_focus_strong),
    (title: 'Read Text (OCR)', subtitle: 'Read printed text using the camera', icon: Icons.document_scanner),
    (title: 'Speech to Text', subtitle: 'Convert speech into readable text', icon: Icons.mic),
    (title: 'Text to Speech', subtitle: 'Speak typed or recognized text', icon: Icons.record_voice_over),
    (title: 'Face Recognition', subtitle: 'Recognize enrolled people locally', icon: Icons.face),
    (title: 'Emotion', subtitle: 'Estimate visible facial expression', icon: Icons.sentiment_satisfied),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Accessibility Assistant')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Offline accessibility tools', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            const Text('Core AI is designed to run on the device. Cloud sync is optional.'),
            const SizedBox(height: 20),
            ..._features.map((feature) => Card(
              child: ListTile(
                minVerticalPadding: 16,
                leading: Icon(feature.icon, size: 32),
                title: Text(feature.title),
                subtitle: Text(feature.subtitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => FeaturePlaceholderScreen(title: feature.title),
                )),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
