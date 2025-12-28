import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final ServiceItem service;
  final bool isActive;

  const ServiceCard({super.key, required this.service, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isActive
              ? [
                  const Color(0xFF0B2A18), // deep green
                  const Color(0xFF061A10),
                ]
              : [const Color(0xFFF8F9FB), const Color(0xFFFFFFFF)],
        ),
        boxShadow: [
          BoxShadow(
            color: isActive
                ? Colors.black.withOpacity(0.35)
                : Colors.black.withOpacity(0.05),
            blurRadius: isActive ? 28 : 10,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 🔺 Diagonal image (ONLY when active)
          if (isActive && service.image != null)
            Positioned(
              right: -24,
              bottom: -24,
              child: Transform.rotate(
                angle: -0.35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Opacity(
                    opacity: 0.55,
                    child: Image.asset(
                      service.image!,
                      width: 180,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

          // 🌫️ Soft overlay for polish
          if (isActive)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

          // 📌 Content
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  service.icon,
                  size: 26,
                  color: isActive ? Colors.white : Colors.black87,
                ),
                const Spacer(),
                Text(
                  service.subtitle.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1.3,
                    color: isActive
                        ? Colors.white70
                        : Colors.black.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  service.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final String? image; // NEW

  ServiceItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.image,
  });
}
