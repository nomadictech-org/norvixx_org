import 'dart:math';
import 'package:flutter/material.dart';

/// =========================================================
/// HOW WE WORK – NORVIX SECTION ONLY (SAFE & CLEAN)
/// =========================================================

class HowWeWorkSection extends StatelessWidget {
  const HowWeWorkSection({super.key});

  static const Color _dark = Color(0xFF0B0F14);
  static const Color _darkSoft = Color(0xFF141A22);
  static const Color _accent = Color(0xFF5E6AD2);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      color: _dark,
      child: Column(
        children: [
          /// HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 110),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [_dark, _darkSoft],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const _HowWeWorkHeader(),
          ),

          /// FLOATING CARDS
          Transform.translate(
            offset: const Offset(0, -64),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: isMobile ? _mobileSteps() : _desktopSteps(),
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------- DESKTOP ----------------
  static Widget _desktopSteps() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 26,
      childAspectRatio: 1.02,
      children: [
        WorkStepCard(
          step: "1",
          icon: Icons.search_rounded,
          title: "Discover",
          description: "Understand goals, constraints, and long-term vision.",
        ),
        WorkStepCard(
          step: "2",
          icon: Icons.architecture_rounded,
          title: "Design",
          description: "Create scalable architecture and calm interfaces.",
        ),
        WorkStepCard(
          step: "3",
          icon: Icons.code_rounded,
          title: "Build",
          description: "Develop reliable systems with strong foundations.",
        ),
        WorkStepCard(
          step: "4",
          icon: Icons.trending_up_rounded,
          title: "Scale",
          description: "Optimize, automate, and evolve with growth.",
        ),
      ],
    );
  }

  /// ---------------- MOBILE ----------------
  static Widget _mobileSteps() {
    return Column(
      children: [
        WorkStepCard(
          step: "1",
          icon: Icons.search_rounded,
          title: "Discover",
          description: "Understand goals and long-term vision.",
        ),
        const SizedBox(height: 24),
        WorkStepCard(
          step: "2",
          icon: Icons.architecture_rounded,
          title: "Design",
          description: "Create scalable architecture.",
        ),
        const SizedBox(height: 24),
        WorkStepCard(
          step: "3",
          icon: Icons.code_rounded,
          title: "Build",
          description: "Develop reliable systems.",
        ),
        const SizedBox(height: 24),
        WorkStepCard(
          step: "4",
          icon: Icons.trending_up_rounded,
          title: "Scale",
          description: "Evolve with business growth.",
        ),
      ],
    );
  }
}

/// =========================================================
/// HEADER
/// =========================================================

class _HowWeWorkHeader extends StatelessWidget {
  const _HowWeWorkHeader();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 760),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "HOW WE WORK",
            style: TextStyle(
              fontSize: 13,
              letterSpacing: 1.4,
              color: Colors.white.withOpacity(0.55),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "A calm, structured approach\nto building software.",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              height: 1.2,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "We follow a clear, engineering-driven process that minimizes risk "
            "and supports long-term scalability.",
            style: TextStyle(
              fontSize: 15.5,
              height: 1.7,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

/// =========================================================
/// STEP CARD – POINTER TILT + LIGHT REFLECTION
/// =========================================================

class WorkStepCard extends StatefulWidget {
  final String step;
  final IconData icon;
  final String title;
  final String description;

  const WorkStepCard({
    super.key,
    required this.step,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<WorkStepCard> createState() => _WorkStepCardState();
}

class _WorkStepCardState extends State<WorkStepCard> {
  bool _hovered = false;
  Offset _pointer = Offset.zero;

  static const Color _accent = Color(0xFF5E6AD2);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _pointer = Offset.zero;
      }),
      onHover: (event) {
        final box = context.findRenderObject() as RenderBox?;
        if (box == null) return;
        final local = box.globalToLocal(event.position);
        final size = box.size;

        setState(() {
          _pointer = Offset(
            (local.dx / size.width) - 0.5,
            (local.dy / size.height) - 0.5,
          );
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transformAlignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..translate(0.0, _hovered ? -10.0 : 0.0)
          ..rotateX(_hovered ? -_pointer.dy * 0.15 : 0.0)
          ..rotateY(_hovered ? _pointer.dx * 0.15 : 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? _accent.withOpacity(0.35)
                  : Colors.black.withOpacity(0.15),
              blurRadius: _hovered ? 38 : 26,
              offset: Offset(0, _hovered ? 22 : 16),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(22, 56, 22, 26),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Icon(
                    widget.icon,
                    size: 48,
                    color: _hovered ? _accent : Colors.black.withOpacity(0.45),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.65,
                      color: Colors.black.withOpacity(0.65),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            /// STEP BADGE
            Positioned(
              top: -16,
              left: 0,
              right: 0,
              child: Center(
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: _accent,
                  child: Text(
                    widget.step,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
