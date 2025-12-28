import 'package:flutter/material.dart';
import 'package:norvix/features/contact/contact_page.dart';

class NorvixCTASection extends StatefulWidget {
  const NorvixCTASection({super.key});

  @override
  State<NorvixCTASection> createState() => _NorvixCTASectionState();
}

class _NorvixCTASectionState extends State<NorvixCTASection> {
  bool showContact = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 120),
      color: const Color(0xFF0B0F1A),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// LEFT — CTA CONTENT
              Expanded(
                child: _LeftCTA(
                  onPressed: () {
                    setState(() => showContact = true);
                  },
                ),
              ),

              const SizedBox(width: 80),

              /// RIGHT — CONTACT FORM (Animated)
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.2, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: showContact
                    ? const ContactForm()
                    : const SizedBox(width: 420),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeftCTA extends StatelessWidget {
  final VoidCallback onPressed;
  const _LeftCTA({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "READY WHEN YOU ARE.",
            style: TextStyle(
              fontSize: 13,
              letterSpacing: 1.4,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "Let’s build something\nthat lasts.",
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w700,
              height: 1.15,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Whether you’re exploring an idea or ready to build, "
            "we’re here to help you move forward with clarity and confidence.",
            style: TextStyle(
              fontSize: 16,
              height: 1.8,
              color: Colors.white.withOpacity(0.75),
            ),
          ),
          const SizedBox(height: 40),
          _CTAButton(onTap: onPressed),
        ],
      ),
    );
  }
}

class _CTAButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CTAButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFE6FFD8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Contact us",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, size: 18, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
