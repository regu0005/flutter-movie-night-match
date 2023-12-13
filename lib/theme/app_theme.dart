import 'package:flutter/material.dart';

class AppTheme {
  static final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    background: Colors.white,
  );

  // Text styles
  static const TextStyle myTitleStyle = TextStyle(
    fontFamily: 'Gotham-Narrow-Light',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle mySubtitleStyle = TextStyle(
    fontFamily: 'Gotham-Narrow-Light',
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle myDescriptionStyle = TextStyle(
    fontFamily: 'Gotham-Narrow-Light',
    fontSize: 16,
  );

  static const TextStyle myHeroTextStyle1 = TextStyle(
    fontFamily: 'Gotham-Narrow-Light',
    fontSize: 18,
    color: Color(0xFFFFEB3B),
  );

  static const TextStyle myHeroTextStyle3 = TextStyle(
    fontFamily: 'Times-New-Roman',
    fontStyle: FontStyle.italic,
    fontSize: 28,
    color: Colors.yellow,
    height: 1.2,
  );

  static const TextStyle myHeroTextStyle2 = TextStyle(
    fontFamily: 'Gotham-Narrow-Ultra',
    fontSize: 42,
    color: Colors.white,
    height: 0.8,
  );

  static final ButtonStyle myFormButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: colorScheme.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  ).copyWith(
    textStyle: MaterialStateProperty.all<TextStyle>(
      const TextStyle(
        fontFamily: 'Gotham-Narrow-Light',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // Backgrounds
  static const Color myBackgroundColor1 = Colors.black87;
  static const Color myBackgroundColor2 = Color.fromARGB(221, 220, 220, 220);
  static const Color myForegroundColor1 = Colors.white;

  // Theme for material 3
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: TextTheme(
        displayLarge: myTitleStyle.copyWith(color: colorScheme.onBackground),
        displayMedium:
            mySubtitleStyle.copyWith(color: colorScheme.onBackground),
        bodyLarge: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            fontStyle: FontStyle.normal),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: myForegroundColor1,
        backgroundColor: myBackgroundColor1,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: myFormButtonStyle),
    );
  }
}
