import 'package:flutter/material.dart';
import 'features/home/home_screen.dart';

class AccessibilityAssistantApp extends StatelessWidget {
  const AccessibilityAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accessibility Assistant',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}
