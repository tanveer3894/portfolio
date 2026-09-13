import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary brand colors (Flutter Cyan & Blue)
  static const Color primary = Color(0xFF00D2FF);
  static const Color primaryDark = Color(0xFF02569B);
  static const Color accent = Color(0xFF38BDF8);
  static const Color secondary = Color(0xFF818CF8);

  // Background & Surface
  static const Color background = Color(0xFF0B0F19);
  static const Color cardBackground = Color(0xFF131B2E);
  static const Color cardBackgroundHover = Color(0xFF18233C);
  static const Color surface = Color(0xFF1E293B);
  static const Color surfaceLight = Color(0xFF334155);

  // Borders & Dividers
  static const Color border = Color(0xFF1E293B);
  static const Color borderHighlight = Color(0x3338BDF8);

  // Typography
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // States
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00D2FF), Color(0xFF02569B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF131B2E), Color(0xFF0F172A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0x3300D2FF), Color(0x1102569B), Colors.transparent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
