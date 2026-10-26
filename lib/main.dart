import 'package:flutter/material.dart';
import 'dart:math';
import 'flag.dart';
import 'widget_card.dart';

void main() {
  runApp(const FlagApp());
}

class FlagApp extends StatelessWidget {
  const FlagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Угадай флаг',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const FlagHomePage(),
    );
  }
}

class FlagHomePage extends StatefulWidget {
  const FlagHomePage({super.key});

  @override
  State<FlagHomePage> createState() => _FlagHomePageState();
}

class _FlagHomePageState extends State<FlagHomePage> {
  final List<Map<String, String>> _flags = [
    {'country': 'Япония', 'image': 'assets/images/flag3.png'},
    {'country': 'Бразилия', 'image': 'assets/images/flag1.png'},
    {'country': 'Канада', 'image': 'assets/images/flag2.png'},
  ];

  int _currentIndex = 0;
  final Random _random = Random();

  void _nextFlag() {
    setState(() {
      int next = _random.nextInt(_flags.length);
      if (_flags.length > 1 && next == _currentIndex) {
        next = (next + 1) % _flags.length;
      }
      _currentIndex = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    final flag = _flags[_currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text('Угадай флаг'),
        backgroundColor: const Color(0xFF00B4DB),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flag(
                  country: flag['country']!,
                  imagePath: flag['image']!,
                ),
                const SizedBox(height: 28),
                WidgetCard(
                  label: 'Следующий',
                  onPressed: _nextFlag,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}