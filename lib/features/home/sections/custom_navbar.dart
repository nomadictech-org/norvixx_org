import 'package:flutter/material.dart';

class NorvixNavbar extends StatelessWidget {
  final double scrollOffset;
  final void Function(GlobalKey key) onNavigate;

  final GlobalKey herokey;
  final GlobalKey servicesKey;
  final GlobalKey whyKey;
  final GlobalKey contactKey;

  const NorvixNavbar({
    super.key,
    required this.scrollOffset,
    required this.onNavigate,
    required this.herokey,
    required this.servicesKey,
    required this.whyKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    final bool scrolled = scrollOffset > 60;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: scrolled
            ? const Color(0xFF0B0F1A).withOpacity(0.65)
            : Colors.transparent,
        border: scrolled
            ? Border(bottom: BorderSide(color: Colors.white.withOpacity(0.06)))
            : null,
      ),
      child: Row(
        children: [
          // 🔹 LOGO (scroll to top)
          InkWell(
            onTap: () {
              // scroll to services or top (your choice)
              onNavigate(herokey);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 4.0,
                  ), // tweak this value
                  child: Icon(Icons.terrain, color: Colors.white, size: 36.0),
                ),
                SizedBox(width: 8.0),
                const Text(
                  "norvixx",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.8,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // 🔹 NAV ITEMS (NOW WORKING)
          _NavItem("Services", () => onNavigate(servicesKey)),
          _NavItem("Why Norvix", () => onNavigate(whyKey)),

          const SizedBox(width: 24),

          // 🔹 CTA
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white.withOpacity(0.4)),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            ),
            onPressed: () => onNavigate(contactKey),
            child: const Text(
              "Let’s Talk",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.85),
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
