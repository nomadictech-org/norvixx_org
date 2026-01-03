import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:norvix/features/home/widgets/service_card.dart';

class ServicesSplitSection extends StatefulWidget {
  const ServicesSplitSection({super.key});

  @override
  State<ServicesSplitSection> createState() => _ServicesSplitSectionState();
}

class _ServicesSplitSectionState extends State<ServicesSplitSection> {
  int activeIndex = 0;
  late final List<ServiceItem> services;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    services = [
      ServiceItem(
        title: "Web & Mobile Applications",
        subtitle: "Custom & Scalable",
        description:
            "Build secure, high-performance custom web applications tailored to your business processes.",
        icon: Icons.web,
        image: 'assets/animation/web_development.json',
      ),
      ServiceItem(
        title: "Automation & Integration",
        subtitle: "Automate & Connect",
        description:
            "Design and develop intuitive mobile applications that deliver seamless user experiences.",
        icon: Icons.phone_android,
        image: 'assets/animation/automation.json',
      ),
      ServiceItem(
        title: "ERP Solutions & Customization",
        subtitle: "Business Automation",
        description:
            "Implement enterprise ERP systems to streamline operations, finance, and resource management.\nCustomize ERP modules and workflows to perfectly align with your unique business requirements.",
        icon: Icons.business_center_outlined,
        image: 'assets/animation/digital_animation.json',
      ),

      ServiceItem(
        title: "Cloud Solutions",
        subtitle: "Secure & Scalable",
        description:
            "Design robust cloud architectures that ensure scalability, security, and cost efficiency.",
        icon: Icons.cloud_outlined,
        image: 'assets/animation/cloud_transformation.json',
      ),
    ];

    _startAutoRotation();
  }

  void _startAutoRotation() {
    _timer = Timer.periodic(const Duration(seconds: 15), (_) {
      setState(() {
        activeIndex = (activeIndex + 1) % services.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Stack(
      children: [
        // 🌫️ Foggy background image
        Positioned(
          right: -120,
          top: -80,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Opacity(
              opacity: 0.18,
              child: Image.asset(
                'assets/images/bg/bg4.jpg', // your corner image
                width: 520,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // 🌑 Soft gradient overlay (Nordic feel)
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // ignore: deprecated_member_use
                  Colors.white.withOpacity(0.85),
                  // ignore: deprecated_member_use
                  Colors.white.withOpacity(0.95),
                ],
              ),
            ),
          ),
        ),

        // 🔹 Main content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 100),
          child: isMobile
              ? Column(
                  children: [
                    LeftServiceDetails(service: services[activeIndex]),
                    const SizedBox(height: 48),
                    RightServiceCards(
                      services: services,
                      activeIndex: activeIndex,
                      onSelect: _onCardSelect,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: LeftServiceDetails(service: services[activeIndex]),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 6,
                      child: RightServiceCards(
                        services: services,
                        activeIndex: activeIndex,
                        onSelect: _onCardSelect,
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  void _onCardSelect(int index) {
    setState(() => activeIndex = index);
  }
}

class LeftServiceDetails extends StatelessWidget {
  final ServiceItem service;

  const LeftServiceDetails({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position:
                Tween<Offset>(
                  begin: const Offset(0, 0.08),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                ),
            child: child,
          ),
        );
      },
      child: Container(
        key: ValueKey(service.title),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ TOP IMAGE (replaces green area)
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                children: [
                  Lottie.asset(
                    service.image!,
                    height: isMobile ? 220 : 280,
                    width: double.infinity,
                    repeat: false,
                  ),
                  // Image.asset(
                  //   service.image!,
                  //   width: double.infinity,
                  //   height: isMobile ? 220 : 280,
                  //   fit: BoxFit.cover,
                  // ),

                  // 🌫️ Soft dark overlay (Nordic feel)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // ignore: deprecated_member_use
                            Colors.black.withOpacity(0.25),
                            // ignore: deprecated_member_use
                            Colors.black.withOpacity(0.55),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // 🔹 SUBTITLE
            Text(
              service.subtitle.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w500,
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.55),
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 TITLE
            Text(
              service.title,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 18),

            // 🔹 DESCRIPTION
            Text(
              service.description,
              style: TextStyle(
                fontSize: 16,
                height: 1.7,
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RightServiceCards extends StatelessWidget {
  final List<ServiceItem> services;
  final int activeIndex;
  final Function(int) onSelect;

  const RightServiceCards({
    super.key,
    required this.services,
    required this.activeIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1.9,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onSelect(index),
          child: ServiceCard(
            service: services[index],
            isActive: index == activeIndex,
          ),
        );
      },
    );
  }
}
