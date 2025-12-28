import 'package:flutter/material.dart';

class CtnInputField extends StatelessWidget {
  final String label;
  final int maxLines;

  const CtnInputField({super.key, required this.label, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        filled: true,
        fillColor: const Color(0xFF0B0F1A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

enum ContactStep { form, sending, success }
