import 'package:flutter/material.dart';
import '../../core/settings/app_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.settings});
  final AppSettings settings;
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Settings')), body: ListView(children: [
    SwitchListTile(title: const Text('Dark mode'), value: settings.isDark, onChanged: settings.setDark),
    SwitchListTile(title: const Text('Read results aloud'), subtitle: const Text('Applies where a module supports speech.'), value: settings.readAloud, onChanged: settings.setReadAloud),
    const AboutListTile(applicationName: 'AI Universal Accessibility Assistant', applicationVersion: '0.2.0', applicationLegalese: 'Emotion recognition is not included. See MODEL_CATALOG.md for model/runtime notices.'),
  ]));
}
