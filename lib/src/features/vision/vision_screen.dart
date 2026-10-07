import 'package:flutter/material.dart';

enum VisionMode { sign, ocr, object, face }

class VisionScreen extends StatelessWidget {
  const VisionScreen({super.key, required this.mode});
  final VisionMode mode;
  @override Widget build(BuildContext context) {
    final (title, message, icon) = switch (mode) {
      VisionMode.sign => ('Sign language', 'A verified MediaPipe gesture model must be bundled before this feature can run. It will support only Closed Fist, Open Palm, Pointing Up, Thumb Down, Thumb Up, Victory and I Love You—not general sign-language translation.', Icons.sign_language),
      VisionMode.ocr => ('OCR', 'The Android ML Kit OCR runtime is configured in pubspec. Run this project with Flutter to download Android dependencies and test camera processing on a physical device.', Icons.document_scanner),
      VisionMode.object => ('Object detection', 'The Android ML Kit on-device object detector runtime is configured in pubspec. Bounding-box rendering requires physical-camera validation before release.', Icons.center_focus_strong),
      VisionMode.face => ('Face recognition', 'Face identification is disabled. No verified redistributable embedding model or local enrollment-template implementation is included yet; a face detector must never be presented as recognition.', Icons.face),
    };
    return Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 56), const SizedBox(height: 20), Text(message, textAlign: TextAlign.center), const SizedBox(height: 16), const Text('See assets/models/MODEL_CATALOG.md for the exact release gate.', textAlign: TextAlign.center)]))));
  }
}
