import 'package:flutter/material.dart';
import 'package:norvix/features/home/sections/cta_section.dart';
import 'package:norvix/features/home/sections/custom_navbar.dart';
import 'package:norvix/features/home/sections/footer_section.dart';
import 'package:norvix/features/home/sections/hero_section.dart';
import 'package:norvix/features/home/sections/how_we_work.dart';
import 'package:norvix/features/home/sections/services_section.dart';
import 'package:norvix/features/home/sections/why_norvix_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  final herokey = GlobalKey();
  final servicesKey = GlobalKey();
  final whyKey = GlobalKey();
  final contactKey = GlobalKey();

  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() => offset = controller.offset);
    });
  }

  // void scrollTo(GlobalKey key) {
  //   Scrollable.ensureVisible(
  //     key.currentContext!,
  //     duration: const Duration(milliseconds: 600),
  //     curve: Curves.easeOut,
  //   );
  // }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,

      // 🔑 THIS IS THE KEY PART
      alignment: 0.50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                HeroSection(
                  key: herokey,
                  onGetStarted: () => scrollTo(servicesKey),
                ),
                ServicesSplitSection(key: servicesKey),
                WhyNorvixHeroSection(key: whyKey),
                HowWeWorkSection(),
                NorvixCTASection(key: contactKey),
                NorvixFooter(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NorvixNavbar(
              scrollOffset: offset,
              onNavigate: (key) => scrollTo(key),
              herokey: herokey,
              servicesKey: servicesKey,
              whyKey: whyKey,
              contactKey: contactKey,
            ),
          ),
        ],
      ),
    );
  }
}
