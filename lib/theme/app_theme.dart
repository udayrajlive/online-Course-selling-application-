// Contains the ThemeData for the app


import 'package:course_selling_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ColorScheme get dark => darkColorScheme;
  static ColorScheme get light => lightColorScheme;

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary40,
    onPrimary: AppColors.primary100,
    primaryContainer: AppColors.primary90,
    onPrimaryContainer: AppColors.primary10,
    secondary: AppColors.secondary40,
    onSecondary: AppColors.secondary100,
    secondaryContainer: AppColors.secondary90,
    onSecondaryContainer: AppColors.secondary10,
    tertiary: AppColors.tertiary40,
    onTertiary: AppColors.tertiary100,
    tertiaryContainer: AppColors.tertiary90,
    onTertiaryContainer: AppColors.tertiary10,
    error: AppColors.error40,
    errorContainer: AppColors.error90,
    onError: AppColors.error100,
    onErrorContainer: AppColors.error10,
    background: AppColors.neutral99,
    onBackground: AppColors.neutral10,
    surface: AppColors.neutral99,
    onSurface: AppColors.neutral10,
    surfaceVariant: AppColors.neutralVariant90,
    onSurfaceVariant: AppColors.neutralVariant30,
    outline: AppColors.neutralVariant60,
    onInverseSurface: Color(0xFFFFEDE9),
    inverseSurface: Color(0xFF5F150A),
    inversePrimary: Color(0xFFFFB59E),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF9B4428),
    outlineVariant: Color(0xFFD8C2BC),
    scrim: Color(0xFF000000),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary80,
    onPrimary: AppColors.primary20,
    primaryContainer: AppColors.primary30,
    onPrimaryContainer: AppColors.primary90,
    secondary: AppColors.secondary80,
    onSecondary: AppColors.secondary20,
    secondaryContainer: AppColors.secondary30,
    onSecondaryContainer: AppColors.secondary90,
    tertiary: AppColors.tertiary80,
    onTertiary: AppColors.tertiary20,
    tertiaryContainer: AppColors.tertiary30,
    onTertiaryContainer: AppColors.tertiary90,
    error: AppColors.error80,
    errorContainer: AppColors.error30,
    onError: AppColors.error20,
    onErrorContainer: AppColors.error90,
    background: AppColors.neutral10,
    onBackground: AppColors.neutral90,
    surface: AppColors.neutral10,
    onSurface: AppColors.neutral80,
    surfaceVariant: AppColors.neutralVariant30,
    onSurfaceVariant: AppColors.neutralVariant80,
    outline: AppColors.neutralVariant60,
    onInverseSurface: Color(0xFF3F0300),
    inverseSurface: Color(0xFFFFDAD4),
    inversePrimary: Color(0xFF9B4428),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFFFB59E),
    outlineVariant: Color(0xFF53433F),
    scrim: Color(0xFF000000),
  );

  /// light Theme
  static ThemeData appLightThemeData = ThemeData(
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primary40,
    colorScheme: AppTheme.lightColorScheme,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        letterSpacing: 0.25,
        // height: 64,
        fontSize: 36,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        letterSpacing: 0,
        fontSize: 45,
// height: 52,
        color: Colors.black,
      ),
      displaySmall:
          TextStyle(color: Colors.black, letterSpacing: 0, fontSize: 36),
      headlineLarge:
          TextStyle(color: Colors.black, letterSpacing: 0, fontSize: 32),
      headlineMedium: TextStyle(
        color: Colors.black,
        letterSpacing: 0,
        fontSize: 28,
        // height: 36,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        letterSpacing: 0,
        fontSize: 24,
        // height: 32
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        letterSpacing: 0,
        fontSize: 22,
        // height: 28
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        letterSpacing: 0,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        letterSpacing: 0,
        fontSize: 14,
        // height: 20
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        letterSpacing: 0.1,
        fontSize: 16,
        // height: 20,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        letterSpacing: 0.5,
        fontSize: 12,
        // height: 16,
      ),
      bodySmall: TextStyle(color: Colors.black),
    ).apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    tabBarTheme: const TabBarTheme(),
    appBarTheme: const AppBarTheme(
      
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
      backgroundColor: AppColors.lightBackground,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        overlayColor:
            MaterialStateProperty.resolveWith((states) => Colors.transparent),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            color: AppColors.primary60,
          ),
        ),
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary60),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // overlayColor: MaterialStateProperty.resolveWith<Color?>(
        //       (Set<MaterialState> states) {
        //     if (states.contains(MaterialState.pressed))
        //       return AppColors.primary40; //<-- SEE HERE
        //     return null; // refer to the widget's default.
        //   },
        // ),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary60),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        textBaseline: TextBaseline.alphabetic,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xff85736E),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 3, color: AppColors.primary40),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xff85736E),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 3, color: AppColors.primary40),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
        // backgroundColor: AppColors.lightBackground,
        // contentTextStyle:AppTheme.appLightThemeData.textTheme.labelLarge!
        //   .copyWith(
        // color: AppColors.primary100, fontWeight: FontWeight.normal,

        // elevation: 20
        ),
  );

  /// Dark theme
  static ThemeData appDarkThemeData = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    colorScheme: AppTheme.darkColorScheme,
  );
}
