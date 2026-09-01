import 'package:flutter/material.dart';

void main() {
  runApp(const IslamTubeApp());
}

class IslamTubeApp extends StatelessWidget {
  const IslamTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IslamTube',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text('IslamTube')),
        body: const Center(
          child: Text('Welcome to IslamTube App!'),
        ),
      ),
    );
  }
}
