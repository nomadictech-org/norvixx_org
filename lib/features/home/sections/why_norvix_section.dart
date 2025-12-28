import 'package:flutter/material.dart';

class WhyNorvixHeroSection extends StatelessWidget {
  const WhyNorvixHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.85,
      width: size.width,
      child: Stack(
        children: [
          // Right-side image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg/bg8.jpg', // replace with Nordic image
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
            ),
          ),

          // Dark gradient overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF0B0F1A),
                    Color(0xCC0B0F1A),
                    Color(0x660B0F1A),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: _content(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "WHY NORVIX",
          style: TextStyle(
            fontSize: 13,
            letterSpacing: 1.6,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          "Engineering\nthat lasts.",
          style: TextStyle(
            fontSize: 46,
            fontWeight: FontWeight.w700,
            height: 1.1,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Norvix builds scalable software systems inspired by Nordic clarity and nomadic adaptability. "
          "We help companies design, automate, and evolve technology that grows with them.",
          style: TextStyle(
            fontSize: 16,
            height: 1.8,
            color: Colors.white.withOpacity(0.75),
          ),
        ),
      ],
    );
  }
}
