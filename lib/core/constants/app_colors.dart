import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color mint = Color(0xFF98FF98); // Mint Green
  static const Color lavender = Color(0xFFE6E6FA); // Soft Lavender
  static const Color skyBlue = Color(0xFFAEC6CF); // Baby Blue
  static const Color peach = Color(0xFFFFB6C1); // Pastel Pink
  static const Color lemon = Color(0xFFFFFACD); // Soft Yellow

  // Status Colors
  static const Color success = Color(0xFF98FF98); // Mint Green
  static const Color warning = Color(0xFFFFFACD); // Soft Yellow
  static const Color error = Color(0xFFFFB5A7); // Soft Red/Peach
  static const Color info = Color(0xFFAEC6CF); // Baby Blue

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF2C3E50); // Dark Blue instead of Black
  static const Color textSecondaryLight = Color(0xFF8A939B); // Light Gray
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFFA0AEC0);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8F9FA); // Off-white
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
