import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onServices;
  final VoidCallback onWhy;
  final VoidCallback onContact;
  final double scrollOffset;

  const NavBar({
    super.key,
    required this.onServices,
    required this.onWhy,
    required this.onContact,
    required this.scrollOffset,
  });

  @override
  Widget build(BuildContext context) {
    final bool isScrolled = scrollOffset > 20;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      decoration: BoxDecoration(
        color: isScrolled ? Colors.black.withOpacity(0.75) : Colors.transparent,
        boxShadow: isScrolled
            ? [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 12)]
            : [],
      ),
      child: Row(
        children: [
          const Text(
            'NORVIX',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          _NavItem('Services', onServices),
          _NavItem('Why Norvix', onWhy),
          _NavItem('Contact', onContact),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(label, style: const TextStyle(color: Colors.white70)),
    );
  }
}
