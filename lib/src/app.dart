import 'package:flutter/material.dart';
import 'core/settings/app_settings.dart';
import 'features/home/home_screen.dart';

class AccessibilityAssistantApp extends StatefulWidget {
  const AccessibilityAssistantApp({super.key});
  @override State<AccessibilityAssistantApp> createState() => _AccessibilityAssistantAppState();
}

class _AccessibilityAssistantAppState extends State<AccessibilityAssistantApp> {
  AppSettings? _settings;
  @override void initState() { super.initState(); AppSettings.load().then((value) { if (mounted) setState(() => _settings = value); }); }

  @override
  Widget build(BuildContext context) {
    final settings = _settings;
    if (settings == null) return const MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));
    return AnimatedBuilder(
      animation: settings,
      builder: (_, __) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accessibility Assistant',
      themeMode: settings.isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      darkTheme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo, brightness: Brightness.dark),
      home: HomeScreen(settings: settings),
    ));
  }
}
