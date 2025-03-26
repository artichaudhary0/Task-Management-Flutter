import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF344955);
  static const Color secondary = Color(0xFFE8F0F2);
  static const Color accent = Color(0xFF4A6572);
  static const Color background = Color(0xFFF5F5F5);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color red = Colors.redAccent;
  static const Color lightMint = Color(0xFFB8D8D8);
  static const Color softBlue = Color(0xFFDCE6E6);
  static const Color darkText = Color(0xFF344955);
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle normal = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}

class AppButtonStyles {
  static ButtonStyle elevatedButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static ButtonStyle textButton = TextButton.styleFrom(
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    dialogBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      titleLarge: AppTextStyles.heading,
      bodyLarge: AppTextStyles.normal,
    ),
  );
}
