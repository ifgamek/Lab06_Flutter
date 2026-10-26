import 'package:flutter/material.dart';
import 'widgets/flag.dart';
import 'widgets/button.dart';

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
    {'country': 'Япония', 'image': 'assets/images/flag1.png'},
    {'country': 'Бразилия', 'image': 'assets/images/flag2.png'},
    {'country': 'Канада', 'image': 'assets/images/flag3.png'},
  ];

  int _currentIndex = 0;

  void _nextFlag() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flags.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final flag = _flags[_currentIndex];

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Угадай флаг',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FlagCard(
                    country: flag['country']!,
                    imagePath: flag['image']!,
                  ),
                  const SizedBox(height: 28),
                  CustomButton(
                    label: 'Следующий',
                    onPressed: _nextFlag,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}