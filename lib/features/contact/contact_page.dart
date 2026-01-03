import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:norvix/features/home/widgets/ctn_input.dart';

enum ContactStep { form, sending, success }

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm>
    with SingleTickerProviderStateMixin {
  ContactStep step = ContactStep.form;
  late final AnimationController _lottieController;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() => step = ContactStep.sending);
  }

  @override
  Widget build(BuildContext context) {
    /// SUCCESS → NORMAL BACKGROUND (NO CARD)
    if (step == ContactStep.success) {
      return _buildSuccessPlain();
    }

    /// FORM + ANIMATION → GLASS CARD
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          width: 420,
          padding: const EdgeInsets.all(36),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.15)),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.12),
                Colors.white.withOpacity(0.04),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: _buildStep(),
          ),
        ),
      ),
    );
  }

  Widget _buildStep() {
    switch (step) {
      case ContactStep.form:
        return _buildForm();
      case ContactStep.sending:
        return _buildAnimation();
      case ContactStep.success:
        return const SizedBox();
    }
  }

  // ---------------- FORM ----------------

  Widget _buildForm() {
    return Column(
      key: const ValueKey('form'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Contact Us",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),

        const CtnInputField(label: "Name"),
        const SizedBox(height: 16),
        const CtnInputField(label: "Email"),
        const SizedBox(height: 16),
        const CtnInputField(label: "Message", maxLines: 4),

        const SizedBox(height: 28),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE6FFD8),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              "Send message",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  // ---------------- ANIMATION (SAME SIZE AS FORM) ----------------

  Widget _buildAnimation() {
    return SizedBox(
      key: const ValueKey('sending'),
      height: 320,
      width: double.infinity,
      child: Lottie.asset(
        'assets/animation/done.json',
        controller: _lottieController,
        fit: BoxFit.contain,
        repeat: false,
        onLoaded: (composition) {
          _lottieController
            ..duration = composition.duration
            ..forward().whenComplete(() {
              setState(() => step = ContactStep.success);
            });
        },
      ),
    );
  }

  // ---------------- SUCCESS (NORMAL BACKGROUND) ----------------

  Widget _buildSuccessPlain() {
    return SizedBox(
      width: 420,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.check_circle_outline, color: Color(0xFFE6FFD8), size: 56),
          SizedBox(height: 16),
          Text(
            "We’ll contact you soon",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
