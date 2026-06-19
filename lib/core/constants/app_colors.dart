import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color mint = Color(0xFF00D4B8);
  static const Color lavender = Color(0xFFB19CD9);
  static const Color skyBlue = Color(0xFF4CC9F0);
  static const Color peach = Color(0xFFFFB5A7);
  static const Color lemon = Color(0xFFF9F871);

  // Status Colors
  static const Color success = Color(0xFF4ADE80);
  static const Color warning = Color(0xFFFACC15);
  static const Color error = Color(0xFFF87171);
  static const Color info = Color(0xFF60A5FA);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF2D3748);
  static const Color textSecondaryLight = Color(0xFF718096);
  static const Color textPrimaryDark = Color(0xFFF7FAFC);
  static const Color textSecondaryDark = Color(0xFFA0AEC0);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Colors.white;

  // Galaxy Dark Mode Colors
  static const Color galaxyDarkBg = Color(0xFF0B0F19); // Deep space blue
  static const Color galaxySurface = Color(0xFF1A202C);

  // Gradients
  static const LinearGradient kawaiiGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [mint, skyBlue],
  );

  static const LinearGradient galaxyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2B1055), Color(0xFF7597DE)], // Purple to soft blue
  );
}
