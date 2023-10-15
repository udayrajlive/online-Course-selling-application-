// Contains all app's text styles.

import 'package:flutter/material.dart';

class AppTextStyle {
  static TextTheme get appTextTheme => TextTheme(
        displayLarge: const TextStyle(color: Colors.black),
        displayMedium: const TextStyle(color: Colors.black),
        displaySmall: const TextStyle(color: Colors.black),
        headlineLarge: const TextStyle(color: Colors.black),
        headlineMedium: const TextStyle(color: Colors.black),
        headlineSmall: const TextStyle(color: Colors.black),
        titleLarge: const TextStyle(color: Colors.black),
        titleMedium: const TextStyle(color: Colors.black),
        titleSmall: const TextStyle(color: Colors.black),
        bodyLarge: const TextStyle(color: Colors.black),
        bodyMedium: const TextStyle(color: Colors.black),
        bodySmall: const TextStyle(color: Colors.black).apply(
          color: Colors.black,
        ),
      );
}
