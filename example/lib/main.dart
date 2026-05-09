import 'package:flutter/material.dart';
import 'package:pressable_button/pressable_button.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pressable Button Demo',
      home: const HomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: Center(
        child: PressableButton(
          width: 220,
          height: 80,
          color: Colors.green,
          pressDepth: 24,
          borderRadius: 24,
          onPressed: () {
            debugPrint('button pressed');
          },
          child: const Text(
            'Click Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
