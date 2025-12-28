import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onGetStarted;
  const HeroSection({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          // 🌌 Background Image
          Positioned.fill(
            child: Image.asset('assets/images/bg/bg1.jpg', fit: BoxFit.cover),
          ),

          // 🌑 Dark Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.65),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),

          // 🧭 Navigation Bar
          // Positioned(top: 0, left: 0, right: 0, child: NavBar()),

          // 🦸 Hero Content
          // 🦸 Hero Content (Animated)
          Positioned(
            left: size.width * 0.08,
            top: size.height * 0.28,
            child: HeroContentAnimated(onGetStarted: onGetStarted),
          ),
        ],
      ),
    );
  }
}

class HeroContentAnimated extends StatefulWidget {
  final VoidCallback onGetStarted;
  const HeroContentAnimated({super.key, required this.onGetStarted});

  @override
  State<HeroContentAnimated> createState() => _HeroContentAnimatedState();
}

class _HeroContentAnimatedState extends State<HeroContentAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _titleOpacity;
  late Animation<Offset> _titleOffset;

  late Animation<double> _textOpacity;
  late Animation<Offset> _textOffset;

  late Animation<double> _buttonOpacity;
  late Animation<Offset> _buttonOffset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _titleOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.4)),
    );
    _titleOffset = Tween(begin: const Offset(0, 0.25), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.4)),
        );

    _textOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.3, 0.7)),
    );
    _textOffset = Tween(begin: const Offset(0, 0.25), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.3, 0.7)),
    );

    _buttonOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1.0)),
    );
    _buttonOffset = Tween(begin: const Offset(0, 0.25), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1.0)),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideTransition(
          position: _titleOffset,
          child: FadeTransition(
            opacity: _titleOpacity,
            child: const Text(
              "Build fast.\nScale smarter.",
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        SlideTransition(
          position: _textOffset,
          child: FadeTransition(
            opacity: _textOpacity,
            child: const Text(
              "Clean, modern software experiences\nwith smooth animations.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                height: 1.6,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        SlideTransition(
          position: _buttonOffset,
          child: FadeTransition(
            opacity: _buttonOpacity,
            child: ElevatedButton(
              onPressed: widget.onGetStarted,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Get Started"),
            ),
          ),
        ),
      ],
    );
  }
}
