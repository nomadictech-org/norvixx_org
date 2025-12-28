import 'package:flutter/material.dart';

class NorvixFooter extends StatelessWidget {
  const NorvixFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0B0F1A), // Nordic dark
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMobile ? _mobileTop() : _desktopTop(),
          const SizedBox(height: 80),
          const Divider(color: Colors.white12),
          const SizedBox(height: 32),
          const _FooterBottom(),
        ],
      ),
    );
  }

  Widget _desktopTop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(flex: 4, child: _BrandBlock()),
        Expanded(
          flex: 3,
          child: _FooterColumn(
            title: "Services",
            items: [
              "Web & Mobile Applications",
              "Automation & Integration",
              "ERP Solutions & Customization",
              "Cloud Solutions",
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: _FooterColumn(
            title: "Company",
            items: ["About Norvix", "How We Work", "Careers"],
          ),
        ),
        Expanded(
          flex: 3,
          child: _FooterColumn(
            title: "Contact",
            items: ["hello@norvix.tech", "+91 77965 43960", "LinkedIn"],
          ),
        ),
      ],
    );
  }

  Widget _mobileTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _BrandBlock(),
        SizedBox(height: 48),
        _FooterColumn(
          title: "Services",
          items: [
            "Web & Mobile Development",
            "Automation & AI",
            "System Architecture",
            "Cloud Solutions",
          ],
        ),
        SizedBox(height: 40),
        _FooterColumn(
          title: "Company",
          items: ["About Norvix", "How We Work", "Careers"],
        ),
        SizedBox(height: 40),
        _FooterColumn(
          title: "Contact",
          items: ["hello@norvix.tech", "+91 77965 43960", "LinkedIn"],
        ),
      ],
    );
  }
}

class _BrandBlock extends StatelessWidget {
  const _BrandBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "NORVIX",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Engineering scalable systems inspired by Nordic clarity and nomadic adaptability.",
          style: TextStyle(
            fontSize: 14.5,
            height: 1.7,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const _FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 13,
            letterSpacing: 1.3,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 18),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              item,
              style: TextStyle(
                fontSize: 14.5,
                color: Colors.white.withOpacity(0.85),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FooterBottom extends StatelessWidget {
  const _FooterBottom();

  @override
  Widget build(BuildContext context) {
    return Text(
      "© ${DateTime.now().year} Norvix. All rights reserved.",
      style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.5)),
    );
  }
}
