import 'package:flutter/material.dart';

enum PasswordStrength {
  none(percent: 0, color: Color(0xFF6C6C6c), text: ''),
  tooShort(percent: 0, color: Color(0xFF6C6C6c), text: 'Too Short'),
  weak(percent: 0.25, color: Color(0xFFE05151), text: 'Weak'),
  fair(percent: 0.5, color: Color(0xFFE3A063), text: 'Fair'),
  good(percent: 0.75, color: Color(0xFF647FFF), text: 'Good'),
  strong(percent: 1, color: Color(0xFF91E2B7), text: 'Strong');

  final double percent;
  final Color color;
  final String text;

  const PasswordStrength({
    required this.percent,
    required this.color,
    required this.text,
  });
}
