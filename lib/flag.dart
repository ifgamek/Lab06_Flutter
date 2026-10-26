import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  final String country;
  final String imagePath;

  const Flag({
    super.key,
    required this.country,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              country,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF232526),
              ),
            ),
          ],
        ),
      ),
    );
  }
}