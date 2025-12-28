import 'package:flutter/material.dart';

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore further.\nBuild without limits.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              height: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Innovative solutions for a connected world',
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),

          const SizedBox(height: 32),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2F80ED),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Text('Get Started', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
